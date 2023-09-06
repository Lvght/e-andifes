/*
Autor: Caio Ueda Sampaio (RA:802215)
Descrição: trigger instead of insert para inserir dados na view_modal_edital
*/

CREATE OR REPLACE FUNCTION fn_view_insert_modal_edital()
RETURNS TRIGGER AS $$
BEGIN
    RAISE NOTICE 'Operação de INSERT personalizada em view_fn_modal_edital';
    INSERT INTO edital (data_publicacao, nome, ano, semestre, publicado_por, criado_em, criado_por)
    VALUES (NEW.data_publicacao, NEW.nome, NEW.ano, NEW.semestre, NEW.publicado_por, NEW.criado_em, NEW.criado_por);
    RETURN NULL;
END;
$$ 
LANGUAGE plpgsql;

CREATE TRIGGER instead_of_insert_view_modal_edital
INSTEAD OF INSERT ON
view_modal_edital
FOR EACH ROW
EXECUTE FUNCTION fn_view_insert_modal_edital();
