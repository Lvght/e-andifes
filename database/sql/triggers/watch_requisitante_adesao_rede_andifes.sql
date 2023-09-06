-- Crie a tabela para manter o histórico
CREATE TABLE watch_adesao_rede_andifes_history (
    id SERIAL PRIMARY KEY,
    link_termo_compromisso TEXT NOT NULL,
    link_oficio_coordenador_pedagogico_geral TEXT NOT NULL,
    link_politica_linguistica TEXT NOT NULL,
    instituicao INTEGER NOT NULL,
    data_registro TIMESTAMP DEFAULT NOW() NOT NULL
);

-- Crie a trigger que popula a tabela de histórico após cada inserção na tabela original
CREATE OR REPLACE FUNCTION adesao_rede_andifes_insert_trigger() RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO watch_adesao_rede_andifes_history (
        link_termo_compromisso,
        link_oficio_coordenador_pedagogico_geral,
        link_politica_linguistica,
        instituicao
    ) VALUES (
        NEW.link_termo_compromisso,
        NEW.link_oficio_coordenador_pedagogico_geral,
        NEW.link_politica_linguistica,
        NEW.instituicao
    );
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Crie a trigger que será acionada após cada inserção na tabela original
CREATE TRIGGER adesao_rede_andifes_insert
AFTER INSERT ON ficha_adesao_rede_andifes
FOR EACH ROW
EXECUTE FUNCTION adesao_rede_andifes_insert_trigger();
