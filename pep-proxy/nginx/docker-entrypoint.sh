#!/bin/bash

envsubst < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf
rm -f /etc/nginx/conf.d/default.conf.template

exec nginx -g 'daemon off;'