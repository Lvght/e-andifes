CREATE TABLE IF NOT EXISTS disciplina_especializacao
(
    id SERIAL,
    carga_horaria INTEGER NOT NULL,
    eixo_tematico VARCHAR(255) NOT NULL,
    componente_curricular VARCHAR(255) NOT NULL,
    link_projeto_pedagogico VARCHAR(255) NOT NULL,
    nome VARCHAR(255) UNIQUE NOT NULL, 
    CONSTRAINT pk_disciplinaEspecializacao PRIMARY KEY (id)
)
