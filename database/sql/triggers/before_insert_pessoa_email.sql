-- Trigger para garantir que apenas um e-mail principal seja permitido por pessoa.
CREATE OR REPLACE FUNCTION tr_after_insert_update_only_one_main_email()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.principal = TRUE THEN
        -- Verifica se já existe um e-mail principal para esta pessoa.
        IF EXISTS (SELECT 1 FROM pessoa_email WHERE pessoa = NEW.pessoa AND principal = TRUE) THEN
            RAISE EXCEPTION 'Uma pessoa não pode ter mais de um e-mail principal.';
        END IF;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Cria a trigger BEFORE INSERT na tabela pessoa_email.
CREATE TRIGGER before_insert_pessoa_email
BEFORE INSERT ON pessoa_email
FOR EACH ROW
EXECUTE FUNCTION tr_after_insert_update_only_one_main_email();
