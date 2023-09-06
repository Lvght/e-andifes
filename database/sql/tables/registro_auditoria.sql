CREATE TABLE registro_auditoria
(
    id          SERIAL PRIMARY KEY,
    tipo_acao   tipo_acao_auditoria NOT NULL,
    mensagem    TEXT                NOT NULL,
    data_hora   TIMESTAMP           NOT NULL DEFAULT CURRENT_TIMESTAMP,
    usuario     VARCHAR(255)        NOT NULL DEFAULT CURRENT_USER,
    endereco_ip VARCHAR(255)        NULL
);
