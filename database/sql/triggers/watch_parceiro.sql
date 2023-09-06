/*
Autor: Alisson Nunes (RA:725862)
Descrição: Criação da função do gatilho para monitorar a tabela 'parceiro'
*/

CREATE OR REPLACE FUNCTION fn_trigger_watch_parceiro()
RETURNS trigger
LANGUAGE plpgsql
AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        CALL pr_audit('INSERT', concat('Novo parceiro cadastrado - CNPJ: ', NEW.cnpj, ' - Nome: ', NEW.nome));
        RETURN NEW;
    END IF;

    IF TG_OP = 'UPDATE' THEN
        CALL pr_audit('UPDATE', concat('Parceiro atualizado - CNPJ: ', NEW.cnpj, ' - Nome: ', NEW.nome));
        RETURN NEW;
    END IF;

    IF TG_OP = 'DELETE' THEN
        CALL pr_audit('DELETE', concat('Parceiro removido - CNPJ: ', OLD.cnpj, ' - Nome: ', OLD.nome));
        RETURN OLD;
    END IF;

    RETURN NULL;
END
$$;

CREATE TRIGGER trigger_watch_parceiro
AFTER INSERT OR UPDATE OR DELETE ON parceiro
FOR EACH ROW EXECUTE PROCEDURE fn_trigger_watch_parceiro();
