CREATE OR REPLACE FUNCTION tr_after_update_only_one_main_email()
    RETURNS trigger
    LANGUAGE plpgsql
AS
$$
BEGIN
    UPDATE pessoa_email
    SET principal = false
    WHERE id = NEW.id
        AND pessoa_email.email != NEW.email;
    RETURN NEW;
END;
$$;

CREATE OR REPLACE TRIGGER after_update_pessoa_email
    AFTER UPDATE OR INSERT
    ON pessoa_email
    FOR EACH ROW
    WHEN(NEW.principal = true)
EXECUTE PROCEDURE tr_after_update_only_one_main_email();