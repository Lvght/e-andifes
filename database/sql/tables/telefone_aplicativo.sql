CREATE TABLE telefone_aplicativo (
    id_telefone INTEGER NOT NULL,
    id_aplicativo_mensagem INTEGER NOT NULL,

    FOREIGN KEY (id_telefone) REFERENCES telefone (id),
    FOREIGN KEY (id_aplicativo_mensagem) REFERENCES aplicativo_mensagem (id),
    PRIMARY KEY (id_telefone, id_aplicativo_mensagem)
);
