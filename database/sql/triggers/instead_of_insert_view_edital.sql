/*
    Autor: Lucas Maciel Balieiro
    Artefatos:
        -Trigger InsteadOf: Cria um edital pela view, se o especialista 
        ainda nao for um gestor, cria um gestor antes
*/
CREATE OR REPLACE FUNCTION trigger_insere_edital()
    RETURNS trigger
    LANGUAGE plpgsql
AS
$$
DECLARE
    cpf_buscado integer;
    gest_c refcursor;
    esp_c refcursor;
    rec record;
    gest_r record;
BEGIN
    OPEN gest_c FOR SELECT * FROM gestor_andifes
    WHERE cpf = NEW.publicado_por;
    FETCH gest_c INTO rec;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'Nao foi possivel associar um especialista ao cpf: %', NEW.publicado_por;
    END IF;
    CLOSE gest_c;

    INSERT INTO edital (data_publicacao, nome, arquivo, ano, semestre, publicado_por, criado_em, criado_por)
    VALUES (NEW.data_publicacao, NEW.nome, NULL, NEW.ano, NEW.semestre, NEW.publicado_por, NEW.criado_em, NEW.criado_por);
    RETURN NEW;
END;
$$

CREATE OR REPLACE TRIGGER instead_of_insert_view_edital
    INSTEAD OF INSERT ON view_editais
    FOR EACH ROW EXECUTE FUNCTION trigger_insere_edital();
