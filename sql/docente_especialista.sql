CREATE TABLE IF NOT EXISTS curso
(
    cpf VARCHAR(11) PRIMARY KEY,
    disponibilidade VARCHAR(100),
    eh_ministrante BOOLEAN,
    eh_autor BOOLEAN,
    CONSTRAINT fk_gestor_andifes
        FOREIGN KEY (cpf)
            REFERENCES gestor_andifes (cpf)
                ON DELETE CASCADE
                ON UPDATE CASCADE
);