CREATE TABLE edital
(
    id            serial PRIMARY KEY,
    data          DATE         NOT NULL,
    nome          VARCHAR(255) NOT NULL,
    -- TODO Adicionar um arquivo?
    conteudo      TEXT         NOT NULL,
    ano           INTEGER      NOT NULL,
    semestre      INTEGER      NOT NULL,
    publicado_por CHAR(11)     NOT NULL,

    CONSTRAINT fk_edital_gestor
        FOREIGN KEY (publicado_por)
            REFERENCES gestor_andifes (cpf)
);

COMMENT ON COLUMN edital.conteudo IS 'Conteúdo do edital. Idealmente um conteúdo em HTML ou Markdown.';

COMMENT ON COLUMN edital.ano IS 'Ano para o qual o edital se aplica. Não é calculado a partir da '
    'dada à vista de que situações excepcionais como o calendário da UFSCar podem ocorrer.';

COMMENT ON COLUMN edital.semestre IS 'Semestre para o qual o edital se aplica. Não é calculado a partir da '
    'dada à vista de que situações excepcionais como o calendário da UFSCar podem ocorrer.';
