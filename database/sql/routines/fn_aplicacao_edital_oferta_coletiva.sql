/*
Função que tem como objetivo inserir um novo edital no banco de dados, a partir de informações inseridas no formulário HTML
*/

CREATE OR REPLACE FUNCTION fn_aplicacao_edital_oferta_coletiva(id_recebido SERIAL, turma_ofertada_recebida INTEGER)
RETURNS TABLE (
    id SERIAL,
    turma_ofertada INTERGER
)
DECLARE 
    cursor_ficha_base CURSOR for 
        SELECT  
            f.id,
            f.edital
        FROM 
            ficha_base f
        WHERE
            f.id = id_recebido;
    registro_ficha_base RECORD;
    cursor_turma_ofertada CURSOR for 
        SELECT  
            t.id,
        FROM 
            turma_ofertada_idioma t
        WHERE
            t.id = turma_ofertada_recebida;
    registro_turma_ofertada RECORD;
BEGIN   
    OPEN cursor_ficha_base;
    FETCH cursor_ficha_base INTO registro_ficha_base;
    CLOSE cursor_ficha_base;
    IF registro_ficha_base = NULL THEN
        RETURN NULL;
    OPEN cursor_turma_ofertada;
    FETCH cursor_turma_ofertada into registro_turma_ofertada;
    CLOSE cursor_turma_ofertada
    IF registro_turma_ofertada = NULL THEN
        RETURN NULL;
    INSERT INTO ficha_inscricao_oferta_coletiva (
        id,
        turma_ofertada,
    )
    VALUES (
        id_recebido,
        turma_ofertada_recebida
    )
    return SELECT * FROM ficha_inscricao_oferta_coletiva WHERE id = id_recebido
END;
$$ LANGUAGE plpgsql;