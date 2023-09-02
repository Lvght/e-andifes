CREATE TABLE hist_curso
(
    id SERIAL PRIMARY KEY,
    data_hora TIMESTAMP DEFAULT NOW(),
    usuario VARCHAR(100),
    id_deleted INTEGER,
    nome_deleted VARCHAR(100),
    codigo_deleted INTEGER,
    idioma_deleted VARCHAR(50),
    carga_horaria_deleted INTEGER,
    link_plano_de_ensino_deleted TEXT
);
