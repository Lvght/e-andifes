CREATE OR REPLACE FUNCTION parceiros_inativos()
RETURNS TABLE (
    cnpj VARCHAR(18),
    nome VARCHAR(100),
    numero INT,
    rua VARCHAR(200),
    bairro VARCHAR(100),
    complemento VARCHAR(100),
    cpf CHAR(11),
    id INTEGER,
    status VARCHAR(20)
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        p.cnpj,
        p.nome,
        p.numero,
        p.rua,
        p.bairro,
        p.complemento,
        p.cpf,
        p.id,
	p.status
    FROM
        parceiro p
    WHERE
        p.status = 'Inativo';
END;
$$ LANGUAGE plpgsql;
