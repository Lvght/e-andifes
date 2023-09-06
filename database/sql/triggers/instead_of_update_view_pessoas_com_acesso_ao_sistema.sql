/*
Autor: Pedro Lealdini do Prado Borges (RA:790894)
Descrição: 
*/
CREATE OR REPLACE FUNCTION instead_of_view_pessoas_com_acesso_ao_sistema()
RETURNS TRIGGER AS $$
BEGIN
  IF (TG_OP = 'INSERT') THEN
    INSERT INTO pessoa_temp VALUES (NEW.*);
  ELSIF (TG_OP = 'UPDATE') THEN
    UPDATE pessoa_temp SET nome = NEW.nome, status_inativo = NEW.status_inativo WHERE cpf = NEW.cpf;
  ELSIF (TG_OP = 'DELETE') THEN
    UPDATE pessoa_temp SET status_inativo = true WHERE cpf = OLD.cpf;
  END IF;
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER view_pessoas_com_acesso_trigger
INSTEAD OF INSERT OR UPDATE OR DELETE ON view_pessoas_com_acesso
FOR EACH ROW
EXECUTE FUNCTION instead_of_view_pessoas_com_acesso_ao_sistema();
