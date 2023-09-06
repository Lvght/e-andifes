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
    edi_r record;
    gest_r record;
BEGIN
    OPEN gest_c FOR SELECT 1 FROM gestor_andifes
    WHERE cpf = NEW.gestor_cpf;
    FETCH gest_c INTO edi_r;

    IF NOT FOUND THEN
        CLOSE gest_c;
        OPEN esp_c FOR SELECT 1 FROM especialista
        WHERE cpf = NEW.gestor_cpf;
        FETCH esp_c INTO gest_r;

        IF NOT FOUND THEN
            RAISE EXCEPTION 'Nao foi possivel associar um especialista ao cpf: %', NEW.gestor_cpf;
        ELSE
            INSERT INTO gestor_andifes (cpf, papel_atuacao)
            VALUES (NEW.gestor_cpf, NEW.gestor_papel)
            RETURNING cpf INTO cpf_buscado;
        END IF;
        CLOSE esp_c;
    ELSE
        cpf_buscado := edi_r;
    END IF;
    CLOSE gest_c;

    INSERT INTO edital (data_publicacao, nome, arquivo, ano, semestre, publicado_por, criado_em, criado_por)
    VALUES (NEW.data_publicacao, NEW.nome, NEW.arquivo, NEW.ano, NEW.semestre, cpf_buscado, NEW.criado_em, NEW.criado_por);
    RETURN NEW;
END;
$$

CREATE OR REPLACE TRIGGER instead_of_insert_view_edital
    INSTEAD OF INSERT ON view_editais
    FOR EACH ROW EXECUTE FUNCTION trigger_insere_edital();
