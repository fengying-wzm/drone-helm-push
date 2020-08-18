FROM alpine:3.6

COPY helm-v3.3.0 /bin/helm
COPY helm-push /tmp/helm-push
RUN helm plugin install /tmp/helm-push

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
