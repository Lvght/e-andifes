-- ESTE É UM GATILHO MUITO ESPECIAL
-- ELE DEFINE ASPECTOS CHAVE DO FUNCIONAMENTO DO SISTEMA.
-- ELE DELEGA PERMISSÕES PARA O GESTOR DA REDE ANDIFES QUE NESTE CASO É O ESPECIALISTA.

CREATE OR REPLACE FUNCTION tr_perm_especialista()
    RETURNS trigger
    LANGUAGE plpgsql
AS
$$
BEGIN
    IF TG_OP = 'DELETE' THEN
        EXECUTE 'REVOKE gestor_andifes TO ' || quote_ident(OLD.cpf);
        RAISE NOTICE 'Cargo gestor_andifes revogado de %', OLD.cpf;
    ELSIF TG_OP = 'INSERT' OR TG_OP = 'UPDATE' THEN
        EXECUTE 'GRANT gestor_andifes TO ' || quote_ident(NEW.cpf);
        RAISE NOTICE 'Cargo gestor_andifes delegado a %', NEW.cpf;
        RETURN NEW;
    END IF;

    RETURN OLD;
END;
$$;

CREATE OR REPLACE TRIGGER especialista_gestor_andifes
    BEFORE INSERT OR UPDATE OR DELETE
    ON gestor_andifes
    FOR EACH ROW
EXECUTE FUNCTION tr_perm_especialista();