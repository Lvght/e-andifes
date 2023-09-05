CREATE OR REPLACE FUNCTION fn_insert_aluno_graduacao()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO curso (nome, codigo, idioma, carga_horaria, link_plano_de_ensino)
    VALUES (NEW.nome, NEW.codigo, NEW.idioma, NEW.carga_horaria, NEW.link_plano_de_ensino);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER instead_of_insert_view_pessoa_aluno_graduacao
INSTEAD OF INSERT ON view_pessoa_aluno_graduacao
FOR EACH ROW
EXECUTE FUNCTION fn_insert_aluno_graduacao();