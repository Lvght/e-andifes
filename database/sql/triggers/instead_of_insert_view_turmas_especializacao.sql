-- Autor: Jonathan Braian Dias Vaz (RA:790780)
-- Trigger para possibilitar inserção de dados na view_turmas_especializacao

CREATE OR REPLACE FUNCTION fn_insert_turma_especializacao() RETURNS TRIGGER AS $BODY$
BEGIN
    INSERT INTO turma_disciplina_especializacao(
        cpf,
        id_ficha_base,
        categoria
    )
    VALUES(
        NEW.cpf,
        NEW.id_ficha_base,
        NEW.categoria
    );
    
    RETURN NEW;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER tr_insert_turma_especializacao
INSTEAD OF INSERT ON view_turmas_especializacao
FOR EACH ROW
EXECUTE FUNCTION fn_insert_turma_especializacao();