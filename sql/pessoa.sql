CREATE TABLE pessoa
(
    cpf CHAR(11) PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(50) NOT NULL,
    nascimento_dia INT(2) NOT NULL,
    nascimento_mes INT(2) NOT NULL,
    nascimento_ano INT(4) NOT NULL,
    numero_endereco VARCHAR(5) NOT NULL,
    rua varchar(50) NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    cep  CHAR(9) NOT NULL,

    CONSTRAINT fk_cep
        FOREIGN KEY (cep)
            REFERENCES endereco(cep)
            ON DELETE RESTRICT 
            ON UPDATE NO ACTION 
);