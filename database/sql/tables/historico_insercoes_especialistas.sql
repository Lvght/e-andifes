CREATE TABLE IF NOT EXISTS historico_insercoes_especialistas (
    id SERIAL PRIMARY KEY,
    cpf CHAR(11),
    tipo_instituicao_atua VARCHAR(100),
    nome_mae VARCHAR(255),
    cert_poca VARCHAR(255),
    tipo_vinculo VARCHAR(100),
    setor_atuacao VARCHAR(255),
    lattes VARCHAR(255),
    maior_titulacao VARCHAR(100),
    nome_pessoa VARCHAR(255),
    email_pessoa VARCHAR(255),
    data_nascimento_pessoa DATE,
    data_insercao TIMESTAMP DEFAULT NOW()
);
