-- Arquivo para os tipos customizados.

CREATE TYPE GENERO AS ENUM ('M', 'F', 'O');

CREATE TYPE IDIOMA AS ENUM('JAP', 'ING', 'ITA', 'PT', 'ESP', 'ALE', 'FRA');

CREATE TYPE DIASEMANA AS ENUM('SEG', 'TER', 'QUA', 'QUI', 'SEX', 'SAB', 'DOM');
CREATE TYPE CATEGORIA_PROFESSOR_ISF AS ENUM ('Cursista', 'Aluno da Graduação');

