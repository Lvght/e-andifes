CREATE OR REPLACE FUNCTION fn_parceiros_inativos()
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
DECLARE
    cparceirosinativos CURSOR FOR
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
    registro_parceiro_inativo RECORD;
BEGIN
    OPEN cparceirosinativos;

    LOOP
        FETCH cparceirosinativos INTO registro_parceiro_inativo;
        EXIT WHEN NOT FOUND;

        cnpj := registro_parceiro_inativo.cnpj;
        nome := registro_parceiro_inativo.nome;
        numero := registro_parceiro_inativo.numero;
        rua := registro_parceiro_inativo.rua;
        bairro := registro_parceiro_inativo.bairro;
        complemento := registro_parceiro_inativo.complemento;
        cpf := registro_parceiro_inativo.cpf;
        id := registro_parceiro_inativo.id;
        status := registro_parceiro_inativo.status;

        RETURN NEXT;
    END LOOP;

    CLOSE cparceirosinativos;
END;
$$ LANGUAGE plpgsql;
