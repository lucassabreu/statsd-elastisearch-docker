FROM node:10.5

ENV STATSD_VERSION 0.8.0-beta
RUN apt-get update && apt-get install --no-install-recommends -y unzip && \
    DEBIAN_FRONTEND=noninteractive npm i -g npm && \
    cd /opt && curl -L https://github.com/lucassabreu/statsd/archive/v${STATSD_VERSION}.zip -o /opt/statsd.zip && \
    unzip statsd.zip && rm statsd.zip && mv statsd-${STATSD_VERSION} statsd && apt-get remove -y unzip && \
    cd /opt/statsd && npm config set registry http://registry.npmjs.org/ && npm install --prod

WORKDIR /opt/statsd

ENV STATSD_ELASTICSEARCH_BACKEND_VERSION v0.4.1
RUN npm install https://github.com/lucassabreu/statsd-elasticsearch-backend/tarball/${STATSD_ELASTICSEARCH_BACKEND_VERSION}

ADD config.js /opt/statsd/config.js

EXPOSE 8125/udp 8126
ENTRYPOINT [ "/opt/statsd/bin/statsd" ]
CMD [ "config.js" ]