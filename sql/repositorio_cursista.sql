CREATE TABLE repositorio_cursista (
    id  SERIAL PRIMARY KEY, 
    codigo CHAR(20) UNIQUE NOT NULL,
    turma_id INTEGER NOT NULL,
    
    CONSTRAINT fk_id_turma
        FOREIGN KEY (turma_id)
            REFERENCES turma_ofertada_idioma(id)
            ON UPDATE CASCADE
    
);

