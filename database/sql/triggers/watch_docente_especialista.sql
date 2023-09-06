CREATE OR REPLACE FUNCTION check_truncate_docente_especialista()
RETURNS TRIGGER AS $$
BEGIN
    -- Verifica se a ação é um TRUNCATE e dispara um erro se for
    IF TG_OP = 'TRUNCATE' THEN
        RAISE EXCEPTION 'A tentativa de TRUNCATE na tabela docente_especialista foi bloqueada!';
    END IF;

    -- Se não for um TRUNCATE, permite a operação
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- Cria o Trigger associado à tabela
CREATE TRIGGER watch_docente_especialista
BEFORE DELETE ON docente_especialista
FOR EACH STATEMENT
EXECUTE FUNCTION check_truncate_docente_especialista();
