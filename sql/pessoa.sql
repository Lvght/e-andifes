CREATE TABLE pessoa
(
    cpf CHAR(11) PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(50) NOT NULL,
    nascimento_dia INTEGER NOT NULL,
    nascimento_mes INTEGER NOT NULL,
    nascimento_ano INTEGER NOT NULL,
    numero_endereco VARCHAR(5) NOT NULL,
    rua varchar(50) NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    endereco_id  INTEGER NOT NULL,

    CONSTRAINT fk_endereco
        FOREIGN KEY (endereco_id)
            REFERENCES endereco(id)
            ON DELETE RESTRICT 
            ON UPDATE NO ACTION 
);