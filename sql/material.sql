CREATE TABLE material(
    codigoMaterial INTEGER PRIMARY KEY,
    autor VARCHAR(50) NOT NULL,
    nomeMaterial VARCHAR(100) NOT NULL,
    conteudo TEXT NOT NULL,
    
    cpfProfessorIsf CHAR(11) NOT NULL,
    
    CONSTRAINT fk_cpfProfessorIsf
        FOREIGN KEY (cpfProfessorIsf)
            REFERENCES professor_isf(cpf)
                ON UPDATE CASCADE
                ON DELETE CASCADE 
);