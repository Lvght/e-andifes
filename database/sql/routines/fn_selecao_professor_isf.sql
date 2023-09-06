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
    -- Declaração do cursor explícito para buscar o professor seguindo parâmetros passados
    professor_isf CURSOR FOR
        SELECT 
            p.cpf, 
            p.id_ficha_base, 
            p.categoria
        FROM 
            professor_isf p
        WHERE p.cpf = cpf_param OR p.id_ficha_base = id_ficha_base_param;
        -- Declaração de um registro para armazenar o professor ISF
        professor_record RECORD;
BEGIN
    -- Abertura do cursor
    OPEN professor_isf;

    LOOP
        FETCH professor_isf INTO professor_record;
        EXIT WHEN NOT FOUND;

        cpf := professor_record.cpf;
        id_ficha_base := professor_record.id_ficha_base;
        categoria := professor_record.categoria;

        RETURN NEXT;
    END LOOP;

    -- Fechamento do cursor
    CLOSE professor_isf;
END;
$$ LANGUAGE PLPGSQL;