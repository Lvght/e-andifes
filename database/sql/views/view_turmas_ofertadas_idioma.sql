CREATE VIEW view_turmas_ofertadas_idiomas AS
SELECT dia_semana,
       horario_inicio,
       idioma,
       dia_horario_aulas,
       titulo,
       data_inicio,
       data_fim,
       tipo_oferta,
       horario_termino,
       numero_inscritos,
       cpf_professor_isf,
       nome as professor_nome,

FROM turma_ofertada_idioma
    INNER JOIN professor_isf ON professor_isf.cpf = turma_ofertada_idioma.cpf_professor_isf;

CREATE VIEW view_turmas_ofertadas_idiomas AS 
SELECT t.dia_semana, 
       t.horario_inicio, 
       t.idioma, 
       t.dia_horario_aulas, 
       t.titulo, 
       t.data_inicio, 
       t.data_fim, 
       t.tipo_oferta, 
       t.horario_termino, 
       t.numero_inscritos, 
       t.cpf_professor_isf, 
       p.nome AS nome_professor 
FROM turma_ofertada_idioma AS t 
    JOIN pessoa AS p ON t.cpf_professor_isf = p.cpf;