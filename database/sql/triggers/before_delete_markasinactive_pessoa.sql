/*
Autor: Pedro Lealdini do Prado Borges (RA:790894)
Descrição: Trigger DML que vigia a tabela pessoa e antes de um DELETE ao invés de deletar marca a pessoa como inativa
*/


CREATE OR REPLACE FUNCTION before_delete_pessoa()
RETURNS TRIGGER AS $$
BEGIN
    /*NEW.status = 'inativo';*/
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER before_delete_markasinactive_pessoa
BEFORE DELETE ON pessoa
FOR EACH ROW
EXECUTE FUNCTION before_delete_pessoa();