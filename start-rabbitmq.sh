#!/bin/bash

# Check if PAUSE_STARTUP is set to "true"
if [ "$PAUSE_STARTUP" = "true" ]; then
    echo "Startup paused. Unset PAUSE_STARTUP to continue."
    while [ "$PAUSE_STARTUP" = "true" ]; do
        # Check every 30 seconds if PAUSE_STARTUP has changed
        sleep 30
        PAUSE_STARTUP=$(printenv PAUSE_STARTUP)
    done
fi

# Continue with RabbitMQ startup
exec docker-entrypoint.sh rabbitmq-server
