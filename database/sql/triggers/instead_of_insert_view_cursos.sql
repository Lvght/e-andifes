CREATE OR REPLACE FUNCTION fn_inserir_view_cursos()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO curso (nome, codigo, idioma, carga_horaria, link_plano_de_ensino)
    VALUES (NEW.nome, NEW.codigo, NEW.idioma, NEW.carga_horaria, NEW.link_plano_de_ensino);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER instead_of_insert_view_cursos
INSTEAD OF INSERT ON view_cursos
FOR EACH ROW
EXECUTE FUNCTION fn_inserir_view_cursos();


select * from andifes.pg_catalog.pg_stat_activity