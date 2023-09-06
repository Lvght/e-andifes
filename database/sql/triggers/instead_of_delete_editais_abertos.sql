
CREATE OR REPLACE FUNCTION fn_delete_view_lista_editais_em_aberto()
RETURNS TRIGGER AS $$
BEGIN
    DELETE FROM ficha_base WHERE id = OLD.id;
    DELETE FROM edital WHERE id = OLD.edital;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER instead_of_delete_editais_abertos
INSTEAD OF DELETE ON editais_abertos
FOR EACH ROW
EXECUTE FUNCTION fn_delete_view_lista_editais_em_aberto();