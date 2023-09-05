CREATE OR REPLACE VIEW view_pessoas_especialista AS
SELECT
    e.cpf,
    e.tipo_instituicao_atua,
    e.nome_mae,
    e.cert_poca,
    e.tipo_vinculo,
    e.setor_atuacao,
    e.lattes,
    e.maior_titulacao,
    p.nome AS nome_pessoa,
    p.email AS email_pessoa,
    p.data_nascimento AS data_nascimento_pessoa
FROM
    especialista e
INNER JOIN
    pessoa p ON e.cpf = p.cpf;
