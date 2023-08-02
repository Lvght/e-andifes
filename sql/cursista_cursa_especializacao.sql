CREATE TABLE cursista_cursa_especializacao(

codigo_turma_especializacao VARCHAR(16) PRIMARY KEY,
cpf_cursista CHAR(11) PRIMARY KEY,
horas_praticas_validadas INTEGER,
horas_praticas_solicitadas INTEGER,

CONSTRAINT fk_codigo_turma_especializacao
    FOREIGN KEY codigo_turma_especializacao
        REFERENCES turma_disciplina_especializacao(codigo)
            ON DELETE CASCADE
            ON UPDATE CASCADE,

CONSTRAINT fk_CPF
    FOREIGN KEY cpf_cursista
        REFERENCES pessoa(cpf)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);