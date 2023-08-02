CREATE TABLE laboratorio_isf
(
    FK_IES        INT NOT NULL PRIMARY KEY,
    logradouro    VARCHAR(100) NOT NULL,
    FK_CEP        VARCHAR(8) NOT NULL,

    CONSTRAINT fk_cep
        FOREIGN KEY (FK_CEP)
            REFERENCES endereco (cep)
            ON DELETE CASCADE
            ON UPDATE CASCADE,

    CONSTRAINT fk_instituicao_ensino_superior
        FOREIGN KEY (FK_IES)
            REFERENCES instituicao_ensino_superior (id)
            ON DELETE CASCADE
            ON UPDATE CASCADE,

    CONSTRAINT unique_lab
        UNIQUE (FK_CEP, FK_IES)
);
