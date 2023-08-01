-- Tabela que representa o formulário de adesão à Rede Andifes.
-- Esta tabela mantém o histórico de cadastro das instituições de ensino.

CREATE TABLE ficha_adesao_rede_andifes
(
    id                                       SERIAL PRIMARY KEY,
    link_termo_compromisso                   TEXT NOT NULL,
    link_oficio_coordenador_pedagogico_geral TEXT NOT NULL,
    link_politica_linguistica                TEXT NOT NULL,

    CONSTRAINT fk_ficha_historica FOREIGN KEY (id)
        REFERENCES ficha_historica (id)
        ON DELETE CASCADE
);