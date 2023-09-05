CREATE VIEW view_pessoa_aluno_graduacao AS
SELECT  ag.link_certPOCA,
        aglink_vinculoFile,
        ag.link_termoCompromisso,
        ag.link_resultadoSelecao,
        p.cpf,
        p.nome,
        p.primeiro_nome,
        p.sobrenome,
        p.fn_has_system_access(cpf) as possui_acesso,
        p.nascimento,
        p.endereco_rua,
        p.endereco_numero,
        p.endereco_bairro,
        p.codigo_postal as endereco_codigo_postal,
        p.cidade as endereco_cidade,
        p.estado as endereco_estado,
        p.pais as endereco_pais
       
FROM aluno_graduacao
    INNER JOIN cpf ON p.cpf = p.cpf
    INNER JOIN endereco ON pessoa.endereco_id = endereco.id;
