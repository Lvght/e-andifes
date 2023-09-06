CREATE OR REPLACE FUNCTION fn_registrar_alteracao_coord_admin()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO hist_coord_admin (data_hora, usuario, cpf_deleted, lattes_deleted, funcao_ies_deleted, certificadoPOCA_deleted)
    SELECT NOW(), current_user, cpf, lattes, funcao_ies, certificadopoca
    FROM coordenador_administrativo;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER watch_coord_admin
BEFORE TRUNCATE ON coordenador_administrativo
FOR EACH STATEMENT
EXECUTE FUNCTION fn_registrar_alteracao_coord_admin();