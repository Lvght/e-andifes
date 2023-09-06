--criacao da funcao auxiliar
CREATE OR REPLACE FUNCTION fn_registrar_alteracao_aluno_graduacao()
RETURNS TRIGGER AS $$
BEGIN
    --insercao na tabela histórico de aluno da graducao
    INSERT INTO hist_aluno_graduacao (cpf, link_certPOCA ,link_vinculoFile, link_termoCompromisso, link_resultadoSelecao)
    SELECT NOW(), current_user, cpf, link_certPOCA , link_vinculoFile, link_termoCompromisso, link_resultadoSelecao
    FROM aluno_graduacao;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

--trigger schema
CREATE TRIGGER watch_aluno_graduacao
--sempre que for truncada a funcao auxiliar executara
BEFORE TRUNCATE ON aluno_graduacao
FOR EACH STATEMENT
EXECUTE FUNCTION fn_registrar_alteracao_aluno_graduacao();