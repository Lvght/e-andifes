/*
Autor: Miguel Henrique Chinellato (RA:791964)
Descrição: Procedimento para cadastrar no sistema uma ficha 
           de adesão de um docente a uma oferta coletiva
*/

CREATE OR REPLACE PROCEDURE pr_cadastra_ficha_adesao_docente_oferta_coletiva(
    p_emissor CHAR(11),
    p_professor_isf CHAR(11),
    p_turma_ofertada INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN
    -- Verifica se o emissor existe na tabela docente_orientador
    IF NOT EXISTS (SELECT 1 FROM docente_orientador WHERE cpf = p_emissor) THEN
        RAISE EXCEPTION 'Emissor não encontrado';
    END IF;
    -- Verifica se o Professor ISF existe na tabela professor_isf
    IF NOT EXISTS (SELECT 1 FROM professor_isf WHERE cpf = p_professor_isf) THEN
        RAISE EXCEPTION 'Professor ISF não encontrado';
    END IF;
    -- Verifica se a turma ofertada existe na tabela turma_ofertada_idioma
    IF NOT EXISTS (SELECT 1 FROM turma_ofertada_idioma WHERE id = p_turma_ofertada) THEN
        RAISE EXCEPTION 'Turma ofertada não encontrada';
    END IF;

    -- Cadastra uma nova ficha de adesão com os parâmetros fornecidos
    INSERT INTO ficha_adesao_docente_oferta_coletiva (emissor, professor_isf, turma_ofertada)
    VALUES (p_emissor, p_professor_isf, p_turma_ofertada);
END;
$$;
