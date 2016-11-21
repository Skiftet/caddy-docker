
FROM abiosoft/caddy:latest


COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/bin/caddy", "--conf", "/etc/Caddyfile", "--log", "stdout"]
