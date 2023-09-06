CREATE FUNCTION fn_trigger_watch_pessoa()
RETURNS trigger
LANGUAGE plpgsql
AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        CALL pr_audit('INSERT', concat('Nova pessoa cadastrada - ', NEW.cpf, ' - ', NEW.nome));
        RETURN NEW;
    END IF;

    IF TG_OP = 'UPDATE' THEN
        CALL pr_audit('UPDATE', concat('Pessoa atualizada - ', NEW.cpf, ' - ', NEW.nome));
        RETURN NEW;
    END IF;

    IF TG_OP = 'DELETE' THEN
        CALL pr_audit('DELETE', concat('Pessoa removida - ', OLD.cpf, ' - ', OLD.nome));
        RETURN OLD;
    END IF;

    RETURN NULL;
END
$$;

CREATE TRIGGER trigger_watch_pessoa
AFTER INSERT OR UPDATE OR DELETE ON pessoa
FOR EACH ROW EXECUTE PROCEDURE fn_trigger_watch_pessoa();
