-- Retorna informações sobre a tabela solicitada.
-- Isso permitira a construção automática e desacompanhada de
-- formulários na interface.
CREATE OR REPLACE FUNCTION fn_table_introspect(t VARCHAR)
    RETURNS TABLE
            (
                table_schema VARCHAR,
                table_name   VARCHAR,
                column_name  VARCHAR,
                data_type    VARCHAR
            )
AS
$BODY$
DECLARE
    r CURSOR FOR
        SELECT c.table_schema,
               c.table_name,
               c.column_name,
               c.data_type
        FROM information_schema.columns c
        WHERE c.table_schema NOT IN ('pg_catalog', 'information_schema')
          AND c.table_name = t;
    _row record;
BEGIN
    OPEN r;
    LOOP
        FETCH r INTO _row;
        EXIT WHEN NOT FOUND;

        table_schema := _row.table_schema;
        table_name := _row.table_name;
        column_name := _row.column_name;
        data_type := _row.data_type;

        RETURN NEXT;
    END LOOP;
    CLOSE r;
END;
$BODY$
    LANGUAGE plpgsql;
