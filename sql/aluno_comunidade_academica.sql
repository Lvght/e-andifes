-- TODO Talvez remover "acadêmica" torne o linguajar mais inclusivo.
CREATE TABLE aluno_comunidade_academica
(
    cpf                CHAR(11) PRIMARY KEY,
    nome               VARCHAR(100) NOT NULL,
    genero             GENERO       NOT NULL,
    instituicao_ensino VARCHAR(100) NOT NULL,

    -- FIXME Validar essa restrição
    CONSTRAINT fk_pessoa
        FOREIGN KEY (cpf)
            REFERENCES pessoa (cpf)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);

COMMENT ON COLUMN aluno_comunidade_academica.instituicao_ensino
    IS 'Nome da Instituição de Ensino do aluno. Não relacionado com a tabela de mesmo nome';