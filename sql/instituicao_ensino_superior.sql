CREATE TABLE instituicao_ensino_superior
(
    id                 SERIAL PRIMARY KEY,
    nome_completo      VARCHAR(100) NOT NULL,
    campus             VARCHAR(50) NOT NULL,
    tem_NucLi          BOOLEAN NOT NULL,
    e_polo             BOOLEAN NOT NULL, 
    contato_reitoria   VARCHAR(50),
    FK_IES_sigla          VARCHAR(10) NOT NULL,
    FK_id_endereco     INT NOT NULL,

    CONSTRAINT fk_ies_sigla
        FOREIGN KEY (FK_IES_sigla)
            REFERENCES sigla_instituicao_superior (sigla)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
            
     CONSTRAINT fk_endereco
        FOREIGN KEY (FK_id_endereco)
            REFERENCES endereco  (id)
            ON DELETE CASCADE
            ON UPDATE CASCADE,

    CONSTRAINT unique_nome_campus
        UNIQUE (nome_completo, campus)

);