CREATE TABLE instituicao_ensino_superior
(
    id                 SERIAL PRIMARY KEY,
    nome_completo      VARCHAR(100) NOT NULL,
    campus             VARCHAR(50) NOT NULL,
    tem_NucLi          BOOLEAN NOT NULL,
    e_polo             BOOLEAN NOT NULL, -- o uso de acentos em nomes de coluna pode levar a problemas, então mudei "é_polo" para "e_polo"
    contato_reitoria   VARCHAR(50),
    IES_sigla          VARCHAR(10) NOT NULL,

    CONSTRAINT unique_nome_campus
        UNIQUE (nome_completo, campus)
);