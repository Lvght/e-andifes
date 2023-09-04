/*
Autor: Miguel Henrique Chinellato (RA:791964)
Descrição: Trigger InsteadOf para possibilitar inserção de dados na view_cursos
*/

-- Função que será chamada pela trigger para inserir os dados na tabela cursos
CREATE OR REPLACE FUNCTION fn_inserir_view_cursos()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO curso (nome, codigo, idioma, carga_horaria, link_plano_de_ensino)
    VALUES (NEW.nome, NEW.codigo, NEW.idioma, NEW.carga_horaria, NEW.link_plano_de_ensino);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger InsteadOf que é acionada quando ocorre um INSERT na view view_cursos
-- chamando a função declarada acima para manipular a inserção na tabela curso
CREATE TRIGGER instead_of_insert_view_cursos
INSTEAD OF INSERT ON view_cursos
FOR EACH ROW
EXECUTE FUNCTION fn_inserir_view_cursos();