CREATE OR REPLACE PROCEDURE pr_cadastra_ficha_inscricao_oferta_coletiva(
    p_turma_ofertada INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM turma_ofertada_idioma WHERE id = p_turma_ofertada) THEN
        RAISE EXCEPTION 'Turma ofertada não encontrada';
    END IF;

    INSERT INTO ficha_inscricao_oferta_coletiva (turma_ofertada)
    VALUES (p_turma_ofertada);
END;
$$;
