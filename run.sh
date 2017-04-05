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

/usr/sbin/postfix start
while true; do sleep 3600 & wait; done
