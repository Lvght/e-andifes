/*
Autor: Pedro Lealdini do Prado Borges (RA:790894)
Descrição: Função que retorna todos os números telefonicos de uma pessoa usando um cursor explicito
*/


CREATE OR REPLACE FUNCTION nome_da_funcao(cpf char(11))
RETURNS TABLE(numero integer) AS $$
DECLARE
    telefone_cursor CURSOR FOR
        SELECT t.numero
        FROM telefone t
        INNER JOIN pessoa_telefone i ON t.id = i.id_telefone
        WHERE i.cpf_pessoa = cpf;
BEGIN
    FOR telefone IN telefone_cursor LOOP
        numero := telefone.numero;
        RETURN NEXT;
    END LOOP;
END;
$$ LANGUAGE plpgsql;