ARG ELK_VERSION
FROM docker.elastic.co/beats/filebeat:${ELK_VERSION}

COPY config.yml /usr/share/filebeat/filebeat.yml

ENTRYPOINT ["filebeat", "-e", "-strict.perms=false"]