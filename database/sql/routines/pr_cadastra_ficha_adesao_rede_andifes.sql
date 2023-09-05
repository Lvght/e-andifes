/*
Autor: Caio Ueda Sampaio (RA:802215)
Descrição: cadastra ficha credenciamento professor isf
*/
CREATE OR REPLACE PROCEDURE InserirFichaAdesao(
    p_instituicao INTEGER
)
AS $$
BEGIN
    INSERT INTO ficha_adesao_rede_andifes (instituicao)
    VALUES (p);
END;
$$ LANGUAGE plpgsql;