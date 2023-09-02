CREATE OR REPLACE FUNCTION validar_datas_turma()
RETURNS TRIGGER AS $$
BEGIN
    ASSERT NEW.data_inicio < NEW.data_fim, 'Data de início deve ser menor que data de fim';
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER before_insert_update_data_turma
BEFORE INSERT OR UPDATE ON turma_ofertada_idioma
FOR EACH ROW
EXECUTE FUNCTION validar_datas_turma();