CREATE PROCEDURE cadastra_curso_oferta(
    id INTEGER,
    nome VARCHAR(100),
    codigo INTEGER,
    idioma VARCHAR(50),
    carga_horaria INTEGER,
    link_plano_de_ensino TEXT
)
LANGUAGE plpgsql
AS
$$
DECLARE
    r REFCURSOR;
    curso_corrente curso%ROWTYPE;
BEGIN
    OPEN r FOR SELECT * FROM curso;
    FETCH r INTO curso_corrente;

    IF curso_corrente IS NOT NULL THEN
        RAISE EXCEPTION 'Curso com código % já existe.', codigo;
    END IF;

    INSERT INTO curso(id,nome,codigo,idioma,carga_horaria,link_plano_de_ensino)
    VALUES(id,nome,codigo,idioma,carga_horaria,link_plano_de_ensino);

    CLOSE r;
    RAISE NOTICE 'Curso cadastrado pelo %.', CURRENT_USER;
END
$$;