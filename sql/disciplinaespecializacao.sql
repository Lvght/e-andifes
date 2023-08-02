CREATE TABLE IF NOT EXISTS disciplinaespecializacao
(
    id CHAR(100),
    nome VARCHAR(100) NOT NULL,
    carga_horaria VARCHAR(255) NOT NULL,
    eixo_tematico VARCHAR(255) NOT NULL,
    componente_curricular VARCHAR(255) NOT NULL,
    link_projeto_pedagogico VARCHAR(10) NOT NULL,
    tipo_disciplina VARCHAR(100) NOT NULL,
    nome VARCHAR(255) UNIQUE NOT NULL,
   
    
    CONSTRAINT pk_disciplinaespecializacao PRIMARY KEY (id)
);