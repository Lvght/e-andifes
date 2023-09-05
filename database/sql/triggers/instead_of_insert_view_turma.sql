CREATE OR REPLACE FUNCTION view_insert_turmas_ofertadas() RETURNS trigger AS $$
BEGIN
  INSERT INTO turma_ofertada_idioma (dia_semana, horario_inicio, idioma, id_curso, dia_horario_aulas, titulo, data_inicio, data_fim, tipo_oferta, horario_termino, numero_inscritos, cpf_professor_isf) 
  VALUES (NEW.dia_semana, NEW.horario_inicio, NEW.idioma, NEW.id_curso, NEW.dia_horario_aulas, NEW.titulo, NEW.data_inicio, NEW.data_fim, NEW.tipo_oferta, NEW.horario_termino, NEW.numero_inscritos, NEW.cpf_professor_isf);
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER view_insert_turma_trigger
INSTEAD OF INSERT ON view_turmas_ofertadas_idiomas
FOR EACH ROW EXECUTE PROCEDURE view_insert_turmas_ofertadas();