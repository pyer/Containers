#!/bin/sh
#
PGDATA="/home"
if [ -z "$(ls "$PGDATA")" ]; then
  initdb -U postgres
  # Set unix_socket_directories to /tmp
  sed -ri "s/^(unix_socket_directories).*/\1 = '\/tmp'/" "$PGDATA"/postgresql.conf
  # Enable all available IP interfaces
  sed -ri "s/^#(listen_addresses\s*=\s*)\S+/\1'*'/" "$PGDATA"/postgresql.conf
  { echo "# Allow all IPv4 addresses"; echo "host all all 0.0.0.0/0 trust"; } >> "$PGDATA"/pg_hba.conf
fi
# Launch Postgres SQL server
exec /usr/bin/postgres -D $PGDATA
