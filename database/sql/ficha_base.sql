-- Arquivo anteriormente chamado de Formulário.
-- Decidir um bom nome ainda é uma questão pertinente...

-- Esta tabela é a base para os demais tipos de formulário.
-- Nas tabelas especializadas, é mantido quem cadastrou cada entidade, quando isso ocorreu
-- e demais informações que possam ser pertinentes.
CREATE TABLE ficha_base
(
    id           SERIAL PRIMARY KEY,
    titulo       VARCHAR(255) NOT NULL,
    data_inicio  DATE         NOT NULL,
    data_termino DATE         NULL,
    observacoes  TEXT         NULL,

    criado_em    DATE         NOT NULL DEFAULT CURRENT_DATE,
    criado_por   CHAR(11)     NOT NULL,
    edital       INTEGER      NULL,

    CONSTRAINT fk_criado_por_gestor_andifes
        FOREIGN KEY (criado_por)
            REFERENCES gestor_andifes (cpf),

    CONSTRAINT fk_edital
        FOREIGN KEY (edital)
            REFERENCES edital (id),

    CONSTRAINT unique_titulo_criado_em UNIQUE (titulo, criado_em)
);