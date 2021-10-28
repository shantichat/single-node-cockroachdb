#!/bin/bash
set -e

if [[ ! -z "${DB_USER}" && ! -z "${DB_NAME}" ]]; then
    set -x
    echo "init test db"

    pid_file=/tmp/cockroach.pid
    cockroach start-single-node --insecure --background --pid-file=${pid_file}

    sleep 1

    cockroach sql --insecure -e "CREATE USER IF NOT EXISTS ${DB_USER}; CREATE DATABASE IF NOT EXISTS ${DB_NAME}; GRANT ALL ON DATABASE ${DB_NAME} TO ${DB_USER}"

    kill ${pid_file}
else
    echo "don't init test db"
fi

exec "$@"
