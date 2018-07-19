statsd-elastisearch-docker
==========================

A docker container for statsd that connects with elasticsearch and elastic cloud

Configuration
-------------

The default configuration of this image allows to use the following enviroment variables:

Environment                    | Description
-------------------------------|-------------
ELASTICSEARCH_HOST             | Elasticsearch Host (required)
ELASTICSEARCH_PORT             | Elasticsearch Port (default: 9200)
ELASTICSEARCH_USERNAME         | Username (default: underfined)
ELASTICSEARCH_PASSWORD         | Password (default: underfined)
ELASTICSEARCH_TRANSPORT        | Which protocol to use (http or https) (default: http)
ELASTICSEARCH_FORMATTER        | Formatter to be used (default_format, influx_like_labels_format, regex_format) (default: default_format)
ELASTICSEARCH_FORMATTER_REGEXP | RegExp to be used (only works for regex_format)

To understand which values are valid, please lock to the [stastd-elasticsearch-backend](https://github.com/lucassabreu/statsd-elasticsearch-backend/tree/v0.4.1).

### Docker Compose example:

```yaml
version: '3'

services:
    statsd:
        image: lucassabreu/stastd-elasticsearch-backend
        enviroment:
            - ELASTICSEARCH_HOST=${ELASTICSEARCH_HOST}
            - ELASTICSEARCH_PORT=9243
            - ELASTICSEARCH_TRANSPORT=https
            - ELASTICSEARCH_USERNAME=elastic
            - ELASTICSEARCH_PASSWORD=${ELASTICSEARCH_PASSWORD}
        ports:
            - 8125:8125/udp
            - 8126:8126
        restart: always
```

### Docker run example:

```sh
docker run -d --name=statsd -p 8125:8125/udp -p 8126:8126 --restart=always \
    -e="ELASTICSEARCH_HOST=${ELASTICSEARCH_HOST}" \
    -e="ELASTICSEARCH_PORT=9243" \
    -e="ELASTICSEARCH_TRANSPORT=https" \
    -e="ELASTICSEARCH_USERNAME=elastic" \
    -e="ELASTICSEARCH_PASSWORD=${ELASTICSEARCH_PASSWORD}" \
    lucassabreu/stastd-elasticsearch-backend
```
