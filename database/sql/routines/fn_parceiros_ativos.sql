CREATE OR REPLACE FUNCTION fn_parceiros_ativos()
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
    cparceirosativos CURSOR FOR
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
            p.status = 'Ativo';
    registro_parceiro_ativo RECORD;
BEGIN
    OPEN cparceirosativos;

    LOOP
        FETCH cparceirosativos INTO registro_parceiro_ativo;
        EXIT WHEN NOT FOUND;

        cnpj := registro_parceiro_ativo.cnpj;
        nome := registro_parceiro_ativo.nome;
        numero := registro_parceiro_ativo.numero;
        rua := registro_parceiro_ativo.rua;
        bairro := registro_parceiro_ativo.bairro;
        complemento := registro_parceiro_ativo.complemento;
        cpf := registro_parceiro_ativo.cpf;
        id := registro_parceiro_ativo.id;
        status := registro_parceiro_ativo.status;

        RETURN NEXT;
    END LOOP;

    CLOSE cparceirosativos;
END;
$$ LANGUAGE plpgsql;