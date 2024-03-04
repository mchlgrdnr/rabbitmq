#!/bin/sh
# Adjust permissions for .erlang.cookie
chmod 600 /var/lib/rabbitmq/.erlang.cookie || true
# Continue with the original entrypoint process
exec docker-entrypoint.sh rabbitmq-server
