CREATE TABLE nucleo_linguistico
(
    id            SERIAL PRIMARY KEY,
    -- Aqui precisaria alterar o tipo da chave primária FK_IES, caso não seja integer na outra tabela
    FK_IES        INT NOT NULL,
    logradouro    VARCHAR(100) NOT NULL,
    FK_CEP        VARCHAR(8) NOT NULL,

    CONSTRAINT fk_cep
        FOREIGN KEY (FK_CEP)
            REFERENCES endereco (CEP)
            ON DELETE CASCADE
            ON UPDATE CASCADE,

    CONSTRAINT fk_instituicao_ensino_superior
        FOREIGN KEY (FK_IES)
        -- Aqui precisaria alterar para a chave primária que for da instituição de ensino
            REFERENCES instituicao_ensino_superior (id)
            ON DELETE CASCADE
            ON UPDATE CASCADE,

    CONSTRAINT unique_endereco_instituicao
        UNIQUE (FK_CEP, FK_IES)
);