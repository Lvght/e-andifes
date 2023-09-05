
CREATE OR REPLACE FUNCTION tr_perm_delegate_to_the_manager()
    RETURNS trigger
    LANGUAGE plpgsql
AS
$$
BEGIN
    IF TG_OP = 'DELETE' THEN
        EXECUTE 'REVOKE coordenador_administrativo TO ' || quote_ident(OLD.cpf);
        RAISE NOTICE 'Cargo coordenador_administrativo revogado de %', OLD.cpf;
    ELSIF TG_OP = 'INSERT' OR TG_OP = 'UPDATE' THEN
        EXECUTE 'GRANT coordenador_administrativo TO ' || quote_ident(NEW.cpf);
        RAISE NOTICE 'Cargo coordenador_administrativo delegado a %', NEW.cpf;
        RETURN NEW;
    END IF;

    RETURN OLD;
END;
$$;

CREATE OR REPLACE TRIGGER monitor_coord_admin
    BEFORE INSERT OR UPDATE OR DELETE
    ON coordenador_administrativo
    FOR EACH ROW
EXECUTE FUNCTION tr_perm_delegate_to_the_manager();
