FILENAME="kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz"
KAFKA_DOWNLOAD_URL="https://archive.apache.org/dist/kafka/${KAFKA_VERSION}/${FILENAME}"
wget "${KAFKA_DOWNLOAD_URL}" -O "/tmp/${FILENAME}"