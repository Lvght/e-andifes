/*
    Autor: Lucas Maciel Balieiro
    Artefatos:
        -View: Visualiza dados mais detalhados sobre o edital
        -Function: Seleciona por id
*/
CREATE VIEW view_detalhes_edital AS
SELECT  e.id,
        e.nome, 
        e.data_publicacao, 
        e.criado_por,
        e.ano,
        e.semestre,
        e.publicado_por, 
        p.nome_registro AS nome_gestor,
        g.papel_atuacao AS atuacao_gestor
FROM edital AS e
JOIN gestor_andifes AS g ON e.publicado_por = g.cpf
JOIN especialista AS esp ON g.cpf = esp.cpf
JOIN pessoa AS p ON esp.cpf = p.cpf;

CREATE OR REPLACE FUNCTION view_detalhes_edital_by_id(f_id INTEGER)
RETURNS TABLE(id INTEGER, nome VARCHAR(255), data_publicacao DATE, criado_por VARCHAR, ano INTEGER, semestre INTEGER, publicado_por CHAR(11), nome_registro VARCHAR(50), papel_atuacao VARCHAR(50))
AS $$
BEGIN
    RETURN QUERY
    SELECT * FROM view_detalhes_edital
    WHERE view_detalhes_edital.id = f_id;
END;
$$ LANGUAGE plpgsql;