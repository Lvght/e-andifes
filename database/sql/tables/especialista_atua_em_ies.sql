CREATE TABLE especialista_atua_em_ies (
    id SERIAL           PRIMARY KEY,
    FK_id_ies           INT NOT NULL,
    FK_cpf_especialista CHAR(11) NOT NULL,
    inicio              DATE NOT NULL,
    fim                 DATE,
    FOREIGN KEY (FK_id_ies) REFERENCES instituicao_ensino_superior(id),
    FOREIGN KEY (FK_cpf_especialista) REFERENCES especialista(cpf)
);