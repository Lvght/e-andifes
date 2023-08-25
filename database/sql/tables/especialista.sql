CREATE TABLE IF NOT EXISTS especialista
(
    cpf CHAR(11),
    tipo_instituicao_atua VARCHAR(100) NOT NULL,
    nome_mae VARCHAR(255) NOT NULL,
    cert_poca VARCHAR(255) UNIQUE NOT NULL,
    link_cnpq VARCHAR(255) UNIQUE NOT NULL,
    genero VARCHAR(10) NOT NULL,
    tipo_vinculo VARCHAR(100) NOT NULL,
    setor_atuacao VARCHAR(255) NOT NULL,
    lattes VARCHAR(255) UNIQUE NOT NULL,
    maior_titulacao VARCHAR(100) NOT NULL,
    CONSTRAINT fk_especialista_pessoa
        FOREIGN KEY (cpf)
            REFERENCES pessoa(cpf)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT pk_especialista PRIMARY KEY (cpf)
);