-- Esta é uma trigger schema
CREATE OR REPLACE FUNCTION tr_watch_professor_isf() 
RETURNS trigger 
AS $$
BEGIN
  RAISE WARNING 'You are truncating the table professor_isf.';
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER watch_professor_isf
    BEFORE TRUNCATE ON professor_isf
    FOR EACH STATEMENT 
    EXECUTE PROCEDURE tr_watch_professor_isf();
