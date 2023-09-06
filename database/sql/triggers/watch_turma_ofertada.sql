CREATE OR REPLACE FUNCTION warn_truncate_turma() RETURNS trigger AS $$
BEGIN
  RAISE WARNING 'You are truncating the table turma_ofertada_idioma.';
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER warn_truncate_turma_trigger
BEFORE TRUNCATE ON turma_ofertada_idioma
FOR EACH STATEMENT EXECUTE PROCEDURE warn_truncate_turma();

