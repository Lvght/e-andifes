CREATE OR REPLACE VIEW view_coordenador_gestor AS
SELECT
    ca.CPF AS CPF_coordenador,
    ca.lattes,
    ca.funcao_ies,
    ca.certificadoPOCA,
    ca.CPF_gestor,
    p.cpf AS CPF_pessoa,
    p.nome_registro AS nome_registro_pessoa,
    p.nome_social AS nome_social_pessoa,
    p.nascimento AS nascimento_pessoa,
    p.genero AS genero_pessoa,
    p.endereco_numero AS endereco_numero_pessoa,
    p.endereco_rua AS endereco_rua_pessoa,
    p.endereco_bairro AS endereco_bairro_pessoa,
    p.endereco_id AS endereco_id_pessoa,
    p.primeiro_nome AS primeiro_nome_pessoa,
    p.sobrenome AS sobrenome_pessoa,
    p.email,
    p.telefone,
    ga.papel_atuacao AS papel_gestor
FROM
    coordenador_administrativo ca
JOIN
    pessoa p ON ca.CPF = p.CPF
LEFT JOIN
    gestor_andifes ga ON ca.CPF_gestor = ga.cpf;
