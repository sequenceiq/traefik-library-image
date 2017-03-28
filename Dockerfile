FROM alpine:3.2
RUN apk --update add curl bash ca-certificates && \
    curl -Ls https://circle-artifacts.com/gh/andyshinn/alpine-pkg-glibc/6/artifacts/0/home/ubuntu/alpine-pkg-glibc/packages/x86_64/glibc-2.21-r2.apk > /tmp/glibc-2.21-r2.apk && \
    apk add --allow-untrusted /tmp/glibc-2.21-r2.apk && \
    rm -rf /tmp/glibc-2.21-r2.apk /var/cache/apk/*
COPY certs/ca-certificates.crt /etc/ssl/certs/
COPY traefik /
COPY start-traefik /
EXPOSE 80
ENTRYPOINT ["/start-traefik"]

# Metadata
LABEL org.label-schema.vendor="Containous" \
      org.label-schema.url="https://traefik.io" \
      org.label-schema.name="Traefik" \
      org.label-schema.description="A modern reverse-proxy" \    
      org.label-schema.version="v1.2.0" \
      org.label-schema.docker.schema-version="1.0"
