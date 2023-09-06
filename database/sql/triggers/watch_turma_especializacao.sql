--Autor: Lucas Maciel Balieiro
CREATE OR REPLACE FUNCTION warn_truncate_turma_especializacao() RETURNS trigger AS $$
BEGIN
  RAISE WARNING 'You are truncating the table turma_disciplina_especializacao.';
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER warn_truncate_turma_especializacao_trigger
BEFORE TRUNCATE ON turma_disciplina_especializacao
FOR EACH STATEMENT EXECUTE PROCEDURE warn_truncate_turma_especializacao();