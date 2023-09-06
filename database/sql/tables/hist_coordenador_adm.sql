CREATE TABLE hist_coord_admin
(
    id                       SERIAL PRIMARY KEY,
    data_hora                TIMESTAMP DEFAULT NOW(),
    usuario                  VARCHAR(100),
    cpf_deleted              CHAR(11),
    lattes_deleted           VARCHAR(100),
    funcao_ies_deleted       VARCHAR(50),
    certificadoPOCA_deleted  VARCHAR(20),
    CPF_gestor_deleted       CHAR(11)
);
