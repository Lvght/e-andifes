CREATE TABLE laboratorio_isf
(
    FK_IES         INT NOT NULL PRIMARY KEY,
    logradouro     VARCHAR(100) NOT NULL,
    FK_id_endereco INT NOT NULL,

    CONSTRAINT fk_endereco_lab
        FOREIGN KEY (FK_id_endereco)
            REFERENCES endereco (id)
            ON DELETE CASCADE
            ON UPDATE CASCADE,

    CONSTRAINT fk_instituicao_ensino_superior
        FOREIGN KEY (FK_IES)
            REFERENCES instituicao_ensino_superior (id)
            ON DELETE CASCADE
            ON UPDATE CASCADE,

    CONSTRAINT unique_lab
        UNIQUE (FK_id_endereco, FK_IES)
);
