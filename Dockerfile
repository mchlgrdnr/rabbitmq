FROM rabbitmq:3.9-management

COPY rabbitmq.conf /etc/rabbitmq/

# COPY start-rabbitmq.sh /usr/local/bin/

# Set the script as executable and set it as the entrypoint
# RUN chmod +x /usr/local/bin/start-rabbitmq.sh
# ENTRYPOINT ["/usr/local/bin/start-rabbitmq.sh"]


ENV RABBITMQ_NODENAME=rabbit@localhost

RUN apt-get -o Acquire::Check-Date=false update && apt-get install -y curl
RUN curl -L https://github.com/rabbitmq/rabbitmq-delayed-message-exchange/releases/download/3.9.0/rabbitmq_delayed_message_exchange-3.9.0.ez > $RABBITMQ_HOME/plugins/rabbitmq_delayed_message_exchange-3.9.0.ez
RUN chown rabbitmq:rabbitmq $RABBITMQ_HOME/plugins/rabbitmq_delayed_message_exchange-3.9.0.ez

RUN chown rabbitmq:rabbitmq /etc/rabbitmq/rabbitmq.conf

USER rabbitmq:rabbitmq

RUN rabbitmq-plugins enable rabbitmq_delayed_message_exchange
