-- Tabela que relaciona as entidades de Pessoa e E-Mail.
-- Uma mesma pessoa pode ter mais de um e-mail.

CREATE TABLE pessoa_email
(
    id        SERIAL PRIMARY KEY,
    pessoa    CHAR(11)     NOT NULL,
    email     VARCHAR(255) NOT NULL,

    -- Indica qual o e-mail preferido para receber notificações.
    principal BOOLEAN      NOT NULL DEFAULT TRUE,

    CONSTRAINT unique_email UNIQUE (email),

    CONSTRAINT fk_email
        FOREIGN KEY (email)
            REFERENCES email (endereco)
            ON DELETE CASCADE
            ON UPDATE CASCADE,

    CONSTRAINT fk_pessoa
        FOREIGN KEY (pessoa)
            REFERENCES pessoa (cpf)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);