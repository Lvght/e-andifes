-- Autor: Jonathan Braian Dias Vaz (RA:790780)
-- Trigger que vigia a tabela DOCENTE ORIENTADOR e armazena um historico

CREATE OR REPLACE FUNCTION tr_watch_docente_orientador() 
RETURNS trigger 
AS $$
BEGIN
  RAISE WARNING 'You are truncating the table docente_orientador.';
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER watch_docente_orientador
    BEFORE TRUNCATE ON docente_orientador
    FOR EACH STATEMENT 
    EXECUTE PROCEDURE tr_watch_docente_orientador();