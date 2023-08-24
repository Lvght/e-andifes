-- Tabela que representa o formulário de Credenciamento do Especialista.

CREATE TABLE ficha_credenciamento_especialista
(
    id             SERIAL PRIMARY KEY,
    especialista   CHAR(11) NOT NULL,
    credenciado_em TEXT     NOT NULL,


    CONSTRAINT fk_especialista FOREIGN KEY (especialista)
        REFERENCES especialista (cpf)
        ON DELETE CASCADE,
    CONSTRAINT fk_ficha_base FOREIGN KEY (id)
        REFERENCES ficha_base (id)
        ON DELETE CASCADE
);
