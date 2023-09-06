/*
Autor: Pedro Lealdini do Prado Borges (RA:790894)
Descrição: Trigger Schema que vigia a disciplina especializacao e armazena um historico
*/

-- Função que efetivamente insere os cursos deletados, por quem
-- e quando na tabela de histórico hist_disciplina_especializacao
CREATE OR REPLACE FUNCTION fn_registrar_alteracao_disciplina_especializacao()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO hist_disciplina_especializacao (data_hora, usuario, id_deleted, nome_deleted, componente_curricular_deleted, eixo_tematico_deleted, carga_horaria_deleted, link_projeto_pedagogico_deleted)
    SELECT NOW(), current_user, id, nome, componente_curricular, eixo_tematico, carga_horaria, link_projeto_pedagogico
    FROM disciplina_especializacao;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- Trigger Schema que chamará a função declarada acima antes de um TRUNCATE na tabela disciplina_especializacao
CREATE TRIGGER watch_disciplina_especializacao
BEFORE TRUNCATE ON disciplina_especializacao
FOR EACH STATEMENT
EXECUTE FUNCTION fn_registrar_alteracao_disciplina_especializacao();

