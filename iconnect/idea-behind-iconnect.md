Solution Proposal for UBUS interconnect 
---------------------------------------

Dec 2015, Martin K. Schröder 

This is a quick peek into stunnel and how to use it to make ubus services from
one box available on another box.

The ubus interconnect (iconnect) can be build by using stunnel and a set of
shell scripts to configure stunnel automatically based on the ip of the master
(which you get either through dhcp or simply by trying to connect to default
gateway on the network).

The tunnel can only be established to the master if slave cert is signed by
a chosen CA. The same for connections from master to a slave.

Slave exports functions to a special ubus socket which is separate from the
system ubus socket in order to only export functions that can truly be publicly
available and controllable by a master (a very limited subset).

If connection is instead done from master to slave then also there it can be
made mandatory to authenticate through some kind of ubus "login" call to the
slave (for example by authenticating using slave wireless key or something else
that can be printed on the back of the slave box).

If plug and play is required (without entering any keys) then using signed
certificates should be enough along with a button press on the slave to signal
that it should try to connect to master and expose it's functions. Slave can
then also add master to list of it's authorized hosts and disable the
interconnect if master public key changes.

How to set up a test environment
--------------------------------

First, install stunnel on both boxes (requires stunnel 5.33 from my repo with
unix socket support). You may need to remove feeds/oldpackages/net/stunnel in
order to build the correct version. Also you may need to do ./scripts/feeds
install -f -p juci stunnel.

For TESTING (ONLY!) - create self signed certificates on both master and slave.
Save both the key and cert as /etc/stunnel/stunnel.pem

	openssl genrsa -out key.pem 2048
	openssl req -new -x509 -key key.pem -out cert.pem -days 1095 -subj '/CN=SE'
	cat key.pem cert.pem > /etc/stunnel/stunnel.pem

Configuration of stunnel is done in /etc/config/stunnel.conf

Slave Configuration

	[ubus]
	connect = <master ip>:5303
	accept = /var/run/master.socket
	client = yes
	cert = /etc/stunnel/stunnel.pem

Master Configuration

	[ubus]
	connect = /var/run/iconnect.ubus.sock
	accept = <lan ip>:5303
	cert = /etc/stunnel/stunnel.pem

It is also possible to set certifficate authority and use signed certs for
establishing the connection in order to restrict access to the iconnect ubus
interface. It is also possible to expose only a simple login interface on the
master so that slaves can login, tell master about their stunnel server on wan
and then have master connect to them instead.

Stability of the tunnel 
-----------------------

Stunnel tunnels seem to be quite stable - even
surviving network restart. You do need to set correct ip for listen address in
case your ip changes.

Example usage
-------------

I have here connected my stunnel server directly to main ubus socket on master
(/var/run/ubus.sock). Then I configured slave stunnel to establish connection
to master and expose master socket in /var/run/master.sock. On master I then
also run ubus listen & in order to see ubus events (such as object being
added).

On slave:

	./iconnectd.lua
	2015.11.05 05:31:24 LOG5[0]: Service [ubus] accepted connection from unnamed socket
	2015.11.05 05:31:24 LOG5[0]: s_connect: connected 192.168.1.154:5303
	2015.11.05 05:31:24 LOG5[0]: Service [ubus] connected remote server from 192.168.1.1:52948

On master:

	2015.11.24 18:15:10 LOG5[0]: Service [ubus] accepted connection from 192.168.1.1:52948
	2015.11.24 18:15:12 LOG5[0]: s_connect: connected localhost:/var/run/ubus.sock
	2015.11.24 18:15:12 LOG5[0]: Service [ubus] connected remote server from unnamed socket
	{ "ubus.object.add": {"id":996538071,"path":"iconnect"} }

On slave:

	ubus list -s /var/run/master.sock
	2015.11.05 05:32:55 LOG5[0]: Service [ubus] accepted connection from unnamed socket
	2015.11.05 05:32:55 LOG5[0]: s_connect: connected 192.168.1.154:5303
	2015.11.05 05:32:55 LOG5[0]: Service [ubus] connected remote server from 192.168.1.1:52968
	/juci/ddns
	/juci/diagnostics
	/juci/dropbear
	....

On master:

	 ubus call iconnect test
	 {
		"foo": "bar"
	 }

A ubus call from master to a service on slave is instantaneous (this is
probably because iconnectd example service on slave is keeping the connection
open to the ubus on master so the request succeeds right away). Any ubus
service always keeps connection to ubus while it is active - when connection
dies ubus object disappears. I have found that restarting network or unplugging
network cable did not make the connection die and neither did it make the ubus
object disappear - which is very nice.

Calling ubus list on slave though takes some time because the SSL connection
needs to be established anew each time.

