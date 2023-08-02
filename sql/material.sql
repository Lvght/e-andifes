CREATE TABLE material(
    codigo_material CHAR(10) PRIMARY KEY,
    autor VARCHAR(50) NOT NULL,
    nomeMaterial VARCHAR(100) NOT NULL,
    conteudo TEXT NOT NULL,
    
    cpfProfessorIsf CHAR(11) NOT NULL,
    id_repositorio SERIAL NOT NULL,

    CONSTRAINT fk_id_repositorio
        FOREIGN KEY (id_repositorio)
            REFERENCES repositorio_cursista(id)
                ON DELETE CASCADE
                ON UPDATE CASCADE,
    
    CONSTRAINT fk_cpfProfessorIsf
        FOREIGN KEY (cpfProfessorIsf)
            REFERENCES professor_isf(cpf)
                ON UPDATE CASCADE
                ON DELETE CASCADE 
);