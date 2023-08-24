#!/bin/bash

echo -e "Start...\n";

declare -a segmentos=(
  [0]="types"
  [1]="tables"
  [2]="views"
  [3]="functions"
  [4]="triggers"
  [5]="extra"
);

echo -e "2...\n";

for s in "${segmentos[@]}"; do
  echo -e "====================> $s\n";
  file="/opt/sql/$s/__create__.txt";

  if [[ ! -f "$file" ]]; then
    echo -e "File $file not found\n";
    exit 1;
  fi

  while read buff; do
    if [[ -z "$buff" || ${buff:0:1} == '#' ]]; then
      continue;
    fi

    obj="/opt/sql/$s/$buff.sql";
    echo -e "🔄 $obj\n";
    ret=$(psql -U postgres -d andifes -v ON_ERROR_STOP=on -f $obj);

    if [[ -z $ret ]]; then
      echo -e "⚠️ Error creating $obj\n";
      echo -e "ret code is $ret\n";
      exit 1;
    fi
  done < "$file";
done

echo -e "
____    ____ _  _ ___  _ ____ ____ ____ 
|___ __ |__| |\ | |  \ | |___ |___ [__  
|___    |  | | \| |__/ | |    |___ ___] 
\n";
echo -e "🎉 Database is ok. Happy hacking!\n";