-- PROCEDIMENTO PARA SETAR O EMAIL DE PESSOA
-- PASSANDO O ID E EMAIL COMO PARÂMETRO

CREATE PROCEDURE pr_cadastra_email(
    id INTEGER,
    pessoa CHAR(11),
    email VARCHAR(255))
    LANGUAGE sql
AS
$$
    INSERT INTO pessoa_email (id, pessoa, email)
    VALUES (id, pessoa, email);
$$;