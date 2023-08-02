CREATE TABLE endereco_laboratorio
(
    id          SERIAL PRIMARY KEY,
    FK_IES      VARCHAR(50) NOT NULL,
    logradouro  VARCHAR(100) NOT NULL,
    FK_CEP      VARCHAR(8) NOT NULL,

    CONSTRAINT fk_ies_endereco_nucleo
        FOREIGN KEY (FK_IES)
            REFERENCES instituicao_ensino_superior (PK_IES)
            ON DELETE CASCADE
            ON UPDATE CASCADE,

    CONSTRAINT unique_ies_endereco_laboratorio
        UNIQUE (FK_IES)
);
