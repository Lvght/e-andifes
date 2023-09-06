CREATE OR REPLACE PROCEDURE pr_cadastra_edital(
    nome VARCHAR,
    arquivo BYTEA,
    data_publicacao DATE,
    ano INTEGER,
    semestre INTEGER)
    LANGUAGE sql
AS
$$
INSERT INTO edital (nome, data_publicacao, ano, semestre, publicado_por, arquivo)
VALUES (nome, data_publicacao, ano, semestre, CURRENT_USER, arquivo);
$$;
