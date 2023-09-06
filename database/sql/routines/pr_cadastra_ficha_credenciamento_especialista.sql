/*
Autor: Pedro Lealdini do Prado Borges (RA:790894)
Descrição: Procedimento para cadastrar no sistema uma ficha 
           de credenciamento de um especialista
*/

CREATE OR REPLACE PROCEDURE pr_cadastra_ficha_credenciamento_especialista(
    p_especialista CHAR(11),
    p_credenciado_em TEXT
)
LANGUAGE plpgsql
AS $$
BEGIN
    -- Verifica se o especialista existe na tabela especialista
    IF NOT EXISTS (SELECT 1 FROM especialista WHERE cpf = p_especialista) THEN
        RAISE EXCEPTION 'Especialista não encontrado';
    END IF;
    -- Cadastra uma nova ficha de credenciamento com os parâmetros fornecidos
    INSERT INTO ficha_credenciamento_especialista(especialista, credenciado_em)
    VALUES (p_especialista, p_credenciado_em);
END;
$$;
