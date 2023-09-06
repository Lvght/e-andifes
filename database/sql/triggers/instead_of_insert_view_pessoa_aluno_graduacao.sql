CREATE OR REPLACE FUNCTION view_insert_view_pessoa_aluno_graduacao() RETURNS trigger AS $$
BEGIN
  INSERT INTO turma_ofertada_idioma (cpf, link_certPOCA, link_vinculoFile, link_termoCompromisso, link_resultadoSelecao) 
  VALUES (NEW.cpf, NEW.link_certPOCA, NEW.link_vinculoFile, NEW.link_termoCompromisso, NEW.link_resultadoSelecao);
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER view_insert_view_pessoa_aluno_graduacao_trigger
INSTEAD OF INSERT ON view_pessoas_aluno_graduacao
FOR EACH ROW EXECUTE PROCEDURE view_insert_view_pessoa_aluno_graduacao();