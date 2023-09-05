CREATE OR REPLACE FUNCTION warn_truncate_aluno_comunidade_academica() RETURNS trigger AS $$
BEGIN
  RAISE WARNING 'You are truncating the table aluno_comunidade_academica.';
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER warn_truncate_aluno_comunidade_academica_trigger
BEFORE TRUNCATE ON aluno_comunidade_academica
FOR EACH STATEMENT EXECUTE PROCEDURE warn_truncate_aluno_comunidade_academica();

