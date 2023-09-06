-- Criação da view
CREATE OR REPLACE VIEW view_cursos_oc AS
SELECT
    c.id AS curso_id,
    c.nome AS nome_curso,
    c.codigo AS codigo_curso,
    c.idioma AS idioma_curso,
    c.carga_horaria AS carga_horaria_curso,
    t.id AS turma_id
FROM curso c
INNER JOIN turma_ofertada_idioma t ON c.id = t.id_curso;
