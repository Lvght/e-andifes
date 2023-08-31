-- Essa função irá retornar todas as turmas já finalizadas
-- Ademais, há um cursor explícito classificando cada turma como 'ativa' ou 'finalizada'
CREATE OR REPLACE FUNCTION fn_turmas_finalizadas()
RETURNS TABLE (
	dia_semana VARCHAR,
	horario_inicio TIME,
	idioma VARCHAR,
	dia_horario_aulas VARCHAR,
	titulo VARCHAR,
	data_inicio DATE,
	data_fim DATE,
	tipo_oferta VARCHAR,
	horario_termino TIME,
	numero_inscritos INTEGER,
	id_curso INTEGER,
	cpf_professor_isf CHAR(11)
)
AS $$
DECLARE
	c_turmas CURSOR FOR SELECT data_inicio, data_fim FROM turma_ofertada_idioma;
	c_data_inicio DATE;
	c_data_fim DATE;
	c_classifica VARCHAR(12);
	contador INTEGER;
BEGIN
	contador = 0;
	OPEN c_turmas;
	FETCH c_turmas INTO c_data_inicio, c_data_fim;
	WHILE c_turmas%FOUND LOOP
		IF CURRENT_DATE BETWEEN c_data_inicio AND c_data_fim THEN
			c_classifica := 'Ativa';
		ELSE
			c_classifica := 'Finalizada';
			contador := contador + 1;
		END IF;
			FETCH c_turmas INTO c_data_inicio, c_data_fim;
	END LOOP;
	CLOSE c_turmas;
	
	-- Imprimir quantas turmas finalizadas há até o momento
	RAISE NOTICE 'A quantidade de turmas finalizadas = %', contador;
	
END;
$$ LANGUAGE plpgsql;