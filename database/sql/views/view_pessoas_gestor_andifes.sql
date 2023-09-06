CREATE OR REPLACE VIEW view_pessoas_gestor_andifes AS
SELECT 
    p.cpf AS pessoa_cpf,
    p.nome AS pessoa_nome,
    ga.id AS gestor_andifes_id,
    ies.nome_completo AS instituicao_nome,
    ies.campus
FROM 
    pessoa p
JOIN 
    gestor_andifes ga ON p.cpf = ga.FK_cpf_pessoa
JOIN 
    instituicao_ensino_superior ies ON ga.FK_id_ies = ies.id;
