CREATE TABLE pessoa
(
    cpf CHAR(11) PRIMARY KEY,

    -- Nome que consta no documento da pessoa.
    nome_registro VARCHAR(50) NOT NULL,

    -- Nome social comprovado.
    nome_social VARCHAR(50) NULL,

    -- Nome completo.
    nome VARCHAR GENERATED ALWAYS AS (
        CASE
            WHEN nome_social IS NULL THEN nome_registro
            ELSE nome_social
        END
    ) STORED,

    primeiro_nome VARCHAR GENERATED ALWAYS AS (
        CASE
            WHEN nome_social IS NULL THEN SPLIT_PART(nome_registro, ' ', 1)
            ELSE SPLIT_PART(nome_social, ' ', 1)
        END
    ) STORED,

    sobrenome VARCHAR GENERATED ALWAYS AS (
        CASE
            WHEN nome_social IS NULL THEN SPLIT_PART(nome_registro, ' ', 2)
            ELSE SPLIT_PART(nome_social, ' ', 2)
        END
    ) STORED,

    nascimento DATE NOT NULL,
    genero GENERO DEFAULT 'U',
    endereco_numero VARCHAR(5) NOT NULL,
    endereco_rua varchar(50) NOT NULL,
    endereco_bairro VARCHAR(50) NOT NULL,
    endereco_id  INTEGER NOT NULL,
    status_inativo BOOLEAN DEFAULT false,

    CONSTRAINT fk_endereco
        FOREIGN KEY (endereco_id)
            REFERENCES endereco(id)
            ON DELETE RESTRICT 
            ON UPDATE NO ACTION 
);