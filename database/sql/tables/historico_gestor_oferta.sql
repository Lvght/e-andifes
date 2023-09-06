CREATE TABLE historico_gestor_oferta
(
    historico_id SERIAL PRIMARY KEY,
    cpf CHAR(11),
    operacao VARCHAR(10), -- 'INSERT', 'UPDATE', 'DELETE'
    data_operacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    usuario VARCHAR(100) DEFAULT CURRENT_USER, -- Campo para armazenar o usuário que fez a alteração
    CONSTRAINT fk_historico_gestor_oferta_cpf FOREIGN KEY (cpf) REFERENCES gestor_oferta(cpf)
);
