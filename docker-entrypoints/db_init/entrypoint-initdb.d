#!/usr/bin/env sh
set -e

mkdir /tmp/stat_temporary
cp /db_config/postgresql.conf var/lib/postgresql/data/postgresql.conf

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
