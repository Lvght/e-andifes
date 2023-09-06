CREATE TABLE hist_aluno_graduacao
(
    cpf CHAR(11) PRIMARY KEY,
    link_certPOCA TEXT NOT NULL,
    link_vinculoFile TEXT NOT NULL,
    link_termoCompromisso TEXT NOT NULL,
    link_resultadoSelecao TEXT NOT NULL,

    CONSTRAINT fk_pessoa
        FOREIGN KEY (cpf)
            REFERENCES pessoa (cpf)
                ON DELETE CASCADE
                ON UPDATE CASCADE
);