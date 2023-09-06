CREATE OR REPLACE FUNCTION trigger_insere_pessoa()
    RETURNS trigger
    LANGUAGE plpgsql
AS
$$
DECLARE
    endereco_id integer;
    rec         record;
    endc        refcursor;
    telc        refcursor;
BEGIN
    OPEN endc FOR SELECT *
                  FROM endereco
                  WHERE codigo_postal = NEW.endereco_codigo_postal
                    and pais = NEW.endereco_pais;
    FETCH endc INTO rec;

    IF NOT FOUND THEN
        INSERT INTO endereco (id, codigo_postal, cidade, estado, pais)
        VALUES (DEFAULT,
                NEW.endereco_codigo_postal,
                NEW.endereco_cidade,
                NEW.endereco_estado,
                NEW.endereco_pais)
        RETURNING id INTO endereco_id;
    ELSE
        endereco_id := rec.id;
    END IF;
    CLOSE endc;

    INSERT INTO pessoa (cpf,
                        nome_registro,
                        nome_social,
                        nascimento,
                        endereco_numero,
                        endereco_rua,
                        endereco_bairro,
                        endereco_id)
    VALUES (NEW.cpf,
            NEW.nome,
            NULL,
            NEW.nascimento,
            NEW.endereco_numero,
            NEW.endereco_rua,
            NEW.endereco_bairro,
            endereco_id);

    RETURN NEW;
END;
$$;

CREATE OR REPLACE TRIGGER instead_of_insert_view_admin_pessoa
    INSTEAD OF INSERT
    ON view_admin_pessoa
    FOR EACH ROW
EXECUTE FUNCTION trigger_insere_pessoa();
