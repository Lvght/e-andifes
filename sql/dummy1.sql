-- Esta tabela precisa ser criada DEPOIS de Dummy2.

CREATE TABLE Dummy1 (
    id SERIAL PRIMARY KEY,
    Dummy2Id INT NOT NULL,
    CONSTRAINT FK_Dummy1_Dummy2 FOREIGN KEY (Dummy2Id) REFERENCES Dummy2 (id)
);