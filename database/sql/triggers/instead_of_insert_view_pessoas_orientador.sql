/*
Autor: Alisson Nunes (RA:725862)
Descrição: Trigger InsteadOf para possibilitar inserção de dados na view_pessoas_orientador
*/

CREATE OR REPLACE FUNCTION instead_of_insert_view_pessoas_orientador()
    RETURNS trigger
    LANGUAGE plpgsql
AS
$$
BEGIN
    INSERT INTO pessoa (cpf, nome_registro, nome_social, nascimento, endereco_numero, endereco_rua, endereco_bairro, endereco_id)
    VALUES (NEW.cpf, NEW.nome, NEW.nome_social, NEW.nascimento, NEW.endereco_numero, NEW.endereco_rua, NEW.endereco_bairro, NEW.endereco_id);

    INSERT INTO especialista (cpf, tipo_instituicao_atua, nome_mae, cert_poca, tipo_vinculo, setor_atuacao, lattes, maior_titulacao)
    VALUES (NEW.cpf, NEW.tipo_instituicao_atua, NEW.nome_mae, NEW.cert_poca, NEW.tipo_vinculo, NEW.setor_atuacao, NEW.lattes, NEW.maior_titulacao);

    INSERT INTO docente_orientador (cpf, disp_orientandos_grad, disp_orientandos_ce, pos_orientar_outras_ies, gestor_oferta, coord_administrativo)
    VALUES (NEW.cpf, NEW.disp_orientandos_grad, NEW.disp_orientandos_ce, NEW.pos_orientar_outras_ies, NEW.cpf, NEW.cpf);

    INSERT INTO gestor_oferta (cpf)
    VALUES (NEW.cpf);

    INSERT INTO coordenador_administrativo (CPF, lattes, funcao_ies, certificadoPOCA, CPF_gestor)
    VALUES (NEW.cpf, NEW.lattes, NEW.funcao_ies, NEW.cert_poca, NEW.cpf);

    RETURN NEW;
END;
$$;

CREATE OR REPLACE TRIGGER instead_of_insert_view_pessoas_orientador
    INSTEAD OF INSERT
    ON view_pessoas_orientador
    FOR EACH ROW
EXECUTE FUNCTION instead_of_insert_view_pessoas_orientador();
