CREATE TABLE turma_ofertada_idioma
(
    id SERIAL PRIMARY KEY

    DataIngresso DATE,
    CódigoCurso INT,
    NomeCurso VARCHAR(100),
    Idioma VARCHAR(50),
    DiaHorarioAulas VARCHAR(100),
    DiaDaSemana VARCHAR(20),
    HorarioInicio TIME,
    TipoOferta VARCHAR(50),
    DataFim DATE,
    HorarioTermino TIME,
    NroInscritos INT,
    DataInicio DATE,
    Titulo VARCHAR(200),
    CPF_ProfessorISF VARCHAR(14),
    PRIMARY KEY (DataIngresso, CódigoCurso)
);


