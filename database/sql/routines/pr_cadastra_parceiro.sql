CREATE OR REPLACE PROCEDURE pr_cadastra_parceiro(
    p_cnpj VARCHAR(18),
    p_nome VARCHAR(100),
    p_numero INT,
    p_rua VARCHAR(200),
    p_bairro VARCHAR(100),
    p_complemento VARCHAR(100),
    p_cpf CHAR(11),
    p_id INTEGER,
    p_status VARCHAR(20)
)
LANGUAGE plpgsql
AS $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM especialista WHERE cpf = p_cpf) THEN
        RAISE EXCEPTION 'Especialista não encontrado';
    END IF;

    IF NOT EXISTS (SELECT 1 FROM endereco WHERE id = p_id) THEN
        RAISE EXCEPTION 'Endereço não encontrado';
    END IF;

    INSERT INTO parceiro (cnpj, nome, numero, rua, bairro, complemento, cpf, id, status)
    VALUES (p_cnpj, p_nome, p_numero, p_rua, p_bairro, p_complemento, p_cpf, p_id, p_status);

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END;
$$;