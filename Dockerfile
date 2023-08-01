FROM postgres:15.3-alpine3.18

# Copia as tabelas
COPY sql/ /opt/sql

COPY config/1_dbinitialconfig.sql /docker-entrypoint-initdb.d/
COPY config/2_config.sh /docker-entrypoint-initdb.d/

# Arquivo customizado de configuração do Postgres.
COPY config/db.conf /etc/postgresql/postgresql.conf

ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 5432

CMD ["postgres", "-c", "config_file=/etc/postgresql/postgresql.conf"]