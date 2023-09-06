CREATE OR REPLACE FUNCTION fn_registrar_alteracao_aluno_graduacao()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO hist_aluno_graduacao (cpf, link_certPOCA ,link_vinculoFile, link_termoCompromisso, link_resultadoSelecao)
    SELECT NOW(), current_user, cpf, link_certPOCA , link_vinculoFile, link_termoCompromisso, link_resultadoSelecao
    FROM coordenador_administrativo;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER watch_aluno_graduacao
BEFORE TRUNCATE ON aluno_graduacao
FOR EACH STATEMENT
EXECUTE FUNCTION fn_registrar_alteracao_aluno_graduacao();