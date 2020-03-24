#!/bin/bash

envsubst '$$NGINX_PORT $$NGINX_HOST $$PEP_PROXY_IP $$NGSI_AGENTS_IP $$ORION_IP' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf
rm -f /etc/nginx/conf.d/default.conf.template

exec nginx -g 'daemon off;'