CREATE OR REPLACE FUNCTION turma_status(id INT) RETURNS TEXT AS $BODY$
DECLARE
    inicio DATE;
    fim DATE;
BEGIN
    -- Obter as datas de início e fim para a turma especificada
    SELECT data_inicio, data_fim INTO inicio, fim
    FROM turma_ofertada_idioma
    WHERE id = id;

    -- Se não encontrarmos uma turma correspondente, lançamos um erro
    IF NOT FOUND THEN
        RAISE EXCEPTION 'Turma com ID % não encontrada', id;
    END IF;

    -- Verificar se a data atual está entre as datas de início e fim
    IF CURRENT_DATE BETWEEN inicio AND fim THEN
        RETURN 'ativa';
    ELSEIF CURRENT_DATE > fim THEN
        RETURN 'finalizada';
    ELSE
        -- Se a data atual for anterior à data de início, você pode retornar um status adicional, como "pendente", ou simplesmente retornar "finalizada".
        RETURN 'finalizada';
    END IF;
END;
$BODY$ LANGUAGE plpgsql;
