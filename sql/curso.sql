CREATE TABLE IF NOT EXISTS curso
(
    id SERIAL PRIMARY KEY,
    
    nome VARCHAR(100) NOT NULL,
    codigo INTEGER NOT NULL,
    idioma VARCHAR(50) NOT NULL,
    carga_horaria INTEGER,
    link_plano_de_ensino TEXT,

);