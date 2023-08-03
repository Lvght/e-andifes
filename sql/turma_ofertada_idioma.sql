CREATE TABLE IF NOT EXISTS turma_ofertada_idioma
(
    id SERIAL PRIMARY KEY,
    dia_semana VARCHAR(50) NOT NULL,
    horario_inicio TIME NOT NULL,
    idioma VARCHAR(50) NOT NULL,
    curso INTEGER NOT NULL,
    dia_horario_aulas VARCHAR(100) NOT NULL,
    titulo VARCHAR(255) NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    tipo_oferta VARCHAR(100),
    horario_termino TIME,
    numero_inscritos INTEGER,
    cpf_professor_isf CHAR(11) NOT NULL,
    
    CONSTRAINT fk_professor_isf FOREIGN KEY (cpf_professor_isf) REFERENCES professor_isf(cpf),
    
    CONSTRAINT fk_curso
        FOREIGN KEY (curso)
            REFERENCES curso (id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);
