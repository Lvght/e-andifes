CREATE TABLE sigla_instituicao_superior (
    FK_ies_id INT NOT NULL,
    IES_sigla VARCHAR(10),

    CONSTRAINT fk_instituicao_ensino_superior
        FOREIGN KEY (FK_ies_id)
            REFERENCES instituicao_ensino_superior (id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);