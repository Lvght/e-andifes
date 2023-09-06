CREATE FUNCTION fn_trigger_watch_gestor_andifes()
RETURNS trigger
LANGUAGE plpgsql
AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        CALL pr_audit('INSERT', concat('Gestor Andifes cadastrado - ', NEW.cpf));
        RETURN NEW;
    END IF;

    IF TG_OP = 'UPDATE' THEN
        CALL pr_audit('UPDATE', concat('Gestor Andifes atualizado - ', NEW.cpf));
        RETURN NEW;
    END IF;

    IF TG_OP = 'DELETE' THEN
        CALL pr_audit('DELETE', concat('Gestor Andifes removido - ', OLD.cpf));
        RETURN OLD;
    END IF;

    RETURN NULL;
END
$$;

CREATE TRIGGER trigger_watch_gestor_andifes
AFTER INSERT OR UPDATE OR DELETE ON gestor_andifes
FOR EACH ROW EXECUTE PROCEDURE fn_trigger_watch_gestor_andifes();
