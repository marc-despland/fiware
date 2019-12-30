FROM fiware/sth-comet
USER root
COPY docker-entrypoint.sh /
RUN chmod a+rx /docker-entrypoint.sh
USER node
ENTRYPOINT ["/docker-entrypoint.sh", "bin/sth"]
CMD ["-- ", "config.js"]