#! /usr/bin/bash

cockroach sql --insecure --host=localhost:26257 -d dvdrental -e "
  SELECT table_name
  FROM information_schema.tables
  WHERE table_schema = 'public' AND table_type = 'BASE TABLE';
" | tail -n +2 | while read table; do
  echo -n "$table: "
  cockroach sql --insecure --host=localhost:26257 -d dvdrental -e "SELECT count(*) FROM public.\"$table\";"
        done
