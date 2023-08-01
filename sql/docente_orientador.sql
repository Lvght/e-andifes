-- Usuário 6

CREATE TABLE docente_orientador
(
    cpf CHAR(11) PRIMARY KEY,
    CONSTRAINT fk_especialista
        FOREIGN KEY (cpf)
            REFERENCES especialista (cpf)
                ON DELETE CASCADE
                ON UPDATE CASCADE
);
