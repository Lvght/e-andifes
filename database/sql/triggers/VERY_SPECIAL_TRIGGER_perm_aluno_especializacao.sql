/*
Autor: Alisson Nunes (RA:725862)
Descrição: Este é um gatilho muito especial para alunos de especialização
*/

/*
CREATE OR REPLACE FUNCTION tr_perm_delegate_to_aluno_especializacao()
    RETURNS trigger
    LANGUAGE plpgsql
AS
$$
BEGIN
    IF TG_OP = 'DELETE' THEN
        EXECUTE 'REVOKE aluno_especializacao FROM ' || quote_ident(OLD.cpf);
        RAISE NOTICE 'Cargo aluno_especializacao revogado para %', OLD.cpf;
        CALL pr_audit('REVOKE', concat('Cargo aluno_especializacao revogado para ', OLD.cpf));
    ELSIF TG_OP = 'INSERT' OR TG_OP = 'UPDATE' THEN
        EXECUTE 'GRANT aluno_especializacao TO ' || quote_ident(NEW.cpf);
        RAISE NOTICE 'Cargo aluno_especializacao delegado para %', NEW.cpf;
        CALL pr_audit('GRANT', concat('Cargo aluno_especializacao delegado para ', NEW.cpf));
        RETURN NEW;
    END IF;
    RETURN OLD;
END
$$;

CREATE OR REPLACE TRIGGER monitor_aluno_especializacao
    BEFORE INSERT OR UPDATE OR DELETE
    ON especialista
    FOR EACH ROW
EXECUTE FUNCTION tr_perm_delegate_to_aluno_especializacao();
*/