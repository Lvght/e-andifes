CREATE TABLE ficha_inscricao_oferta_coletiva
(
    id SERIAL PRIMARY KEY,
    turma_ofertada INTEGER NOT NULL,

    CONSTRAINT fk_ficha_base
        FOREIGN KEY (id)
            REFERENCES ficha_base (id)
            ON DELETE CASCADE
            ON UPDATE CASCADE,

    CONSTRAINT fk_turma_ofertada
        FOREIGN KEY (turma_ofertada)
            REFERENCES turma_ofertada_idioma (id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
)