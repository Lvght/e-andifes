-- Procedimento para cadastrar informações no registro de auditoria
CREATE TYPE tipo_acao_auditoria AS ENUM ('INSERT', 'UPDATE', 'DELETE', 'REVOKE', 'GRANT', 'OTHER');

CREATE PROCEDURE pr_audit(op tipo_acao_auditoria, msg TEXT)
LANGUAGE plpgsql
AS $$
DECLARE ip varchar;
BEGIN
    ip := (SELECT client_addr FROM pg_stat_activity WHERE pid = pg_backend_pid() LIMIT 1);
    INSERT INTO registro_auditoria(tipo_acao, mensagem, endereco_ip)
    VALUES (op, msg, ip);
END;
$$;
