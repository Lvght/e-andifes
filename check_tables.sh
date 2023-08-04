#!/bin/bash

quantidade_arquivos=$(find ./sql -name "*.sql" ! -name "__*" -print | wc -l)
num_linhas_validas=$(awk 'NF && !/^#/ && !/^__/' sql/__create__.txt | wc -l)

DB_NAME="andifes"
DB_USER="postgres"
DB_PASS="postgres"
DB_HOST="localhost"
DB_PORT="5432"

export PGPASSWORD=$DB_PASS;
num_tabelas=$(psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -t -c "SELECT count(*) FROM information_schema.tables WHERE table_schema='public';" | tr -d '[:space:]');

if [[ ! "$num_linhas_validas" -eq "$num_tabelas" && "$quantidade_arquivos" -eq "$num_tabelas" ]]; then
    echo "Inconsistência na criação de tabelas...";
    exit 1
fi

echo "Ok";
exit 0