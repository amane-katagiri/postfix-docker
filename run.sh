#!/bin/sh
trap '/usr/sbin/postfix reload' HUP
trap '/usr/sbin/postfix stop' EXIT
trap '/usr/sbin/postfix stop; trap EXIT; exit 0' TERM INT

if [ -n "$MYHOSTNAME" ]; then
    postconf myhostname="$MYHOSTNAME"
fi
if [ -n "$MYDOMAIN" ]; then
    postconf mydomain="$MYDOMAIN"
fi
if [ -n "$MYNETWORKS" ]; then
    postconf "`postconf mynetworks`, $MYNETWORKS"
fi
if [ -n "$HIDERECEIVED" ]; then
    echo "/^Received:/ IGNORE" > /etc/postfix/header_checks
    postconf header_checks="regexp:/etc/postfix/header_checks"
fi

/usr/sbin/postfix start
while true; do sleep 3600 & wait; done
