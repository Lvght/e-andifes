CREATE TABLE email
(
    endereco VARCHAR(255) PRIMARY KEY,
    CPF_pessoa VARCHAR(11) NOT NULL,

    CONSTRAINT fk_CPF   
        FOREIGN KEY (endereco)
        REFERENCES pessoa (cpf)
        ON DELETE CASCADE
        ON DELETE UPDATE
)
