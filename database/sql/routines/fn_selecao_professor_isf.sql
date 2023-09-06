-- Autor: Jonathan Braian Dias Vaz (RA:790780)
-- Esta FUNÇÃO realiza a seleção dos professores ISF, em seguida temos também o CURSOR EXPLÍCITO

--A função recebe parâmetros como CPF ou ID_FICHA_BASE para seleção do professor ISF
CREATE OR REPLACE FUNCTION fn_selecao_professor_isf(cpf_param CHAR(11),id_ficha_base_param INTEGER)
-- Retorna uma tabela com todos os professores ISF e seus atributos
RETURNS TABLE (
    cpf CHAR(11),
    id_ficha_base INTEGER,
    categoria CATEGORIA_PROFESSOR_ISF
) AS $$
DECLARE
    -- Declaração de um registro para armazenar o professor ISF
    professor_record RECORD;
    -- Declaração do cursor explícito para buscar o professor seguindo parâmetros passados
    CURSOR professor_isf IS
        SELECT 
            cpf, 
            id_ficha_base, 
            categoria
        FROM 
            professor_isf
        WHERE cpf = cpf_param OR id_ficha_base = id_ficha_base_param;
BEGIN
    -- Abertura do cursor
    OPEN professor_isf;

    -- Loop que itera sobre o professor selecionado
    FOR professor_record IN professor_isf
    LOOP
        RETURN NEXT professor_record;
    END LOOP;

    -- Fechamento do cursor
    CLOSE professor_isf;
END;
$$ LANGUAGE PLPGSQL;