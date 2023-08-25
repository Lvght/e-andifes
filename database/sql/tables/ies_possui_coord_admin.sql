CREATE TABLE IES_possui_coord_admin 
(
    id                 SERIAL PRIMARY KEY,
    FK_coord_admin     CHAR(11) NOT NULL,
    FK_ies             INT NOT NULL,
    inicio             DATE NOT NULL,
    fim                DATE,
    status             VARCHAR(20) NOT NULL,

    CONSTRAINT fk_instituicao_ensino_superior
        FOREIGN KEY (FK_ies)
            REFERENCES instituicao_ensino_superior(id)
            ON DELETE CASCADE
            ON UPDATE CASCADE,

    CONSTRAINT fk_coordenador_administrativo
        FOREIGN KEY (FK_coord_admin)
            REFERENCES coordenador_administrativo(CPF)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);






