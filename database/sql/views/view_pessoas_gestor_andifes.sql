CREATE OR REPLACE VIEW view_pessoas_gestor_andifes AS
SELECT 
    p.id AS pessoa_id,
    p.nome AS pessoa_nome,
    ga.id AS gestor_andifes_id,
    ies.nome_completo AS instituicao_nome,
    ies.campus
FROM 
    pessoa p
JOIN 
    gestor_andifes ga ON p.id = ga.FK_id_pessoa
JOIN 
    instituicao_ensino_superior ies ON ga.FK_id_ies = ies.id;
