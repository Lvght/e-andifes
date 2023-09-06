-- Autor: Jonathan Braian Dias Vaz (RA:790780)
-- Esta VIEW é para visualizar as informações de todas as turmas de especialização

CREATE OR REPLACE VIEW view_turmas_especializacao AS
SELECT 
  id_disc_especilizacao,
  codigo_turma,
  data_inicio,
  data_fim
FROM
    turma_disciplina_especializacao;