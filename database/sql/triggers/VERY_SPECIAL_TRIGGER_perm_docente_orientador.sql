-- Autor: Jonathan Braian Dias Vaz (RA:790780)
-- Trigger que delega permissões para o DOCENTE ORIENTADOR

CREATE OR REPLACE FUNCTION tr_perm_delegate_to_the_docente_orientador()
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

        EXECUTE 'REVOKE docente_orientador FROM ' || quote_ident(OLD.cpf);
        RAISE NOTICE 'Cargo docente orientador revogado de %', OLD.cpf;

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

        EXECUTE 'GRANT docente_orientador TO ' || quote_ident(NEW.cpf);
        RAISE NOTICE 'Cargo docente_orientador delegado a %', NEW.cpf;
        RETURN NEW;
    END IF;

    RETURN OLD;
END;
$$;

CREATE OR REPLACE TRIGGER monitor_docente_orientador
    BEFORE INSERT OR UPDATE OR DELETE
    ON docente_orientador
    FOR EACH ROW
EXECUTE FUNCTION tr_perm_delegate_to_the_docente_orientador();