CREATE OR REPLACE PROCEDURE pr_cadastra_instituicao(
    p_nome_completo VARCHAR(100),
    p_campus VARCHAR(50),
    p_tem_NucLi BOOLEAN,
    p_e_polo BOOLEAN,
    p_contato_reitoria VARCHAR(50),
    p_FK_IES_sigla INT,
    p_FK_id_endereco INT
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_instituicao instituicao_ensino_superior%ROWTYPE;
    cur_instituicao CURSOR FOR 
        SELECT * 
        FROM instituicao_ensino_superior 
        WHERE nome_completo = p_nome_completo AND campus = p_campus;
BEGIN
    OPEN cur_instituicao;
    FETCH cur_instituicao INTO v_instituicao;

    IF NOT FOUND THEN
        INSERT INTO instituicao_ensino_superior (nome_completo, campus, tem_NucLi, e_polo, contato_reitoria, FK_IES_sigla, FK_id_endereco)
        VALUES (p_nome_completo, p_campus, p_tem_NucLi, p_e_polo, p_contato_reitoria, p_FK_IES_sigla, p_FK_id_endereco);
    ELSE
        RAISE NOTICE 'Institution with name % and campus % already exists.', p_nome_completo, p_campus;
    END IF;

    CLOSE cur_instituicao;
END;
$$;
