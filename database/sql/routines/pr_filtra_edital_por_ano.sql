/*
Autor: Caio Ueda Sampaio (RA:802215)
Descrição: filtra edital por ano
*/

CREATE PROCEDURE pr_filtra_edital_por_ano(ano_desejado integer)
AS $$
DECLARE
    r   REFCURSOR;
    rec RECORD;
BEGIN
    OPEN r FOR
    SELECT *
    FROM editais_abertos 
    WHERE ano = ano_desejado;
    FETCH r INTO rec;
    IF NOT FOUND THEN
        RAISE EXCEPTION 'Não há editais abertos para o ano de %', ano_desejado;
    END IF;
END;
$$
LANGUAGE plpgsql;