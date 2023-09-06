CREATE OR REPLACE FUNCTION tr_instead_of_delete_view_turmas()
    RETURNS trigger
    LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM turma_ofertada_idioma WHERE id = OLD.id;
    RETURN NEW;
END;
$$; 

CREATE OR REPLACE TRIGGER instead_of_delete_view_turmas
    INSTEAD OF DELETE ON turma_ofertada_idioma
    FOR EACH ROW
    EXECUTE FUNCTION tr_instead_of_delete_view_turmas();
