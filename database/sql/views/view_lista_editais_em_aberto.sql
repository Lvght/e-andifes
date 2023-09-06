CREATE OR REPLACE FUNCTION check_data_termino(p_data_termino date)
RETURNS BOOLEAN AS $$
BEGIN
  IF p_data_termino IS NULL THEN
    RETURN FALSE;
  END IF;

  RETURN current_date <= p_data_termino;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE VIEW editais_abertos AS
SELECT 
  ed.nome, 
  fb.data_termino, 
  fb.id,
  ed.semestre,
  ed.ano,
  fb.edital
FROM 
  ficha_base fb
JOIN
  edital ed ON ed.id = fb.edital
WHERE current_date <= fb.data_termino;