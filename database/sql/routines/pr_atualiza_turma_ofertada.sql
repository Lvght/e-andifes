CREATE OR REPLACE PROCEDURE update_turma_ofertada_idioma(
    p_id INTEGER,
    p_dia_semana VARCHAR(50),
    p_horario_inicio TIME,
    p_idioma VARCHAR(50),
    p_id_curso INTEGER,
    p_dia_horario_aulas VARCHAR(100),
    p_titulo VARCHAR(255),
    p_data_inicio DATE,
    p_data_fim DATE,
    p_tipo_oferta VARCHAR(100),
    p_horario_termino TIME,
    p_numero_inscritos INTEGER,
    p_cpf_professor_isf CHAR(11)
)
AS $$
DECLARE
  -- declare an explicit cursor for the query
  cur_turma_ofertada_idioma CURSOR FOR
    SELECT * FROM turma_ofertada_idioma WHERE id = p_id;
  -- declare a record variable to hold the row
  rec_turma_ofertada_idioma turma_ofertada_idioma%ROWTYPE;
BEGIN
  -- open the cursor
  OPEN cur_turma_ofertada_idioma;
  -- fetch the first row into the record variable
  FETCH cur_turma_ofertada_idioma INTO rec_turma_ofertada_idioma;
  -- check if the row exists
  IF FOUND THEN
    -- update the row with the new values
    UPDATE turma_ofertada_idioma
    SET
        dia_semana = p_dia_semana,
        horario_inicio = p_horario_inicio,
        idioma = p_idioma,
        id_curso = p_id_curso,
        dia_horario_aulas = p_dia_horario_aulas,
        titulo = p_titulo,
        data_inicio = p_data_inicio,
        data_fim = p_data_fim,
        tipo_oferta = p_tipo_oferta,
        horario_termino = p_horario_termino,
        numero_inscritos = p_numero_inscritos,
        cpf_professor_isf = p_cpf_professor_isf
    WHERE CURRENT OF cur_turma_ofertada_idioma; -- use the current row of the cursor
  ELSE
    -- raise an exception if the row does not exist
    RAISE EXCEPTION 'Row with id % not found', p_id;
  END IF;
  -- close the cursor
  CLOSE cur_turma_ofertada_idioma;
END;
$$ LANGUAGE plpgsql;
