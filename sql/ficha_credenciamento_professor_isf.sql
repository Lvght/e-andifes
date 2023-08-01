-- Ficha que relaciona o cadastramento do Professor ISF com quem o cadastrou,
-- qual o edital relacionado, etc.

CREATE TABLE ficha_credenciamento_professor_isf
(
    id SERIAL PRIMARY KEY,
    docente_orientador CHAR(11),
    professor_isf CHAR(11),

    CONSTRAINT fk_ficha_base
        FOREIGN KEY (id)
            REFERENCES ficha_base (id),

    CONSTRAINT fk_docente_orientador
        FOREIGN KEY (docente_orientador)
            REFERENCES docente_orientador (cpf),

    CONSTRAINT fk_professor_isf
        FOREIGN KEY (professor_isf)
            REFERENCES professor_isf (cpf)
);