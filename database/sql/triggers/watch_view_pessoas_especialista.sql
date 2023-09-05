-- Crie um TRIGGER AFTER INSERT para manter o histórico de inserções
CREATE OR REPLACE FUNCTION after_insert_historico_insercoes_especialistas()
RETURNS TRIGGER AS
$$
BEGIN
    INSERT INTO historico_insercoes_especialistas (
        cpf,
        tipo_instituicao_atua,
        nome_mae,
        cert_poca,
        tipo_vinculo,
        setor_atuacao,
        lattes,
        maior_titulacao,
        nome_pessoa,
        email_pessoa,
        data_nascimento_pessoa
    )
    VALUES (
        NEW.cpf,
        NEW.tipo_instituicao_atua,
        NEW.nome_mae,
        NEW.cert_poca,
        NEW.tipo_vinculo,
        NEW.setor_atuacao,
        NEW.lattes,
        NEW.maior_titulacao,
        NEW.nome_pessoa,
        NEW.email_pessoa,
        NEW.data_nascimento_pessoa
    );

    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

-- Associe o TRIGGER AFTER INSERT à view view_especialistas
CREATE TRIGGER watch_view_pessoas_especialista
AFTER INSERT ON view_especialistas
FOR EACH ROW
EXECUTE FUNCTION after_insert_historico_insercoes_especialistas();
