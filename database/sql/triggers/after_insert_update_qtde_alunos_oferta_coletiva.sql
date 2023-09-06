-- Criação da trigger
CREATE OR REPLACE FUNCTION aumentar_qtde_inscritos()
RETURNS TRIGGER AS
$$
BEGIN
    -- Acrescenta 1 à quantidade de inscritos na turma após a inserção do estudante
    UPDATE turma_ofertada_idioma
    SET numero_inscritos = numero_inscritos + 1
    WHERE id = NEW.id_turma;

    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

-- Criação da trigger
CREATE TRIGGER after_insert_update_qtde_alunos_oferta_coletiva
AFTER INSERT ON aluno_comunidade_academica
FOR EACH ROW
EXECUTE FUNCTION aumentar_qtde_inscritos();
