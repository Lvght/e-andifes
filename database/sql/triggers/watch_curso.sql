CREATE OR REPLACE FUNCTION fn_registrar_alteracao_curso()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO hist_curso (data_hora, usuario, id_deleted, nome_deleted, codigo_deleted, idioma_deleted, carga_horaria_deleted, link_plano_de_ensino_deleted)
    SELECT NOW(), current_user, id, nome, codigo, idioma, carga_horaria, link_plano_de_ensino
    FROM curso;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER watch_curso
BEFORE TRUNCATE ON curso
FOR EACH STATEMENT
EXECUTE FUNCTION fn_registrar_alteracao_curso();