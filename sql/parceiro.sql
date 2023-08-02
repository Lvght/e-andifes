CREATE TABLE Parceiro (
    CNPJ VARCHAR(18) PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Numero INT NOT NULL,
    Rua VARCHAR(200) NOT NULL,
    Bairro VARCHAR(100) NOT NULL,
    Complemento VARCHAR(100),

    CONSTRAINT fk_gestor
        FOREIGN KEY (cpf)
            REFERENCES pessoa (cpf)
            ON DELETE CASCADE
            ON UPDATE CASCADE

    CONSTRAINT fk_endereco
        FOREIGN KEY (CEP)
            REFERENCES endereco(CEP)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);
