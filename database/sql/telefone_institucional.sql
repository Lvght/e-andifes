CREATE TABLE telefone_institucional
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    FK_CPF_coordenador CHAR(11),
    FK_telefone_id INT,

    CONSTRAINT fk_coordenador
        FOREIGN KEY (FK_CPF_coordenador)
            REFERENCES coordenador_administrativo(CPF)
            ON DELETE CASCADE
            ON UPDATE CASCADE,

    CONSTRAINT fk_telefone
        FOREIGN KEY (FK_telefone_id)
            REFERENCES telefone(id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);