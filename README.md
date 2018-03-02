# postfix-docker
Dockerfile and run.sh for https://hub.docker.com/r/amane/postfix/

# run Postfix in Docker
```
docker run --rm -p 2525:25 -e MYHOSTNAME="mail.example.com" -e MYDOMAIN="example.com" -e MYNETWORKS="permitted/8, network/16, withtout/24, localhost/32" amane/postfix
```

Set `HIDERECEIVED` as a **nonempty** string to remove `Received:` headers from an email before relaying to hide your private/backend IP adsresses.

Set `WHITEADDRESS` as mail address list to restrict recipient. The list is regular expressions separated with ";".

You can communicate with Postfix by `telnet localhost 2525` or `heirloom-mailx -S "smtp=smtp://localhost:2525" recipient@example.com` now.
