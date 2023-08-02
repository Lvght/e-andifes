CREATE TABLE parceiro (
    cnpj VARCHAR(18) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    numero INT NOT NULL,
    rua VARCHAR(200) NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    complemento VARCHAR(100),
    cpf CHAR(11),
    id INTEGER NOT NULL,

    CONSTRAINT fk_gestor
        FOREIGN KEY (cpf)
            REFERENCES especialista(cpf)
            ON DELETE CASCADE
            ON UPDATE CASCADE,

    CONSTRAINT fk_endereco
        FOREIGN KEY (id)
            REFERENCES endereco(id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);
