CREATE TABLE email_institucional
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    FK_CPF_coordenador CHAR(11),
    FK_endereco_email VARCHAR(255),

    CONSTRAINT fk_coordenador
        FOREIGN KEY (FK_CPF_coordenador)
            REFERENCES coordenador_administrativo(CPF)
            ON DELETE CASCADE
            ON UPDATE CASCADE,

    CONSTRAINT fk_email
        FOREIGN KEY (FK_endereco_email)
            REFERENCES email(endereco)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);