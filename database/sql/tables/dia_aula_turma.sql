CREATE TABLE dia_aula_turma (
    dia_semana DIASEMANA NOT NULL,
    horario_inicio TIME NOT NULL,
    horario_termino TIME NOT NULL,

    id_turma INTEGER NOT NULL,

    CONSTRAINT fk_turma
        FOREIGN KEY (id_turma)
        REFERENCES turma_ofertada_idioma (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT pk_dia_aula_turma 
        PRIMARY KEY (dia_semana, horario_inicio, horario_termino, id_turma)
);
