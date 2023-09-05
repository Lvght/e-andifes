/*
Autor: Caio Ueda Sampaio (RA:802215)
Descrição: View do modal de um edital específico dado seu id
*/
CREATE VIEW view_modal_edital AS
SELECT
    id,
    data_publicacao,
    nome,
    ano,
    semestre,
    publicado_por,
    criado_em,
    criado_por,
FROM edital.sql 

CREATE OR REPLACE FUNCTION view_fn_modal_edital(id_edital integer)
RETURNS TABLE (id integer, data_publicacao date, nome varchar(255), ano integer, semestre integer, publicado_por char(11), criado_em timestamp, criado_por varchar)
AS $$ 
BEGIN
    RETURN QUERY
    SELECT * FROM view_modal_edital
    WHERE view_modal_edital.id = id_edital;
END;