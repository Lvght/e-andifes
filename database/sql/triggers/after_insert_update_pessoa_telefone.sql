CREATE OR REPLACE FUNCTION tr_after_insert_update_only_one_main_phone()
    RETURNS trigger
    LANGUAGE plpgsql
AS
$$
BEGIN
    -- Remove todos os demais telefones do status de principal.
    UPDATE pessoa_telefone
    SET principal = false
    WHERE cpf_pessoa = NEW.cpf_pessoa
      AND pessoa_telefone.id_telefone != NEW.id_telefone;

    RETURN NEW;
END;
$$;

CREATE OR REPLACE TRIGGER after_insert_update_pessoa_telefone
    AFTER UPDATE OR INSERT
    ON pessoa_telefone
    FOR EACH ROW
    -- Apenas quando a nova instância for marcada como principal.
    WHEN (NEW.principal = true)
EXECUTE PROCEDURE tr_after_insert_update_only_one_main_phone();
