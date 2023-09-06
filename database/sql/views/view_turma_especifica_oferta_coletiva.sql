CREATE OR REPLACE VIEW view_turma_ofertada_idioma AS
SELECT 
    id,
    dia_semana,
    horario_inicio,
    idioma,
    id_curso,
    dia_horario_aulas,
    titulo,
    data_inicio,
    data_fim,
    tipo_oferta,
    horario_termino,
    numero_inscritos,
    cpf_professor_isf
FROM turma_ofertada_idioma;
