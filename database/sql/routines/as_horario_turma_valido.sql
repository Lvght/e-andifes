CREATE OR REPLACE FUNCTION check_horario()
RETURNS TRIGGER AS $$
BEGIN
  IF NEW.horario_termino > NEW.horario_inicio THEN
    RETURN NEW;
  ELSE
    RAISE EXCEPTION 'Horario de termino invalido, deve ser após horario de inicio';
  END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_horario_trigger
BEFORE INSERT OR UPDATE ON turma_ofertada_idioma
FOR EACH ROW EXECUTE PROCEDURE check_horario();