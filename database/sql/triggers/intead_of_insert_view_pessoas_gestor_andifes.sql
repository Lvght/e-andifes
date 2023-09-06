CREATE OR REPLACE FUNCTION fn_instead_of_insert_pessoas_gestor_andifes()
RETURNS TRIGGER AS $$
BEGIN
    -- Logic to handle the insert on the view
    INSERT INTO pessoa (cpf, nome)
    VALUES (NEW.pessoa_cpf, NEW.pessoa_nome);

    INSERT INTO gestor_andifes (id, FK_cpf_pessoa, FK_id_ies)
    VALUES (NEW.gestor_andifes_id, NEW.pessoa_cpf, NEW.instituicao_id);

    -- Add any other necessary logic or inserts based on the view structure

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tr_instead_of_insert_pessoas_gestor_andifes
INSTEAD OF INSERT ON view_pessoas_gestor_andifes
FOR EACH ROW
EXECUTE FUNCTION fn_instead_of_insert_pessoas_gestor_andifes();
