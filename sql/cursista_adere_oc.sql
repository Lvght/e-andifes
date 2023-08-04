CREATE TABLE cursista_adere_oc (
    cpf_cursista CHAR(11) NOT NULL,
    id_turma INTEGER NOT NULL,

    CONSTRAINT fk_CPF
        FOREIGN KEY (cpf_cursista)
        REFERENCES cursista (cpf)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_turma_ofertada_idioma
        FOREIGN KEY (id_turma)
        REFERENCES turma_ofertada_idioma (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

COMMENT ON TABLE cursista_adere_oc
    IS 'Tabela que representa a adesão de um cursista a uma oferta coletiva.';
