CREATE OR REPLACE FUNCTION tr_instead_of_update_view_cursos()
RETURNS TRIGGER AS $$
DECLARE
    -- Declaração do cursor.
    curso_cursor CURSOR FOR
        SELECT id, nome, codigo, idioma
        FROM curso
        WHERE id = NEW.id;

    -- Variáveis para armazenar os valores originais.
    old_nome VARCHAR;
    old_codigo VARCHAR;
    old_idioma VARCHAR;
    old_id INT;
BEGIN
    -- Inicializa as variáveis com os valores atuais da tabela subjacente.
    OPEN curso_cursor;
    FETCH curso_cursor INTO old_id, old_nome, old_codigo, old_idioma;
    CLOSE curso_cursor;

    -- Verificar qual tipo de operação está sendo executada (INSERT, UPDATE ou DELETE).
    -- No caso de UPDATE, aplicar as atualizações à tabela subjacente.
    IF TG_OP = 'UPDATE' THEN
        UPDATE curso
        SET
            nome = NEW.nome,
            codigo = NEW.codigo,
            idioma = NEW.idioma
        WHERE id = NEW.id;
    END IF;

    -- No caso de DELETE, remover o registro correspondente da tabela subjacente.
    IF TG_OP = 'DELETE' THEN
        DELETE FROM curso WHERE id = OLD.id;
    END IF;

    -- No caso de INSERT, inserir um novo registro na tabela subjacente.
    IF TG_OP = 'INSERT' THEN
        INSERT INTO curso (nome, codigo, idioma)
        VALUES (NEW.nome, NEW.codigo, NEW.idioma);
    END IF;

    -- Exemplo de mensagem para o usuário com os valores antes e depois da operação.
    RAISE NOTICE 'Operação % realizada em curso com ID %: Nome antigo: %, Código antigo: %, Idioma antigo: %. Novos valores: Nome: %, Código: %, Idioma: %',
                 TG_OP, NEW.id,
                 old_nome, old_codigo, old_idioma,
                 NEW.nome, NEW.codigo, NEW.idioma;

    -- Retornar o resultado da operação (NEW ou OLD, dependendo da operação).
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Crie a trigger INSTEAD OF para a view view_cursos.
CREATE TRIGGER instead_of_update_view_cursos
INSTEAD OF INSERT OR UPDATE OR DELETE
ON view_cursos
FOR EACH ROW
EXECUTE FUNCTION tr_instead_of_update_view_cursos();
