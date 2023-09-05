/*
Autor: Miguel Henrique Chinellato (RA:791964)
Descrição: Trigger Schema que vigia a tabela curso, armazenando na tabela 
           hist_curso os dados apagados por um comando TRUNCATE, bem como 
           o usuário que o realizou e em que hora
*/

-- Função que efetivamente insere os cursos deletados, por quem 
-- e quando na tabela de histórico hist_curso
CREATE OR REPLACE FUNCTION fn_registrar_alteracao_curso()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO hist_curso (data_hora, usuario, id_deleted, nome_deleted, codigo_deleted, idioma_deleted, carga_horaria_deleted, link_plano_de_ensino_deleted)
    SELECT NOW(), current_user, id, nome, codigo, idioma, carga_horaria, link_plano_de_ensino
    FROM curso;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- Trigger Schema que chamará a função declarada acima antes de um TRUNCATE na tabela curso
CREATE TRIGGER watch_curso
BEFORE TRUNCATE ON curso
FOR EACH STATEMENT
EXECUTE FUNCTION fn_registrar_alteracao_curso();