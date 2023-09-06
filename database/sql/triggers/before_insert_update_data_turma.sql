/*
Autor: Miguel Henrique Chinellato (RA:791964)
Descrição: Trigger DML que vigia a tabela turma_ofertada_idioma, verificando (antes de um 
           INSERT ou UPDATE) se a data de início inserida é menor que a data final por 
           meio de um ASSERT
*/

-- Função que valida as datas de início e fim por meio de um ASSERT
CREATE OR REPLACE FUNCTION validar_datas_turma()
RETURNS TRIGGER AS $$
BEGIN
    ASSERT NEW.data_inicio < NEW.data_fim, 'Data de início deve ser menor que data de fim';
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger que chama a função de validação declarada acima antes de INSERT ou UPDATE
CREATE TRIGGER before_insert_update_data_turma
BEFORE INSERT OR UPDATE ON turma_ofertada_idioma
FOR EACH ROW
EXECUTE FUNCTION validar_datas_turma();