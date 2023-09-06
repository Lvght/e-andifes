-- Crie a trigger que revoga os usuários inativos
CREATE OR REPLACE FUNCTION revoga_usuarios_inativos() RETURNS TRIGGER AS $$
BEGIN
    -- Verifique se o usuário se tornou inativo (status_inativo = true)
    IF NEW.status_inativo = true THEN

        -- Precisa criar esse atributo na tabela pessoa 
        UPDATE usuarios SET acesso_revogado = TRUE WHERE cpf = NEW.cpf;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Crie a trigger que é acionada antes de uma atualização na tabela pessoa
CREATE TRIGGER VERY_SPECIAL_TRIGGER_revoga_os_inativos
BEFORE UPDATE ON pessoa
FOR EACH ROW
EXECUTE FUNCTION revoga_usuarios_inativos();
