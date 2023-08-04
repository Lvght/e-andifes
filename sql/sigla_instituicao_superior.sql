CREATE TABLE sigla_instituicao_superior (
    id SERIAL PRIMARY KEY,
    sigla VARCHAR(10) NOT NULL UNIQUE
);