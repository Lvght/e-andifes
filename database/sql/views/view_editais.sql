--TEMP implementacao final de Gabrielly Castilho, 
--fazendo apenas para rodar instead_of_insert_view_edital

CREATE OR REPLACE VIEW view_editais AS
SELECT
    id,
    data_publicacao,
    nome,
    arquivo,
    ano,
    semestre,
    publicado_por,
    criado_em,
    criado_por
FROM
    edital;