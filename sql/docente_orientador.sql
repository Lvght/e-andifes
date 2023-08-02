-- Usuário 6
-- Por Jonathan Braian Dias Vaz, 790870

CREATE TABLE docente_orientador
(
    cpf CHAR(11) PRIMARY KEY,

    disp_orientandos_grad INTEGER NOT NULL,
    disp_orientandos_ce INTEGER NOT NULL,
    pos_orientar_outras_ies CHAR(3) NOT NULL,

    adesao_docente_oc INTEGER NOT NULL,
    gestor_oferta CHAR(11) NOT NULL,
    coord_administrativo CHAR(11) NOT NULL,

    CONSTRAINT fk_especialista
        FOREIGN KEY (cpf)
            REFERENCES especialista (cpf)
                ON DELETE CASCADE
                ON UPDATE CASCADEE
    
    -- CONSTRAINT fk_adesao_docente_oc
    --     FOREIGN KEY (adesao_docente_oc)
    --         REFERENCES ficha_base (id)
    --             ON DELETE CASCADE
    --             ON UPDATE CASCADE
--
    --CONSTRAINT fk_gestor_oferta
    --    FOREIGN KEY (gestor_oferta)
    --        REFERENCES especialista (cpf)
    --            ON DELETE CASCADE
    --            ON UPDATE CASCADE,

    --CONSTRAINT fk_coord_administrativo
    --    FOREIGN KEY (coord_administrativo)
    --         REFERENCES especialista (cpf)
    --            ON DELETE CASCADE
    --            ON UPDATE CASCADE,
    
);
