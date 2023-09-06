--criacao da funcao auxiliar
CREATE OR REPLACE FUNCTION fn_inserir_view_ficha()
RETURNS TRIGGER AS $$
BEGIN
    --insercao
    INSERT INTO curso (id,titulo,data_inicio,data_termino,observacoes,criado_em,criado_por,edital)
    VALUES (NEW.id, NEW.titulo, NEW.data_inicio, NEW.data_termino, NEW.observacoes, NEW.criado_em, NEW.criado_por, NEW.edital);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

--trigger InsteadOf
CREATE TRIGGER instead_of_insert_view_ficha
INSTEAD OF INSERT ON view_ficha
FOR EACH ROW
EXECUTE FUNCTION fn_inserir_view_ficha();