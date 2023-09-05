/*
Autor: Caio Ueda Sampaio (RA:802215)
Descrição: filtra edital por ano
*/

CREATE PROCEDURE pr_filtra_edital_por_ano(ano_desejado integer)
AS $$
BEGIN
    SELECT *
    FROM editais_abertos 
    WHERE ano = ano_desejado;
END;
$$
LANGUAGE plpgsql;