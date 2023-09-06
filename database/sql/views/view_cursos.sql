/*
Autor: Miguel Henrique Chinellato (RA:791964)
Descrição: View para obter as informações 
           de todos os cursos do sistema
*/

CREATE OR REPLACE VIEW view_cursos AS
SELECT
    id,
    nome,
    codigo,
    idioma,
    carga_horaria,
    link_plano_de_ensino
FROM
    curso;