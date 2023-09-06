CREATE OR REPLACE VIEW view_turmas_ofertadas_idiomas AS 
SELECT t.id,
       t.dia_semana, 
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

CREATE OR REPLACE FUNCTION view_fn_turma_por_id(id_selecionado integer)
RETURNS TABLE (id integer, dia_semana varchar(50), horario_inicio time, idioma varchar(50), dia_horario_aulas varchar(100), titulo varchar(255), data_inicio date, data_fim date, tipo_oferta varchar(100), horario_termino time, numero_inscritos integer, cpf_professor_isf char(11), nome varchar)
AS $$
BEGIN
  RETURN QUERY
  SELECT * FROM view_turmas_ofertadas_idiomas
  WHERE view_turmas_ofertadas_idiomas.id = id_selecionado;
END;
$$ LANGUAGE plpgsql;