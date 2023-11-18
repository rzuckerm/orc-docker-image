FROM openjdk:8-slim

COPY ORC_* /tmp/
RUN apt-get update && \
    apt-get install -y wget unzip && \
    wget https://github.com/orc-lang/orc/releases/download/v$(cat /tmp/ORC_VERSION)/orc-$(cat /tmp/ORC_VERSION).zip \
        -O /tmp/orc.zip && \
    mkdir -p /opt && \
    cd /opt && \
    unzip /tmp/orc.zip && \
    rm /tmp/orc.zip && \
    mv orc-$(cat /tmp/ORC_VERSION) orc && \
    cd orc && \
    ln -s orc-$(cat /tmp/ORC_VERSION).jar orc.jar && \
    apt-get remove -y wget unzip && \
    apt-get autoremove -y && \
    apt-get clean
