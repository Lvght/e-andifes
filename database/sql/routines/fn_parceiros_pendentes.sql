/*
Autor: Alisson Nunes (RA:725862)
Descrição: Função para recuperar todos os parceiros pendentes do sistema com a utilização de cursor explícito
*/

CREATE OR REPLACE FUNCTION fn_parceiros_pendentes()
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
)
LANGUAGE plpgsql
AS $$
DECLARE
    -- Declaração do cursor explícito para buscar os parceiros pendentes
    cparceirospendentes CURSOR FOR
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
            p.status = 'Em Aprovação';

    -- Declaração de um registro para armazenar cada parceiro pendente
    registro_parceiro_pendente RECORD;
BEGIN
    OPEN cparceirospendentes;

    -- Loop que itera sobre todos os parceiros pendentes
    LOOP
        -- O parceiro é armazenado no registro
        FETCH cparceirospendentes INTO registro_parceiro_pendente;
        EXIT WHEN NOT FOUND;

        -- Atribui os valores do parceiro atual às variáveis de retorno
        cnpj := registro_parceiro_pendente.cnpj;
        nome := registro_parceiro_pendente.nome;
        numero := registro_parceiro_pendente.numero;
        rua := registro_parceiro_pendente.rua;
        bairro := registro_parceiro_pendente.bairro;
        complemento := registro_parceiro_pendente.complemento;
        cpf := registro_parceiro_pendente.cpf;
        id := registro_parceiro_pendente.id;
        status := registro_parceiro_pendente.status;

        RETURN NEXT;
    END LOOP;

    CLOSE cparceirospendentes;
END;
$$;