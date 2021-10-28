FROM cockroachdb/cockroach:latest-v21.1

CMD /cockroach/cockroach start-single-node --insecure
