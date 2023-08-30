CREATE PROCEDURE pr_cadastra_edital(
    nome VARCHAR,
    data DATE,
    ano INTEGER,
    semestre INTEGER)
    LANGUAGE sql
AS
$$
    INSERT INTO edital (nome, data, ano, semestre, publicado_por, conteudo)
    VALUES (nome, data, ano, semestre, CURRENT_USER, '');
$$;

