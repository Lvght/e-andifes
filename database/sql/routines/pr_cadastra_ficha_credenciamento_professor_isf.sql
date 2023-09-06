CREATE OR REPLACE PROCEDURE pr_cadastra_ficha_credenciamento_professor_isf(
    p_docente_orientador CHAR(11),
    p_professor_isf CHAR(11)
)
AS $$

BEGIN
    IF NOT EXISTS (SELECT 1 FROM docente_orientador WHERE cpf = p_docente_orientador) THEN
        RAISE EXCEPTION 'Docente orientador não encontrado';
    END IF;
    
    IF NOT EXISTS (SELECT 1 FROM professor_isf WHERE cpf = p_professor_isf) THEN
        RAISE EXCEPTION 'Professor ISF não encontrado';
    END IF;
    
    INSERT INTO ficha_credenciamento_professor_isf (docente_orientador, professor_isf)
    VALUES (p_docente_orientador, p_professor_isf);

END;
$$ LANGUAGE plpgsql;