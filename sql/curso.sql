CREATE TABLE curso(
    id SERIAL PRIMARY KEY,
    idioma IDIOMA NOT NULL,
    codigo_curso INTEGER NOT NULL,
    nome_curso VARCHAR(100) NOT NULL
);