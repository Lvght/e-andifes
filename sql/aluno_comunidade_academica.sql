CREATE TABLE aluno_comunidade_academica
(
    cpf                     CHAR(11) PRIMARY KEY,
    area_atuacao            VARCHAR(50) NOT NULL,
    tipo_vinculo            VARCHAR(50) NOT NULL,
    genero                  GENERO     NOT NULL,
    instituicao_ensino      VARCHAR(50) NOT NULL,
    comprovante_matricula   VARCHAR(50) NOT NULL,  
    id_ficha_base           SERIAL NOT NULL,

    CONSTRAINT fk_pessoa
        FOREIGN KEY (cpf)
            REFERENCES pessoa (cpf)
            ON DELETE CASCADE
            ON UPDATE CASCADE,

    CONSTRAINT fk_id_ficha_base 
        FOREIGN KEY (id_ficha_base)
            REFERENCES ficha_base(id)
);

COMMENT ON COLUMN aluno_comunidade_academica.instituicao_ensino
    IS 'Nome da Instituição de Ensino do aluno. Não relacionado com a tabela de mesmo nome';