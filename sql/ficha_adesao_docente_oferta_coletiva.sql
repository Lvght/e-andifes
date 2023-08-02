CREATE TABLE ficha_adesao_docente_oferta_coletiva
(
    id SERIAL PRIMARY KEY,

    emissor CHAR(11) NOT NULL,
    professor_isf CHAR(11) NOT NULL,
    turma_ofertada INTEGER NOT NULL,

    CONSTRAINT fk_emissor
        FOREIGN KEY (emissor)
            REFERENCES docente_orientador (cpf)
                ON DELETE CASCADE
                ON UPDATE CASCADE,

    CONSTRAINT fk_professor_isf
        FOREIGN KEY (professor_isf)
            REFERENCES professor_isf (cpf)
                ON DELETE CASCADE
                ON UPDATE CASCADE,

    CONSTRAINT fk_turma_ofertada
        FOREIGN KEY (turma_ofertada)
            REFERENCES turma_ofertada_idioma (id)
                ON DELETE CASCADE
                ON UPDATE CASCADE,

    CONSTRAINT fk_ficha_base
        FOREIGN KEY (id)
            REFERENCES ficha_base (id)
                ON DELETE CASCADE
                ON UPDATE CASCADE
);

COMMENT ON COLUMN ficha_adesao_docente_oferta_coletiva.emissor
    IS 'CPF do docente orientador que emitiu a ficha de adesão';

COMMENT ON COLUMN ficha_adesao_docente_oferta_coletiva.professor_isf
    IS 'CPF do professor que está sendo cadastrado no sistema.';