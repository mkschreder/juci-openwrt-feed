#!/bin/sh

# this user will be used for uci transactions (sessions)

cat >> /etc/config/rpcd << END
config login 
	option username 'orange'
	option password '\$p\$orange'
	list write 'orange'
	list read 'orange'
END

echo "orange:x:3:3:Linux User,,,:/home/admin:/bin/false" >> /etc/passwd
echo "orange:*:16709:0:99999:7:::" >> /etc/shadow

# generate a random password
PASS=$(date '+%s' | sha1sum | cut -f 1 -d' ')
PASSFILE=/etc/orange/password
touch ${PASSFILE}
chmod 0600 ${PASSFILE}
chown root:root ${PASSFILE}
echo ${PASS} > ${PASSFILE}

# set the password for user orange 
echo -e "${PASS}\n${PASS}\n" | passwd orange
