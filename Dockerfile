FROM rabbitmq:3.9-management

COPY rabbitmq.conf /etc/rabbitmq/
COPY docker-entrypoint.sh /usr/local/bin/

ENV RABBITMQ_NODENAME=rabbit@localhost

RUN apt-get -o Acquire::Check-Date=false update && apt-get install -y curl && \
    curl -L https://github.com/rabbitmq/rabbitmq-delayed-message-exchange/releases/download/3.9.0/rabbitmq_delayed_message_exchange-3.9.0.ez > $RABBITMQ_HOME/plugins/rabbitmq_delayed_message_exchange-3.9.0.ez && \
    chown rabbitmq:rabbitmq $RABBITMQ_HOME/plugins/rabbitmq_delayed_message_exchange-3.9.0.ez && \
    chown rabbitmq:rabbitmq /etc/rabbitmq/rabbitmq.conf && \
    chmod +x /usr/local/bin/docker-entrypoint.sh

USER rabbitmq

RUN rabbitmq-plugins enable rabbitmq_delayed_message_exchange

ENTRYPOINT ["docker-entrypoint.sh"]
