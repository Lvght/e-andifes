-- Tabela referente as informações do Professor ISF
-- Ao atributo categoria pode ser atribuído dois valores distintos: cursista ou aluno da graduação

CREATE TABLE professor_isf
(
    cpf CHAR(11) PRIMARY KEY,
    titulo_formulario VARCHAR(255) NOT NULL,
    data_inicio_formulario DATE NOT NULL,
    categoria VARCHAR(25) NOT NULL,

    CONSTRAINT fk_pessoa 
    	FOREIGN KEY (cpf) 
    	    REFERENCES pessoa(cpf) 
    	    ON DELETE CASCADE 
    	    ON UPDATE CASCADE,
    
    CONSTRAINT fk_ficha_base
    	FOREIGN KEY (id) 
    	    REFERENCES ficha_base
);
