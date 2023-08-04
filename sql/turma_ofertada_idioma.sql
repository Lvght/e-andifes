CREATE TABLE turma_ofertada_idioma
(
    id SERIAL PRIMARY KEY,
    curso_id INTEGER NOT NULL,

    CONSTRAINT fk_id_curso
        FOREIGN KEY (curso_id)
            REFERENCES curso(id)
);
