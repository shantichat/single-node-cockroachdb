FROM cockroachdb/cockroach:latest-v21.1

CMD ["cockroach",  "start-single-node", "--insecure"]

COPY docker-entrypoint.sh /

RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
