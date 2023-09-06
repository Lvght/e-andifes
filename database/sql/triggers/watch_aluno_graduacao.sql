/*
Autor: Caio Ueda Sampaio (RA:802215)
Descrição: trigger schema para manter histórico da tabela aluno_graduacao
*/
CREATE TABLE aluno_graduacao_historico (
    cpf CHAR(11),
    data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    acao VARCHAR(10),
    link_certPOCA TEXT,
    link_vinculoFile TEXT,
    link_termoCompromisso TEXT,
    link_resultadoSelecao TEXT
);

CREATE OR REPLACE FUNCTION aluno_graduacao_trigger()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO aluno_graduacao_historico (cpf, acao, link_certPOCA, link_vinculoFile, link_termoCompromisso, link_resultadoSelecao)
        VALUES (NEW.cpf, 'INSERT', NEW.link_certPOCA, NEW.link_vinculoFile, NEW.link_termoCompromisso, NEW.link_resultadoSelecao);
    ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO aluno_graduacao_historico (cpf, acao, link_certPOCA, link_vinculoFile, link_termoCompromisso, link_resultadoSelecao)
        VALUES (NEW.cpf, 'UPDATE', NEW.link_certPOCA, NEW.link_vinculoFile, NEW.link_termoCompromisso, NEW.link_resultadoSelecao);
    ELSIF TG_OP = 'DELETE' THEN
        INSERT INTO aluno_graduacao_historico (cpf, acao)
        VALUES (OLD.cpf, 'DELETE');
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER aluno_graduacao_hist_trigger
AFTER INSERT OR UPDATE OR DELETE ON aluno_graduacao
FOR EACH ROW
EXECUTE FUNCTION aluno_graduacao_trigger();