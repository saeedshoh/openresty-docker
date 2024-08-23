FROM openresty/openresty:alpine-fat

RUN luarocks install lua-resty-jwt

ENTRYPOINT ["/usr/local/openresty/bin/openresty", "-g", "daemon off;"]