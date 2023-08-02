CREATE TABLE endereco
(
    cep  CHAR(9) PRIMARY KEY,
    cidade VARCHAR(50) NOT NULL,
    estado VARCHAR(50) NOT NULL,
    pais VARCHAR(50) NOT NULL
);