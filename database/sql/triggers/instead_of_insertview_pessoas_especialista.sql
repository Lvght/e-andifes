CREATE OR REPLACE FUNCTION tr_instead_of_insertview_pessoas_especialista()
RETURNS TRIGGER AS
$$
BEGIN
    -- Inserir os dados na tabela especialista e pessoa
    INSERT INTO pessoa (cpf, nome, email, data_nascimento)
    VALUES (
        NEW.cpf,
        NEW.nome_pessoa,
        NEW.email_pessoa,
        NEW.data_nascimento_pessoa
    );

    INSERT INTO especialista (cpf, tipo_instituicao_atua, nome_mae, cert_poca, tipo_vinculo, setor_atuacao, lattes, maior_titulacao)
    VALUES (
        NEW.cpf,
        NEW.tipo_instituicao_atua,
        NEW.nome_mae,
        NEW.cert_poca,
        NEW.tipo_vinculo,
        NEW.setor_atuacao,
        NEW.lattes,
        NEW.maior_titulacao
    );

    -- Retornar o controle para a view
    RETURN NULL;
END;
$$
LANGUAGE plpgsql;

-- Associar o TRIGGER INSTEAD OF à view view_especialistas
CREATE TRIGGER tr_instead_of_insertview_pessoas_especialista
INSTEAD OF INSERT ON view_especialistas
FOR EACH ROW
EXECUTE FUNCTION instead_of_insertview_pessoas_especialista();
