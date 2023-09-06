-- ESTE É UM GATILHO MUITO ESPECIAL
-- ELE DEFINE ASPECTOS CHAVE DO FUNCIONAMENTO DO SISTEMA.
-- ELE DELEGA PERMISSÕES PARA O GESTOR DA OFERTA COLETIVA.

CREATE OR REPLACE FUNCTION tr_perm_delegate_to_the_oc_manager()
    RETURNS trigger
    LANGUAGE plpgsql
AS
$$
BEGIN
    IF TG_OP = 'DELETE' THEN
        EXECUTE 'REVOKE gestor_oferta_coletiva TO ' || quote_ident(OLD.cpf);
        RAISE NOTICE 'Cargo gestor_oferta_coletiva revogado de %', OLD.cpf;
    ELSIF TG_OP = 'INSERT' OR TG_OP = 'UPDATE' THEN
        EXECUTE 'GRANT gestor_oferta_coletiva TO ' || quote_ident(NEW.cpf);
        RAISE NOTICE 'Cargo gestor_oferta_coletiva delegado a %', NEW.cpf;
        RETURN NEW;
    END IF;

    RETURN OLD;
END;
$$;

CREATE OR REPLACE TRIGGER monitor_gestor_oferta_coletiva
    BEFORE INSERT OR UPDATE OR DELETE
    ON gestor_oferta_coletiva
    FOR EACH ROW
EXECUTE FUNCTION tr_perm_delegate_to_the_oc_manager();
