CREATE FUNCTION fn_trigger_watch_edital()
RETURNS trigger
LANGUAGE plpgsql
AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        CALL pr_audit('INSERT', concat('Nova edital cadastrado - ', NEW.nome));
        RETURN NEW;
    END IF;

    IF TG_OP = 'UPDATE' THEN
        CALL pr_audit('UPDATE', concat('Edital atualizado - ', NEW.nome));
        RETURN NEW;
    END IF;

    IF TG_OP = 'DELETE' THEN
        CALL pr_audit('DELETE', concat('Edital removido - ', OLD.nome));
        RETURN OLD;
    END IF;

    RETURN NULL;
END
$$;

CREATE TRIGGER trigger_watch_edital
AFTER INSERT OR UPDATE OR DELETE ON edital
FOR EACH ROW EXECUTE PROCEDURE fn_trigger_watch_edital();
