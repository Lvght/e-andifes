CREATE TABLE edital
(
    id serial PRIMARY KEY,
    data DATE NOT NULL,
    nome VARCHAR(255) NOT NULL,
    -- TODO Adicionar um arquivo?
    conteudo TEXT NOT NULL,
    ano INTEGER NOT NULL,
    semestre INTEGER NOT NULL,
    publicado_por CHAR(11) NOT NULL,

    CONSTRAINT fk_edital_gestor
        FOREIGN KEY (publicado_por)
            REFERENCES gestor_andifes (cpf)
);