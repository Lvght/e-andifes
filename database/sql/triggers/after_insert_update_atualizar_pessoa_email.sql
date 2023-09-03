-- FUNCTION/PROCEDURE associada ao trigger para atualizar o email da pessoa
-- na tabela de emails
CREATE OR REPLACE FUNCTION tr_after_insert_update_atualizar_pessoa_email()
RETURNS TRIGGER AS $$
BEGIN
    -- Verificar se o email já existe para a pessoa.
    IF EXISTS (SELECT 1 FROM pessoa_email WHERE pessoa = NEW.cpf AND email = NEW.email) THEN
        -- Atualizar o registro existente.
        UPDATE pessoa_email
        SET principal = NEW.principal
        WHERE pessoa = NEW.cpf AND email = NEW.email;
    ELSE
        -- Inserir um novo registro.
        INSERT INTO pessoa_email (pessoa, email, principal)
        VALUES (NEW.cpf, NEW.email, NEW.principal);
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger para atualizar a tabela com o novo email da pessoa
CREATE TRIGGER after_insert_update_pessoa_email
AFTER INSERT OR UPDATE
ON pessoa
FOR EACH ROW
EXECUTE FUNCTION tr_after_insert_update_atualizar_pessoa_email();


-- Assertion para verificar o email disponivel
CREATE ASSERTION assertion_email_disponivel
CHECK (
    NOT EXISTS (
        SELECT 1
        FROM pessoa_email pe1
        WHERE pe1.email = NEW.email
        AND EXISTS (
            SELECT 1
            FROM pessoa_email pe2
            WHERE pe2.pessoa <> NEW.cpf
            AND pe2.email = NEW.email
        )
    )
);

