-- Este procedimento cadastra as turmas da oferta coletiva
CREATE OR REPLACE PROCEDURE pr_cadastra_turmas_oc (
    p_dia_semana VARCHAR,
    p_horario_inicio TIME,
    p_idioma VARCHAR,
    p_dia_horario_aulas VARCHAR,
    p_titulo VARCHAR,
    p_data_inicio DATE,
    p_data_fim DATE,
    p_tipo_oferta VARCHAR,
    p_horario_termino TIME,
    p_numero_inscritos INTEGER,
    p_id_curso INTEGER,
    p_cpf_professor_isf CHAR(11)
)
AS $$
BEGIN
    IF FOUND THEN -- Se a turma já estiver cadastrada
	RAISE EXCEPTION 'Turma já cadastradada';
    ELSE -- Caso a turma não estiver cadastrada, insere ela
	INSERT INTO turma_ofertada_idioma (dia_semana, horario_inicio, idioma, dia_horario_aulas, titulo, data_inicio, data_fim, tipo_oferta, horario_termino, numero_inscritos, id_curso, cpf_professor_isf)
	VALUES (p_dia_semana, p_horario_inicio, p_idioma, p_dia_horario_aulas, p_titulo, p_data_inicio, p_data_fim, p_tipo_oferta, p_horario_termino, p_numero_inscritos, p_id_curso, p_cpf_professor_isf);
    END IF;
END;
$$ LANGUAGE plpgsql;
