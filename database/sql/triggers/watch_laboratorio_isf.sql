-- TRIGGER SCHEMA PARA LABORATÓRIO ISF

CREATE OR REPLACE FUNCTION tr_watch_laboratorio_isf() 
RETURNS trigger 
AS $$
BEGIN
  RAISE WARNING 'You are truncating the table laboratorio_isf.';
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER watch_laboratorio_isf
    BEFORE TRUNCATE ON laboratorio_isf
    FOR EACH STATEMENT 
    EXECUTE PROCEDURE tr_watch_laboratorio_isf();