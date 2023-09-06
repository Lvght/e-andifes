-- Crie a trigger que é acionada após a inserção na tabela coordenador_administrativo
CREATE OR REPLACE FUNCTION atualiza_view_coordenador_pedagogico() RETURNS TRIGGER AS $$
BEGIN
    -- Atualize a view view_coordenador_pedagogico com as informações inseridas
    REFRESH MATERIALIZED VIEW view_pessoas_coordenador_pedagogico;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Crie a trigger que é acionada após a inserção na tabela coordenador_administrativo
CREATE TRIGGER after_insert_coordenador_administrativo_trigger
AFTER INSERT ON coordenador_administrativo
FOR EACH ROW
EXECUTE FUNCTION atualiza_view_coordenador_pedagogico();
