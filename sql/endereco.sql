CREATE TABLE endereco (
    id SERIAL PRIMARY KEY,
    codigo_postal VARCHAR(20) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado VARCHAR(50),
    pais VARCHAR(50) NOT NULL,
    
    CONSTRAINT unique_endereco UNIQUE (codigo_postal, pais)
);
