CREATE TABLE cursista(
    cpf CHAR(11) PRIMARY KEY,
    idiomaCredenciado VARCHAR(10) NOT NULL,
    siglaInstitEnsino VARCHAR(5) NOT NULL,
    diploma_link TEXT NOT NULL,
    curriculo_link TEXT NOT NULL,		
    certificadoPOCA_link TEXT NOT NULL,

    CONSTRAINT fk_cpf
        FOREIGN KEY (cpf)
            REFERENCES pessoa(cpf)
                ON UPDATE CASCADE
                ON DELETE CASCADE
);
