CREATE TABLE coordenador_administrativo 
(
    CPF              CHAR(11) PRIMARY KEY,
    lattes           VARCHAR(100) NOT NULL,
    funcao_ies       VARCHAR(50) NOT NULL,
    certificadoPOCA  VARCHAR(20) NOT NULL,
    CPF_gestor       CHAR(11),

    CONSTRAINT fk_pessoa
        FOREIGN KEY (CPF)
            REFERENCES pessoa(CPF)
            ON DELETE CASCADE
            ON UPDATE CASCADE,

    CONSTRAINT fk_gestor
        FOREIGN KEY (CPF_gestor)
            REFERENCES gestor_andifes(CPF)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);