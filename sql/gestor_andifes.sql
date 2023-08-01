-- Informações sobre o cargo máximo do sistema.
-- Deter uma entrada na tabela significa ter permissões de quase root.

CREATE TABLE gestor_andifes
(
    cpf CHAR(11) PRIMARY KEY,
    papel_atuacao VARCHAR(50) NOT NULL,
    CONSTRAINT fk_gestor_andifes_especialista
        FOREIGN KEY (cpf)
            REFERENCES especialista (cpf)
            ON DELETE CASCADE
);