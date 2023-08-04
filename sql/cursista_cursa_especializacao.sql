CREATE TABLE cursista_cursa_especializacao(
    id SERIAL PRIMARY KEY,
    codigo_turma_especializacao VARCHAR(16),
    cpf_cursista CHAR(11),
    horas_praticas_validadas INTEGER,
    horas_praticas_solicitadas INTEGER,

    CONSTRAINT unique_codigo_cpf UNIQUE (codigo_turma_especializacao,cpf_cursista),

    CONSTRAINT fk_codigo_turma_especializacao
        FOREIGN KEY (codigo_turma_especializacao)
            REFERENCES turma_disciplina_especializacao(codigo_turma)
            ON DELETE CASCADE
            ON UPDATE CASCADE,

    CONSTRAINT fk_CPF
        FOREIGN KEY (cpf_cursista)
            REFERENCES pessoa(cpf)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);