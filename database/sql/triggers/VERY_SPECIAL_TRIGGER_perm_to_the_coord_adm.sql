
CREATE OR REPLACE FUNCTION tr_perm_delegate_to_the_coord_admin()
    RETURNS trigger
    LANGUAGE plpgsql
AS
$$
DECLARE
    role_exists BOOLEAN;
BEGIN
    
    IF TG_OP = 'DELETE' THEN
        -- Verifica se o role existe
        SELECT INTO role_exists
        EXISTS (
            SELECT 1
            FROM pg_roles
            WHERE rolname = OLD.cpf
        );

        -- Dispara uma exceção se o role não existir
        ASSERT role_exists, 'Role não encontrado.';

        EXECUTE 'REVOKE coordenador_administrativo FROM ' || quote_ident(OLD.cpf);
        RAISE NOTICE 'Cargo coordenador_administrativo revogado de %', OLD.cpf;

    ELSIF TG_OP = 'INSERT' OR TG_OP = 'UPDATE' THEN
        -- Verifica se o role existe
        SELECT INTO role_exists
        EXISTS (
            SELECT 1
            FROM pg_roles
            WHERE rolname = NEW.cpf
        );

        -- Dispara uma exceção se o role não existir
        ASSERT role_exists, 'Role não encontrado.';

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
EXECUTE FUNCTION tr_perm_delegate_to_the_coord_admin();
