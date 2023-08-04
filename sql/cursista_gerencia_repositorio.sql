CREATE TABLE cursista_gerencia_repositorio(
    id SERIAL PRIMARY KEY,
    cpf_cursista char(11),
    codigo_repositorio VARCHAR(50),
    idioma IDIOMA NOT NULL,
    id_turma INTEGER NOT NULL,
    id_curso INTEGER NOT NULL,
    horas_praticas_validadas INTEGER,
    horas_praticas_solicitadas INTEGER,

    CONSTRAINT fk_cpf_cursista
        FOREIGN KEY (cpf_cursista)
            REFERENCES pessoa(cpf)
            ON DELETE CASCADE
            ON UPDATE CASCADE,

    CONSTRAINT fk_codigo_repositorio
        FOREIGN KEY (codigo_repositorio)
            REFERENCES repositorio_cursista(codigo)
            ON DELETE CASCADE
            ON UPDATE CASCADE,

    CONSTRAINT fk_id_turma
        FOREIGN KEY (id_turma)
            REFERENCES turma_ofertada_idioma(id)
            ON DELETE CASCADE
            ON UPDATE CASCADE,

    CONSTRAINT fk_id_curso
        FOREIGN KEY (id_curso)
            REFERENCES curso(id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);