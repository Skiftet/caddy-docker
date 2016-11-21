#!/bin/sh

cat << CONFEOF > /etc/Caddyfile

https://$CADDY_DOMAIN {
    ipfilter / {
        rule       allow
        ip         $IP_WHITE_LIST
        strict
    }

    proxy / $PROXY_TARGET {
        proxy_header Host {host}
        proxy_header X-Real-IP {remote}
        proxy_header X-Forwarded-Proto {scheme}
        proxy_header X-Forwarded-Port 443
        proxy_header Sec-Websocket-Key {>Sec-Websocket-Key}
        proxy_header Sec-Websocket-Extensions {>Sec-Websocket-Extensions}
        proxy_header Sec-Websocket-Version {>Sec-Websocket-Version}
        proxy_header Connection {>Connection}
        proxy_header Upgrade {>Upgrade}
    }
    tls $LETSENCRYPT_EMAIL
    errors stdout
}

CONFEOF

exec "$@"
