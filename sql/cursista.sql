CREATE TABLE cursista(
    cpf CHAR(11) PRIMARY KEY,

    CONSTRAINT fk_cpf
        FOREIGN KEY (cpf)
            REFERENCES pessoa(cpf)
                ON DELETE CASCADE
                ON UPDATE CASCADE
);
