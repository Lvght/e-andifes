CREATE TABLE aluno_comunidade_academica_telefone
(
    id        SERIAL PRIMARY KEY,
    telefone  INTEGER  NOT NULL,
    cpf_aluno CHAR(11) NOT NULL,
    principal BOOLEAN  NOT NULL DEFAULT TRUE,

    CONSTRAINT fk_telefone
        FOREIGN KEY (telefone)
            REFERENCES telefone (id)
            ON DELETE CASCADE
            ON UPDATE CASCADE,

    CONSTRAINT fk_cpf_aluno
        FOREIGN KEY (cpf_aluno)
            REFERENCES aluno_comunidade_academica (cpf)
            ON DELETE CASCADE
            ON UPDATE CASCADE,

    CONSTRAINT unique_telefone_aluno
        UNIQUE (telefone, cpf_aluno)
);

COMMENT ON TABLE aluno_comunidade_academica_telefone
    IS 'Tabela que armazena os telefones dos alunos da comunidade acadêmica.';

COMMENT ON COLUMN aluno_comunidade_academica_telefone.principal
    IS 'Indica qual o telefone favorito da entidade.';