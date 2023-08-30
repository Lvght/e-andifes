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