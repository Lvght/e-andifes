CREATE TABLE deferimento_edital
(
    id SERIAL PRIMARY KEY,
    conteudo TEXT NULL,
    -- TODO Adicionar um PDF de anexo?

    edital_id INTEGER NOT NULL,
    ficha_id INTEGER NOT NULL,
    publicado_por CHAR(11) NOT NULL,

    CONSTRAINT fk_edital
        FOREIGN KEY (edital_id)
            REFERENCES edital (id)
                ON UPDATE CASCADE
                ON DELETE CASCADE,

    CONSTRAINT fk_ficha
        FOREIGN KEY (ficha_id)
            REFERENCES ficha_base (id)
                ON UPDATE CASCADE
                ON DELETE CASCADE,

    CONSTRAINT fk_publicado_por
        FOREIGN KEY (publicado_por)
            REFERENCES gestor_andifes (cpf)
                ON UPDATE CASCADE
                ON DELETE CASCADE
);

COMMENT ON TABLE deferimento_edital
    IS 'Tabela que contém os resultados dos editais.';
