#!/bin/bash
set -e

if [[ -z "$@" && ! -z "${DB_USER}" && ! -z "${DB_NAME}" ]]; then
    set -x

    cockroach start-single-node --insecure
    cockroach_pid=$!

    cockroach sql --insecure -e "CREATE USER IF NOT EXISTS ${DB_USER}; CREATE DATABASE IF NOT EXISTS ${DB_NAME}; GRANT ALL ON DATABASE ${DB_NAME} TO ${DB_USER}"

    kill ${cockroach_pid}
fi

exec "$@"
