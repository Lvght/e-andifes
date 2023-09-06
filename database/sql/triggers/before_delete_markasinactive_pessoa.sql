/*
Autor: Pedro Lealdini do Prado Borges (RA:790894)
Descrição: Trigger DML que vigia a tabela pessoa e antes de um DELETE ao invés de deletar marca a pessoa como inativa
*/

CREATE OR REPLACE FUNCTION before_delete_pessoa()
RETURNS TRIGGER AS $$
BEGIN
  ASSERT (TG_OP = 'DELETE', 'Trigger funcionando apenas para DELETE');
  ASSERT (OLD.status_inativo = false, 'Não é possível deletar uma pessoa inativa');
  UPDATE pessoa SET status_inativo = true WHERE cpf = OLD.cpf;
  RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER pessoa_delete
BEFORE DELETE ON pessoa
FOR EACH ROW
EXECUTE FUNCTION before_delete_pessoa();
