-- Autor: Jonathan Braian Dias Vaz (RA:790780)
-- Este PROCEDIMENTO cadastra as turmas de especialização

CREATE OR REPLACE PROCEDURE pr_cadastra_turmas_especializacao (
  p_id_disc_especilizacao INTEGER,
  p_codigo_turma INTEGER,
  p_data_inicio  DATE,
  p_data_fim DATE 
)
AS $$
BEGIN
    IF FOUND THEN -- Se a turma já estiver cadastrada
	RAISE EXCEPTION 'Turma já cadastradada';
    ELSE -- Caso a turma não estiver cadastrada, insere ela
	INSERT INTO turma_disciplina_especializacao (id_disc_especilizacao,codigo_turma,data_inicio,data_fim)
	VALUES (p_id_disc_especilizacao,p_codigo_turma,p_data_inicio,p_data_fim);
    END IF;
END;
$$ LANGUAGE plpgsql;