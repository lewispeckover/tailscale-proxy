FROM alpine:latest
RUN apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing tailscale && apk add --no-cache tinyproxy curl
COPY ./ /
ENTRYPOINT /tailscale-proxy.sh
