CREATE TABLE repositorioCursista (
    id  SERIAL PRIMARY KEY, 
    codigo INTEGER UNIQUE NOT NULL,
    diaSemana VARCHAR(20) UNIQUE NOT NULL,
    horarioInicio TIME UNIQUE NOT NULL,
    idioma VARCHAR(10) UNIQUE NOT NULL,
    codigoCurso INTEGER UNIQUE NOT NULL,
    nomeCurso VARCHAR(50) UNIQUE NOT NULL,
    
    CONSTRAINT fk_diaSemana
        FOREIGN KEY (diaSemana)
            REFERENCES turma_ofertada_idioma(diaSemana)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    
    CONSTRAINT fk_horarioInicio
        FOREIGN KEY (horarioInicio)
            REFERENCES turma_ofertada_idioma(horarioInicio)
            ON DELETE CASCADE 
            ON UPDATE CASCADE,
    
    CONSTRAINT fk_idioma 
        FOREIGN KEY (idioma)
            REFERENCES curso(idioma)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    
    CONSTRAINT fk_codigoCurso
        FOREIGN KEY (codigoCurso)
            REFERENCES curso(codigo)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    
    CONSTRAINT fk_nomeCurso
        FOREIGN KEY (nomeCurso)
            REFERENCES curso(nome)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);