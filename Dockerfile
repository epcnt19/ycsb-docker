FROM alpine:latest

ENV YCSB_VERSION=0.17.0 \
    YCSB=/opt/ycsb-${YCSB_VERSION} \
    PATH=${PATH}:/usr/bin
    
RUN apk update && apk add --update curl py-pip python2 openjdk9-jre && \
  	cd /opt && \
    curl -O --location  https://github.com/brianfrankcooper/YCSB/releases/download/${YCSB_VERSION}/ycsb-${YCSB_VERSION}.tar.gz && \
    tar xfz *.tar.gz && \
    rm -rf *.tar.gz && \
    ln -s /usr/local/bin/python2 /usr/local/bin/python

COPY ./startup.sh /
RUN chmod 744 /startup.sh
# CMD ["/startup.sh"]
