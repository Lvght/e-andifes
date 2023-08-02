CREATE TABLE cursista_gerencia_repositorio(
    id SERIAL PRIMARY KEY,
    cpf_cursista char(11),
    codigo_repositorio VARCHAR(50),
    dia_semana DIASEMANA,
    horario_inicio DATETIME,
    idioma IDIOMA NOT NULL,
    codigo_curso INTEGER,
    nome_curso VARCHAR(100) NOT NULL,
    horas_praticas_validadas INTEGER,
    horas_praticas_solicitadas INTEGER,

    CONSTRAINT fk_cpf_cursista
        FOREIGN KEY cpf_cursista
            REFERENCES pessoa(cpf)
            ON DELETE CASCADE
            ON UPDATE CASCADE,

    CONSTRAINT fk_codigo_repositorio
        FOREIGN KEY codigo_repositorio
            REFERENCES repositorio_cursista(codigo)
            ON DELETE CASCADE
            ON UPDATE CASCADE,

    CONSTRAINT fk_codigo_curso
        FOREIGN KEY codigo_curso
            REFERENCES curso(codigo_curso)
            ON DELETE CASCADE
            ON UPDATE CASCADE,

    CONSTRAINT chave_unica
        UNIQUE (codigo_repositorio, dia_semana, horario_inicio, idioma, codigo_curso, nome_curso)
    
);