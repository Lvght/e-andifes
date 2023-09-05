-- Garante que há ao menos um aparelho principal para contato.
CREATE OR REPLACE FUNCTION tr_before_delete_pessoa_telefone()
    RETURNS trigger
    LANGUAGE plpgsql
AS
$$
DECLARE
    r   REFCURSOR;
    rec RECORD;
BEGIN
    IF OLD.principal = TRUE THEN
        -- Escolhe qualquer outro telefone, se houver.
        OPEN r FOR SELECT id_telefone, cpf_pessoa, principal
                   FROM pessoa_telefone
                   WHERE cpf_pessoa = OLD.cpf_pessoa;

        FETCH r INTO rec;
        IF FOUND THEN
            UPDATE pessoa_telefone
            SET principal = TRUE
            WHERE id_telefone = rec.id_telefone;
        END IF;

        CLOSE r;
    END IF;

    -- Rodada de verificação.
    PERFORM 1
    FROM pessoa_telefone
    WHERE cpf_pessoa = OLD.cpf_pessoa;

    IF FOUND THEN
        PERFORM 1
        FROM pessoa_telefone
        WHERE cpf_pessoa = OLD.cpf_pessoa
          AND principal = TRUE;

        ASSERT FOUND;
        RAISE INFO 'Pessoa % possui ao menos um telefone principal.', OLD.cpf_pessoa;
    END IF;

    RETURN OLD;
END;
$$;

CREATE OR REPLACE TRIGGER after_delete_pessoa_telefone
    AFTER DELETE
    ON pessoa_telefone
    FOR EACH ROW
EXECUTE FUNCTION tr_before_delete_pessoa_telefone();
