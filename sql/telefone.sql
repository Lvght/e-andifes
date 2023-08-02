CREATE TABLE telefone 
(
    id SERIAL PRIMARY KEY,
    codigo_area VARCHAR(4) NOT NULL,
    codigo_pais VARCHAR(4) NOT NULL,
    numero VARCHAR(9) NOT NULL,
    CPF_pessoa VARCHAR(11) NOT NULL,

    CONSTRAINT unique_by_locale UNIQUE (codigo_pais, codigo_area, numero)

    CONSTRAINT fk_CPF
        FOREIGN KEY (CPF_pessoa)
        REFERENCES CPF (pessoa)
        ON DELETE CASCADE
        ON UPDATE CASCADE;
)
