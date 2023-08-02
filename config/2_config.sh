#!/bin/bash

file="/opt/sql/__create__.txt";
while read t; do
  if [[ -z "${t%?}" || ${t:0:1} == '#' ]]; then
    continue;
  fi
  table="/opt/sql/${t%?}.sql";
  echo -e "Trying to create the table $table\n";
  psql -U postgres -d andifes -f $table;
done < "$file";
