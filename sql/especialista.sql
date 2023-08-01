CREATE TABLE especialista
(
    cpf CHAR(11) PRIMARY KEY,
    CONSTRAINT fk_especialista_pessoa FOREIGN KEY (cpf) REFERENCES pessoa(cpf)
);