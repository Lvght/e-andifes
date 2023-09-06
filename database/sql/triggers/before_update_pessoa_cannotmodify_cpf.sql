CREATE OR REPLACE FUNCTION prevent_cpf_modification()
RETURNS TRIGGER AS $$
BEGIN
    IF OLD.cpf <> NEW.cpf THEN
        RAISE EXCEPTION 'Modification of CPF is not allowed';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tr_prevent_cpf_modification
BEFORE UPDATE ON pessoa
FOR EACH ROW
WHEN (OLD.cpf IS DISTINCT FROM NEW.cpf)
EXECUTE FUNCTION prevent_cpf_modification();
