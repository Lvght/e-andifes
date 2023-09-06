CREATE OR REPLACE FUNCTION fn_watch_gestor_oferta() RETURNS TRIGGER AS $BODY$
BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO historico_gestor_oferta(cpf, operacao, usuario) VALUES (NEW.cpf, 'INSERT', current_user);
        RETURN NEW;
    ELSEIF TG_OP = 'UPDATE' THEN
        INSERT INTO historico_gestor_oferta(cpf, operacao, usuario) VALUES (NEW.cpf, 'UPDATE', current_user);
        RETURN NEW;
    ELSEIF TG_OP = 'DELETE' THEN
        INSERT INTO historico_gestor_oferta(cpf, operacao, usuario) VALUES (OLD.cpf, 'DELETE', current_user);
        RETURN OLD;
    END IF;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER watch_gestor_oferta
AFTER INSERT OR UPDATE OR DELETE ON gestor_oferta
FOR EACH ROW
EXECUTE FUNCTION fn_watch_gestor_oferta();
