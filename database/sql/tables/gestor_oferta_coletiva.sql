-- Usuário 3

CREATE TABLE gestor_oferta_coletiva
(
    cpf CHAR(11) PRIMARY KEY,
    email_institucional CHAR (50),
    ies_id INTEGER NOT NULL,

    CONSTRAINT fk_especialista
        FOREIGN KEY (cpf)
            REFERENCES especialista (cpf)
                ON DELETE CASCADE
                ON UPDATE CASCADE,
    CONSTRAINT fk_ies_id
        FOREIGN KEY (ies_id)
            REFERENCES instituicao_ensino_superior (id)
                ON DELETE CASCADE
                ON UPDATE CASCADE
);
