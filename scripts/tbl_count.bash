#!/usr/bin/env bash
set -euo pipefail

DB="dvdrental"
SCHEMA="public"
HOST="localhost:26257"

# List tables (TSV), drop header, then for each table print: <name>\t<count>
cockroach sql --insecure --host="$HOST" -d "$DB" --format=tsv -e "
  SELECT table_name
  FROM information_schema.tables
  WHERE table_schema = '$SCHEMA' AND table_type = 'BASE TABLE'
  ORDER BY table_name;
" | tail -n +2 | while IFS=$'\t' read -r table; do
  cockroach sql --insecure --host="$HOST" -d "$DB" --format=tsv -e "
    SELECT '$table', count(*) FROM \"$SCHEMA\".\"$table\";
  " | tail -n +2
done
