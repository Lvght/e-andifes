/*
Autor: Pedro Lealdini do Prado Borges (RA:790894)
Descrição: view para visualizar todas as pessoas com acesso ao sistema
*/

CREATE VIEW view_pessoas_com_acesso AS
SELECT *
FROM pessoa
WHERE fn_has_system_access(cpf) = true;
