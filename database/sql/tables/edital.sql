CREATE TABLE edital
(
    id              serial PRIMARY KEY,
    data_publicacao DATE         NOT NULL,
    nome            VARCHAR(255) NOT NULL,
    arquivo         BYTEA        NULL,
    ano             INTEGER      NOT NULL,
    semestre        INTEGER      NOT NULL,
    publicado_por   CHAR(11)     NOT NULL,

    criado_em       TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    criado_por      VARCHAR      NOT NULL DEFAULT CURRENT_USER,

    CONSTRAINT fk_edital_gestor FOREIGN KEY (publicado_por) REFERENCES gestor_andifes (cpf)
);

COMMENT ON COLUMN edital.ano IS 'Ano para o qual o edital se aplica. Não é calculado a partir da data à vista de que situações excepcionais como o calendário da UFSCar podem ocorrer.';

COMMENT ON COLUMN edital.semestre IS 'Semestre para o qual o edital se aplica. Não é calculado a partir da data à vista de que situações excepcionais como o calendário da UFSCar podem ocorrer.';