It seems that because the stunnel service is running as a service and always
accepting connections on the unix socket, the stunnel unix socket is immune to
connection loss on the network because stunnel will simply automatically retry
connecting to master until it succeeds and only then makes the connect call
succeed on the unix socket (or time out). So regardless of how many times
connection breaks on the network - the ubus connection through the ubus socket
managed by stunnel remains intact. 

Further thoughts on this solution
---------------------------------

The method of connecting from slave to master was chosen because it is a very
simple approach and it satisfies the requirement of not having any listening
ports open on wan side on the slave. It also does not require any special
configuration on the neither of the boxes - except just running iconnect.

If the connection is established from master to slave, then it would require
each slave to run separate ubus context and also it would require multiple
separate sockets on master for accessing slaves. Such setup would isolate
slaves from each other, but will not allow simple communication with slaves
using just ubus command (instead it would require listing available socket
files and then calling ubus with -s option for specific slave socket).

The only drawback of the approach where we have a single hub for all slaves is
that all clients that are connected to lan hub essentially make their iconnect
ubus interfaces available to all other clients connected to the same ubus hub
(in the simplest case all clients will share the same ubus context - but it
will be separate from system ubus context on master).

Since we still make webgui available on lan and since in most cases it has
default passwords like admin/admin, perhaps it would be enough to provide
simple ubus authentication for slaves as well as good enough security on this
iconnect lan. This can be implemented by adding extensions to slave interface
only through iconnect daemon - which in turn will wrap each exposed ubus call
into a session id test which will test if supplied session id is valid. The
master (or any other slave on the same hub) will then have to "login" to
another slave and after that make ubus calls to it using a session id which it
gets as result of the login call (which also is done over ubus to the slave).

Then we can make each slave ubus objects available through a prefix inside the
same context which is determined by iconnect daemon running on slave when it
exposes the objects to the master. This prefix can simply be first 10
characters of the sha1 hash of the slave public key. This will give
sufficiently random automatic names and also provide means for master to
authenticate each ubus object as belonging to correct slave based on known
slave public keys (if this is ever required). Optionally user can be allowed
to configure a human readable id for each slave box..

Using this approach, the ubus context on the master would look like this:

	ubus list -s /var/run/iconnect.sock <- created using ubusd -s /var/run/iconnect.sock
	/06d2ecc154/iconnect
	/06d2ecc154/wireless
	/06d2ecc154/something_else
	/123dacd456/iconnect
	/123dacd456/wireless
	...

Each call will take a iconnect_sid parameter which will be retreived by doing:

	ubus call /<slave>/iconnect login '{"username":"user","password":"pass"}'

Then to set SSID, the master may do:

	ubus call /<slave>/wireless set_ssid '{"iconnect_sid":"<sid>","ssid":"SSID"}'

The iconnect daemon on the slave will check ssid with list of currently
authenticated clients and return ubus ACCESS_DENIED error if the sid is wrong.
The connection to the slave is using public key of the individual slave - which
is unique to that slave - so other slaves can not listen in on the
communication.. 

Even simpler solution
--------------------

Write a standalone client service that will login to the server and expose a
rigid interface with login, logout, call and list methods. These will then
allow any other client to login and execute commands on current slave. This
works very similar to how ubus rpc works through uhttpd. 

This way objects look like this: 

	'F40D7920B840CD55202316CC0B05E43EF8EE5CB2' @1bcef705
		"call":{"method":"String","object":"String","sid":"String"}
		"logout":{"sid":"String"}
		"login":{"username":"String","password":"String"}
		"list":{"object":"String","sid":"String"}

Each method apart from login basically takes a sid which has been retreived by
logging into the interface. 

Benefits of this solution: 

- Very narrow interface which is easy to audit. 
- Full access to client ubus provided the right login details are provided. 
- No need to write any extra services. Just implement users and access control lists. 
- Similar access control to how gui works. 

Creating CA and keys
--------------------

In a production environment proper keys are needed. This is currently just an
example of how to create a ca key and sign certifficate using it. 

First create a self signed CA key and cert: 

	openssl genrsa -out ca-key.pem
	openssl req -new -x509 -days 365 -key ca-key.pem -out ca-cert.pem -subj "/CN=whatever"

Then create a client key: 

	openssl genrsa -out client-key.pem

Create a signing request for the key: 

	openssl req -new -key client-key.pem -out client-csr.pem -subj "/CN=clientwhatever"

Sign the client key using the previously generated ca: 

	openssl x509 -req -days 365 -in client-csr.pem -CA ca-cert.pem -CAkey ca-key.pem -set_serial 01 -out client-cert.pem

Verification of the client cert can then be done like this: 

	openssl verify -CAfile ca-cert.pem client-cert.pem 

Here is how to get fingerprint string of the certificate: 
	
	openssl x509 -noout -in cert.pem -fingerprint | sed 's/://g' | cut -f 2 -d '='

LICENSE: GPLv3
