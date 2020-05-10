FROM openjdk:8u212-jre-alpine

ARG kafka_version=2.5.0
ARG scala_version=2.12

ENV KAFKA_VERSION=$kafka_version \
    SCALA_VERSION=$scala_version \
    KAFKA_HOME=/opt/kafka \
    KAFKA_BROKER_ID=-1 \
    KAFKA_LOG_DIRS=/opt/kafka/logs

ENV PATH=${PATH}:${KAFKA_HOME}/bin

COPY download-kafka.sh start-kafka.sh /tmp/

RUN apk add --no-cache bash curl \
 && chmod a+x /tmp/*.sh \
 && mv /tmp/start-kafka.sh /usr/bin \
 && /tmp/download-kafka.sh \
 && tar xfz /tmp/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz -C /opt \
 && rm /tmp/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz \
 && ln -s /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION} ${KAFKA_HOME} \
 && rm -rf /tmp

CMD ["start-kafka.sh"]






