FROM golang:1.7
RUN apt-get install -y curl
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
