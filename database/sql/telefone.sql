CREATE TABLE telefone
(
    id SERIAL PRIMARY KEY,
    codigo_pais SMALLINT NOT NULL,
    codigo_area SMALLINT NOT NULL,
    numero INTEGER NOT NULL,

    CONSTRAINT unique_by_locale UNIQUE (codigo_pais, codigo_area, numero)
);
