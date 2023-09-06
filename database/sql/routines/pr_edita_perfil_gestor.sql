--Essa é uma versão base, a ideia é que ele possa editar mais dados --
CREATE OR REPLACE PROCEDURE update_perfil_gestor_andifes(
    p_cpf CHAR(11),
    p_nome_registro VARCHAR,
    p_nome_social VARCHAR,
    p_nascimento DATE,
    p_genero genero,
    p_endereco_rua VARCHAR,
    p_endereco_numero VARCHAR,
    p_endereco_bairro VARCHAR,
    p_endereco_codigo_postal VARCHAR,
    p_endereco_cidade VARCHAR,
    p_endereco_estado VARCHAR,
    p_endereco_pais VARCHAR)
AS $$
DECLARE
    r           REFCURSOR;
    rec         RECORD;
    p_endereco_id INTEGER;
BEGIN
    OPEN r FOR SELECT * FROM endereco WHERE codigo_postal = p_endereco_codigo_postal AND pais = p_endereco_pais;
    FETCH r INTO rec;

    IF NOT FOUND THEN
        INSERT INTO endereco (codigo_postal, cidade, estado, pais)
        VALUES (p_endereco_codigo_postal, p_endereco_cidade, p_endereco_estado, p_endereco_pais)
        RETURNING id INTO p_endereco_id;
    ELSE
        p_endereco_id := rec.id;
    END IF;
    CLOSE r;

    UPDATE pessoa
    SET
        nome_social = p_nome_social,
        nascimento = p_nascimento,
        nome_registro = p_nome_registro,
        genero = p_genero,
        endereco_rua = p_endereco_rua,
        endereco_numero = p_endereco_numero,
        endereco_bairro = p_endereco_bairro,
        endereco_id = p_endereco_id 
    WHERE pessoa.cpf = p_cpf;

END;
$$ LANGUAGE plpgsql;
