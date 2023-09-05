CREATE OR REPLACE FUNCTION view_insert_turmas_ofertadas() RETURNS trigger AS $$
BEGIN
  INSERT INTO turma_ofertada_idioma (cpf, link_certPOCA, link_vinculoFile, link_termoCompromisso, link_resultadoSelecao) 
  VALUES (NEW.cpf, NEW.link_certPOCA, NEW.link_vinculoFile, NEW.link_termoCompromisso, NEW.link_resultadoSelecao);
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER view_insert_turma_trigger
INSTEAD OF INSERT ON view_turmas_ofertadas_idiomas
FOR EACH ROW EXECUTE PROCEDURE view_insert_turmas_ofertadas();