--TEM QUE FINALIZAR - CRIADA APENAS PARA USO DE CHAVE ESTRANGEIRA

CREATE TABLE gestor_andifes
(
    cpf CHAR(11) PRIMARY KEY,
    
    CONSTRAINT fk_especialista
        FOREIGN KEY (cpf)
            REFERENCES especialista (cpf)
                ON DELETE CASCADE
                ON UPDATE CASCADE
);