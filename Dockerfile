FROM alpine:3.13
RUN apk --no-cache add ca-certificates git
COPY trivy /usr/local/bin/trivy
RUN chmod +x /usr/local/bin/trivy && \
    trivy i --download-db-only
COPY contrib/*.tpl contrib/
ENTRYPOINT ["trivy"]
