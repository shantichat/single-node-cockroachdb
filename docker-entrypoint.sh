#!/bin/bash
set -e

if [[ ! -z "${DB_USER}" && ! -z "${DB_NAME}" ]]; then
    set -x
    echo "init test db"

    cockroach start-single-node --insecure &
    pid=$!
    
    sleep 1 # FIXME:

    cockroach sql --insecure -e "CREATE USER IF NOT EXISTS ${DB_USER}; CREATE DATABASE IF NOT EXISTS ${DB_NAME}; GRANT ALL ON DATABASE ${DB_NAME} TO ${DB_USER}"

    kill ${pid}
    wait ${pid}
else
    echo "don't init test db"
fi

exec "$@"
