-- Esta trigger irá garantir que quando um email associado a uma pessoa foi deletado, ainda haverá um principal associada a ela
CREATE OR REPLACE FUNCTION tr_before_delete_pessoa_email()
    RETURNS trigger
    LANGUAGE plpgsql
AS $$
DECLARE
    r REFCURSOR;
    rec RECORD;
BEGIN
    IF OLD.principal = TRUE THEN
        OPEN r FOR SELECT id, pessoa, email, principal FROM pessoa_email WHERE pessoa = OLD.pessoa;
        FETCH r INTO rec;
        
        IF FOUND THEN
            UPDATE pessoa_email SET principal = TRUE WHERE email = rec.email;
        END IF;

        CLOSE r;
    END IF;

    RETURN OLD;
END;
$$;     

CREATE OR REPLACE TRIGGER after_delete_pessoa_telefone
    AFTER DELETE ON pessoa_email
    FOR EACH ROW
    EXECUTE FUNCTION tr_before_delete_pessoa_email();