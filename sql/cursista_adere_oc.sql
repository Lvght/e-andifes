CREATE TABLE cursista_adere_oc (
    cpf_cursista VARCHAR(11) NOT NULL,
    data_inicio DATE NOT NULL,
    titulo VARCHAR(20) NOT NULL,

    CONSTRAINT fk_CPF
        FOREIGN KEY (cpf_cursista)
        REFERENCES cursista (cpf)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_data_inicio
        FOREIGN KEY (data_inicio)
        REFERENCES oferta_coletiva (data_inicio)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_titulo
        FOREIGN KEY (titulo)
        REFERENCES oferta_coletiva (titulo)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
)