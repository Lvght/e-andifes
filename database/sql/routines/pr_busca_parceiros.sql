/*
Autor: Alisson Nunes (RA:725862)
Descrição: Cria um procedimento que busca por parceiros
*/

CREATE OR REPLACE PROCEDURE pr_busca_parceiros(
    IN valor_busca VARCHAR(100)
)
LANGUAGE plpgsql
AS $$
BEGIN
    SELECT *
    FROM parceiro
    WHERE
        cnpj ILIKE '%' || valor_busca || '%' OR
        nome ILIKE '%' || valor_busca || '%' OR
        numero::VARCHAR = valor_busca OR
        rua ILIKE '%' || valor_busca || '%' OR
        bairro ILIKE '%' || valor_busca || '%' OR
        complemento ILIKE '%' || valor_busca || '%' OR
        cpf = valor_busca OR
        id::VARCHAR = valor_busca OR
        status ILIKE '%' || valor_busca || '%';
END;
$$;
