/*
Autor: Caio Ueda Sampaio (RA:802215)
Descrição: cadastra ficha credenciamento professor isf
*/
CREATE OR REPLACE PROCEDURE InserirFichaCredenciamento(
    p_docente_orientador CHAR(11),
    p_professor_isf CHAR(11)
)
AS $$
BEGIN
    INSERT INTO ficha_credenciamento_professor_isf (docente_orientador, professor_isf)
    VALUES (p_docente_orientador, p_professor_isf);
END;
$$ LANGUAGE plpgsql;