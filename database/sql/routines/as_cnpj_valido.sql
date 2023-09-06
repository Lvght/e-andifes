/*
Autor: Alisson Nunes (RA:725862)
Descrição: Função para verificar se um CNPJ é válido
*/

CREATE OR REPLACE FUNCTION as_cnpj_valido(cnpj VARCHAR)
RETURNS BOOLEAN
LANGUAGE plpgsql
AS $$
DECLARE
    cnpj_text VARCHAR;
BEGIN
    -- Remove qualquer caractere não numérico do CNPJ
    cnpj_text := REGEXP_REPLACE(cnpj, '[^0-9]', '', 'g');
    
    -- Tamanho do CNPJ
    IF LENGTH(cnpj_text) <> 14 THEN
        RETURN FALSE;
    END IF;
    
    -- variaveis
    DECLARE
        digito1 INT := 0;
        digito2 INT := 0;
        soma1 INT := 0;
        soma2 INT := 0;
        peso1 INT := 5;
        peso2 INT := 6;
    BEGIN
        -- calcula soma
        FOR i IN 1..12 LOOP
            soma1 := soma1 + (CAST(SUBSTRING(cnpj_text FROM i FOR 1) AS INT) * peso1);
            soma2 := soma2 + (CAST(SUBSTRING(cnpj_text FROM i FOR 1) AS INT) * peso2);
            peso1 := peso1 - 1;
            peso2 := peso2 - 1;
            IF peso1 = 1 THEN
                peso1 := 9;
            END IF;
            IF peso2 = 1 THEN
                peso2 := 9;
            END IF;
        END LOOP;
        
        -- calcula figitos corretos
        digito1 := (10 - (soma1 % 11)) % 10;
        digito2 := (10 - (soma2 % 11)) % 10;
        
        -- verifica se os digitos condizem
        IF digito1 = CAST(SUBSTRING(cnpj_text FROM 13 FOR 1) AS INT) AND
           digito2 = CAST(SUBSTRING(cnpj_text FROM 14 FOR 1) AS INT) THEN
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;
    END;
END;
$$;
