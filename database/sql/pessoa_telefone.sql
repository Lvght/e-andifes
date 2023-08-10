CREATE TABLE pessoa_telefone
(
    id              SERIAL PRIMARY KEY,
    pessoa          CHAR(11) NOT NULL,
    telefone_id     INTEGER NOT NULL,
    
    -- Indica se o telefone é preferido para contato.
    principal       BOOLEAN NOT NULL DEFAULT TRUE,

    CONSTRAINT unique_telefone UNIQUE (telefone),

    CONSTRAINT fk_telefone
        FOREIGN KEY (telefone_id)
            REFERENCES telefone (id)
            ON DELETE CASCADE
            ON UPDATE CASCADE,

    CONSTRAINT fk_pessoa_telefone
        FOREIGN KEY (pessoa)
            REFERENCES pessoa (cpf)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);