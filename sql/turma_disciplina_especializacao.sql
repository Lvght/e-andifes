CREATE TABLE turma_disciplina_especializacao (
  id_disc_especilizacao INTEGER NOT NULL,
  codigo_turma INTEGER NOT NULL UNIQUE,
  data_inicio  DATE NOT NULL,
  data_fim DATE NULL, 

  CONSTRAINT disciplina_especializacao
        FOREIGN KEY (id_disc_especilizacao)
            REFERENCES disciplina_especializacao (id)
                ON DELETE CASCADE
                ON UPDATE CASCADE,
  CONSTRAINT ck_turma_disciplina_especializacao PRIMARY KEY (id_disc_especilizacao,codigo_turma)
)