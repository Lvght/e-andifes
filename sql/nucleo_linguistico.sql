CREATE TABLE nucleo_linguistico
(
    id            SERIAL PRIMARY KEY,
    FK_IES        VARCHAR(50) NOT NULL,
    logradouro    VARCHAR(100) NOT NULL,
    FK_CEP        VARCHAR(8) NOT NULL,

    CONSTRAINT fk_cep
        FOREIGN KEY (FK_CEP)
            REFERENCES endereco (CEP)
            ON DELETE CASCADE
            ON UPDATE CASCADE,

    CONSTRAINT fk_instituicao_ensino_superior
        FOREIGN KEY (FK_IES)
            REFERENCES instituicao_ensino_superior (PK_IES)
            ON DELETE CASCADE
            ON UPDATE CASCADE,

    CONSTRAINT unique_endereco_instituicao
        UNIQUE (FK_CEP, FK_IES)
);