-- Tabela que relaciona pessoa com telefone.
CREATE TABLE pessoa_telefone
(
    cpf_pessoa  CHAR(11) NOT NULL,
    id_telefone INTEGER  NOT NULL,
    principal   BOOLEAN  NOT NULL DEFAULT TRUE,
    PRIMARY KEY (cpf_pessoa, id_telefone),
    FOREIGN KEY (cpf_pessoa) REFERENCES pessoa (cpf),
    FOREIGN KEY (id_telefone) REFERENCES telefone (id)
);
