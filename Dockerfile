FROM cockroachdb/cockroach:latest-v21.1

CMD ["./cockroach",  "start-single-node", "--insecure"]

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT /entrypoint.sh
