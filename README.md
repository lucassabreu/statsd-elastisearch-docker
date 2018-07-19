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