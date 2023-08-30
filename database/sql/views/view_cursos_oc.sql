CREATE OR REPLACE VIEW view_cursos_oc AS
SELECT
    t.id,
    t.dia_semana,
    t.horario_inicio,
    t.idioma,
    t.id_curso,
    t.dia_horario_aulas,
    t.titulo,
    t.data_inicio,
    t.data_fim,
    t.tipo_oferta,
    t.horario_termino,
    t.numero_inscritos,
    t.cpf_professor_isf
FROM
    turma_ofertada_idioma t;