CREATE TABLE sigla_instituicao_superior (
    id SERIAL PRIMARY KEY,
    sigla VARCHAR(10) NOT NULL
);

COMMENT ON TABLE sigla_instituicao_superior
    IS 'Uma ies pode ser cadastrada mais de uma vez,'
    'dado que ela pode ter mais de um campus. Como esses campi'
    'tem a mesma sigla, criamos essa tabela separada. Alem disso,'
    'foi adicionado um surrogate, pois universidades diferentes podem ter'
    'a mesma sigla';