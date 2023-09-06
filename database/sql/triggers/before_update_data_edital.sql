/*  
    ARTEFATO MODIFICADO de after_insert_update_data_edital para before_update_data_edital
    RAZAO: nao tinha motivo checar a data antes da primeira publicacao

    Autor: Lucas Maciel Balieiro
    Artefatos:
        -Assertion
        -TriggerDML
    *Validacao de que a data de publicacao inicial do edital nao seja modificada

*/
CREATE OR REPLACE FUNCTION edital_data_update()
    RETURNS trigger
    LANGUAGE plpgsql
AS
$$
BEGIN
    IF OLD.data_publicacao <> NEW.data_publicacao THEN
        RAISE EXCEPTION 'Nao e possivel modificar a data de publicacao do edital';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tr_edital_data_update
BEFORE UPDATE ON edital
FOR EACH ROW
WHEN (OLD.data_publicacao IS DISTINCT FROM NEW.data_publicacao)
EXECUTE FUNCTION edital_data_update();