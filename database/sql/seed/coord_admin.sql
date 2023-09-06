-- inserção para teste das triggers DML e schema. Caso a inserção ocorra, a trigger DML deu permissão --
-- caso aconteça a exclusão do coordenador_adminsitrativo, a trigger schema é acionada e cadastra o --
-- histórico no database --

INSERT INTO coordenador_administrativo(cpf,lattes, funcao_ies, certificadopoca) 
    VALUES (3, 'teste', 'coord', 'aa');