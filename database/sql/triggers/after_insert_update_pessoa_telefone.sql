CREATE OR REPLACE FUNCTION tr_after_insert_update_only_one_main_phone()
    RETURNS trigger
    LANGUAGE plpgsql
AS
$$
DECLARE
    c INTEGER;
BEGIN
    -- Remove todos os demais telefones do status de principal.
    UPDATE pessoa_telefone
    SET principal = false
    WHERE cpf_pessoa = NEW.cpf_pessoa
      AND pessoa_telefone.id_telefone != NEW.id_telefone;

    -- Obtém os telefones da pessoa em questão e verifica se, agora, apenas 1 é o principal.
    SELECT INTO c COUNT(*) FROM pessoa_telefone WHERE cpf_pessoa = NEW.cpf_pessoa AND principal = true;
    ASSERT c = 1, 'Apenas um telefone pode ser marcado como principal.';

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
