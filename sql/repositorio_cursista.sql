CREATE TABLE repositorio_cursista (
    id  SERIAL PRIMARY KEY, 
    codigo CHAR(20) UNIQUE NOT NULL,
    dia_semana DIASEMANA NOT NULL,
    horario_inicio TIME NOT NULL,
    idioma IDIOMA NOT NULL,
    codigo_curso INTEGER NOT NULL,
    nome_curso VARCHAR(100) NOT NULL,
    
    CONSTRAINT fk_dia_semana
        FOREIGN KEY (dia_semana)
            REFERENCES turma_ofertada_idioma(dia_semana)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    
    CONSTRAINT fk_horario_inicio
        FOREIGN KEY (horario_inicio)
            REFERENCES turma_ofertada_idioma(horario_inicio)
            ON DELETE CASCADE 
            ON UPDATE CASCADE,
    
    CONSTRAINT fk_idioma 
        FOREIGN KEY (idioma)
            REFERENCES curso(idioma)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    
    CONSTRAINT fk_codigo_curso
        FOREIGN KEY (codigo)
            REFERENCES curso(codigo)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    
    CONSTRAINT fk_nome_curso
        FOREIGN KEY (nome_curso)
            REFERENCES curso(nome)
            ON DELETE CASCADE
            ON UPDATE CASCADE,

    CONSTRAINT chave 
        UNIQUE (codigo, dia_semana, horario_inicio, idioma, codigo_curso, nome_curso)
    
);