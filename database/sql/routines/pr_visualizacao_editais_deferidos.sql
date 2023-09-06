/*
    Autor = Lucas Maciel Balieiro
    Artefatos: 
        -Procedure: Usada para filtrar os editais deferidos
        -Cursor: Usado para encontrar os editais e passar para a procedure
*/
CREATE OR REPLACE PROCEDURE view_editais_deferidos(IN p_busca VARCHAR(64))
LANGUAGE plpgsql
AS $$
DECLARE
cursor_e_deferido CURSOR FOR
    SELECT * 
    FROM deferimento_edital 
    WHERE 
        id::VARCHAR = p_busca OR
        edital_id::VARCHAR = p_busca OR
        publicado_por = p_busca;
rec_deferimento_edital deferimento_edital%ROWTYPE;

BEGIN
OPEN cursor_e_deferido
FETCH cursor_e_deferido INTO rec_deferimento_edital;
IF NOT FOUND THEN
    RAISE EXCEPTION 'Nao foram encontrados editais deferidos para %', p_busca;
END IF;
CLOSE cursor_e_deferido;
END;
$$
 