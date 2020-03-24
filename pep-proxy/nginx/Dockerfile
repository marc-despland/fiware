FROM nginx
COPY default.conf /etc/nginx/conf.d/default.conf.template
COPY docker_entrypoint.sh /docker_entrypoint.sh
RUN chmod u+rx /docker_entrypoint.sh
ENTRYPOINT ["/docker_entrypoint.sh"]