# STAGE 1
FROM alpine:latest AS builder

ARG VERSION=1.0
WORKDIR /app

RUN echo '<!DOCTYPE html><html><head><meta charset="UTF-8"><title>Lab 5</title></head><body><h1>Lab 5</h1><p>IP: __IP__</p><p>Hostname: __HOST__</p><p>Version: __VERSION__</p></body></html>' > /app/index.template.html

# STAGE 2
FROM nginx:alpine

ARG VERSION=1.0
ENV VERSION=${VERSION}

RUN apk add --no-cache curl

COPY --from=builder /app/index.template.html /usr/share/nginx/html/index.template.html

RUN rm -f /usr/share/nginx/html/index.html

EXPOSE 80

HEALTHCHECK --interval=10s --timeout=3s CMD curl -f http://localhost/ || exit 1

CMD ["/bin/sh", "-c", "IP=$(hostname -i | awk '{print $1}'); HOST=$(hostname); sed \"s|__IP__|$IP|g; s|__HOST__|$HOST|g; s|__VERSION__|$VERSION|g\" /usr/share/nginx/html/index.template.html > /usr/share/nginx/html/index.html && nginx -g 'daemon off;'"]