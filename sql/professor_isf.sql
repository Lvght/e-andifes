-- FIXME Completar isso...

CREATE TABLE professor_isf
(
    cpf CHAR(11) PRIMARY KEY,

    CONSTRAINT fk_pessoa
        FOREIGN KEY (cpf)
            REFERENCES pessoa(cpf)
)