-- Tabela referente as informações do Professor ISF
-- Ao atributo categoria pode ser atribuído dois valores distintos: cursista ou aluno da graduação

CREATE TABLE professor_isf (
    cpf CHAR(11) PRIMARY KEY,
    id_ficha_base INTEGER NOT NULL,
    categoria CATEGORIA_PROFESSOR_ISF NOT NULL,

    CONSTRAINT fk_pessoa 
    	FOREIGN KEY (cpf) 
    	    REFERENCES pessoa (cpf) 
    	    ON DELETE CASCADE 
    	    ON UPDATE CASCADE,
    
    CONSTRAINT fk_ficha_base
    	FOREIGN KEY (id_ficha_base) 
    	    REFERENCES ficha_base (id)
);
