CREATE OR REPLACE FUNCTION tr_before_delete_markasinactive_especialista()
RETURNS TRIGGER AS
$$
BEGIN
    -- Marcar o especialista como inativo
    UPDATE especialista
    SET ativo = FALSE
    WHERE cpf = OLD.cpf;

    -- Impedir a exclusão real
    RETURN NULL;
END;
$$
LANGUAGE plpgsql;

-- Associar o TRIGGER à tabela especialista
CREATE TRIGGER tr_before_delete_markasinactive_especialista
BEFORE DELETE ON especialista
FOR EACH ROW
EXECUTE FUNCTION before_delete_markasinactive_especialista();
