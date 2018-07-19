{
  port: 8125,
  mgmt_port: 8126,
  keyNameSanitize: false,
  elasticsearch: {
    host: process.env.ELASTICSEARCH_HOST,
    port: process.env.ELASTICSEARCH_PORT || 9200,
    username: process.env.ELASTICSEARCH_USERNAME || undefined,
    password: process.env.ELASTICSEARCH_PASSWORD || undefined,
    transport: process.env.ELASTICSEARCH_TRANSPORT || 'http',
    formatter: process.env.ELASTICSEARCH_FORMATTER || "default_format",
    keyRegex: process.env.ELASTICSEARCH_FORMATTER_REGEXP || undefined,
  },
  backends: ["statsd-elasticsearch-backend"]
}
