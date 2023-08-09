#!/bin/bash

file="/opt/sql/__create__.txt";
while read t; do
  if [[ -z "$t" || ${t:0:1} == '#' ]]; then
    continue;
  fi
  table="/opt/sql/$t.sql";
  echo -e "Trying to create the table $table\n";
  ret=$(psql -U postgres -d andifes -v ON_ERROR_STOP=on -f $table);

  if [[ -z $ret ]]; then
    echo -e "Error creating the table $table\n";
    echo -e "Ret code is $ret\n";
    exit 1;
  fi
done < "$file";
