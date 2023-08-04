CREATE TABLE IF NOT EXISTS orientador_orienta_aluno_graduacao
(
    cpf_orientador CHAR(11),
    cpf_aluno_graduacao CHAR(11),
    declaracao_docente VARCHAR(255),

    CONSTRAINT pk_orientaGrad PRIMARY KEY (cpf_orientador, cpf_aluno_graduacao),
    CONSTRAINT fk_cpfOrientador FOREIGN KEY (cpf_orientador) REFERENCES docente_orientador(cpf) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_cpfAlunoGrad FOREIGN KEY (cpf_aluno_graduacao) REFERENCES aluno_graduacao(cpf) ON DELETE CASCADE ON UPDATE CASCADE
);
