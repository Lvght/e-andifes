-- Informações sobre o requisitante na Adesão da Rede Andifes.

CREATE TABLE requisitante_adesao_rede_andifes
(
    cpf        CHAR(11) PRIMARY KEY,
    funcao     VARCHAR(100) NOT NULL,
    nome       VARCHAR(100) NOT NULL,
    requisicao INTEGER      NOT NULL,

    CONSTRAINT fk_requisicao
        FOREIGN KEY (requisicao)
            REFERENCES ficha_adesao_rede_andifes (id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);