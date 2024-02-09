# From official php image.
FROM warr/php-cli

# Install quality-of-life packages.
RUN apk add --no-cache supervisor 

ENTRYPOINT ["/usr/bin/supervisord", "-n", "-c",  "/etc/supervisor/supervisord.conf"]
# Prevent container from exiting early.
CMD ["sleep", "infinity"]
