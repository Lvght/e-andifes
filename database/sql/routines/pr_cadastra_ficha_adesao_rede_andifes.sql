-- Procedimento para cadastrar uma ficha de adesão à rede andifes
CREATE OR REPLACE PROCEDURE pr_cadastra_ficha_adesao_rede_andifes(
    p_link_termo_compromisso TEXT,
    p_link_oficio_coordenador_pedagogico_geral TEXT,
    p_link_politica_linguistica TEXT,
    p_instituicao INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN
    BEGIN;
    
    -- Inserir os dados na tabela ficha_adesao_rede_andifes
    INSERT INTO ficha_adesao_rede_andifes (
        link_termo_compromisso,
        link_oficio_coordenador_pedagogico_geral,
        link_politica_linguistica,
        instituicao
    )
    VALUES (
        p_link_termo_compromisso,
        p_link_oficio_coordenador_pedagogico_geral,
        p_link_politica_linguistica,
        p_instituicao
    );

    -- Commit da transação
    COMMIT;
END;
$$;
