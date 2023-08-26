CREATE PROCEDURE cadastra_pessoa(
    senha VARCHAR,
    cpf CHAR(11),
    nome_registro VARCHAR,
    nome_social VARCHAR,
    nascimento DATE,
    endereco_rua VARCHAR,
    endereco_numero VARCHAR,
    endereco_bairro VARCHAR,
    endereco_codigo_postal VARCHAR,
    endereco_cidade VARCHAR,
    endereco_estado VARCHAR,
    endereco_pais VARCHAR)
    LANGUAGE plpgsql
AS
$$
DECLARE
    r           REFCURSOR;
    rec         RECORD;
    endereco_id INTEGER;
BEGIN
    OPEN r FOR SELECT * FROM endereco WHERE codigo_postal = endereco_codigo_postal and pais = endereco_pais;
    FETCH r INTO rec;

    IF NOT FOUND THEN
        INSERT INTO endereco (codigo_postal, cidade, estado, pais)
        VALUES (endereco_codigo_postal, endereco_cidade, endereco_estado, endereco_pais)
        RETURNING id INTO endereco_id;
    ELSE
        endereco_id := rec.id;
    END IF;
    CLOSE r;

    INSERT INTO pessoa (cpf, nome_registro, nome_social, nascimento, endereco_rua, endereco_numero, endereco_bairro,
                        endereco_id)
    VALUES (cpf, nome_registro, nome_social, nascimento, endereco_rua, endereco_numero, endereco_bairro, endereco_id);

    IF senha IS NOT NULL THEN
        EXECUTE 'CREATE ROLE ' || quote_ident(cpf) || ' LOGIN PASSWORD ' || quote_literal(senha);
    END IF;

    RAISE NOTICE 'Nova pessoa cadastrada: % (%) pelo usuário %.' , nome_registro, cpf, CURRENT_USER;
END
$$;
