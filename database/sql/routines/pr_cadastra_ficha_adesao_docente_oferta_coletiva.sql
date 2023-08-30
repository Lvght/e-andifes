CREATE OR REPLACE PROCEDURE pr_cadastra_ficha_adesao_docente_oferta_coletiva(
    p_emissor CHAR(11),
    p_professor_isf CHAR(11),
    p_turma_ofertada INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM docente_orientador WHERE cpf = p_emissor) THEN
        RAISE EXCEPTION 'Emissor não encontrado';
    END IF;

    IF NOT EXISTS (SELECT 1 FROM professor_isf WHERE cpf = p_professor_isf) THEN
        RAISE EXCEPTION 'Professor ISF não encontrado';
    END IF;

    IF NOT EXISTS (SELECT 1 FROM turma_ofertada_idioma WHERE id = p_turma_ofertada) THEN
        RAISE EXCEPTION 'Turma ofertada não encontrada';
    END IF;

    INSERT INTO ficha_adesao_docente_oferta_coletiva (emissor, professor_isf, turma_ofertada)
    VALUES (p_emissor, p_professor_isf, p_turma_ofertada);

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END;
$$;
