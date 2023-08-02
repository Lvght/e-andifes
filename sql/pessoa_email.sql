-- Tabela que relaciona as entidades de Pessoa e E-Mail.
-- Uma mesma pessoa pode ter mais de um e-mail.

CREATE TABLE pessoa_email
(
    email     VARCHAR(255) NOT NULL PRIMARY KEY,
    pessoa    CHAR(11)     NOT NULL,

    -- Indica qual o e-mail preferido para receber notificações.
    principal BOOLEAN      NOT NULL DEFAULT TRUE,

    CONSTRAINT fk_pessoa
        FOREIGN KEY (pessoa)
            REFERENCES pessoa (cpf)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);