CREATE TABLE email_requisitante_adesao_rede_andifes
(
    email varchar(255) PRIMARY KEY,
    requisitante CHAR(11) NOT NULL,

    CONSTRAINT fk_requisitante
        FOREIGN KEY(requisitante)
            REFERENCES requisitante_adesao_rede_andifes(cpf),

    CONSTRAINT fk_email
        FOREIGN KEY(email)
            REFERENCES email(endereco)
            ON UPDATE CASCADE
);