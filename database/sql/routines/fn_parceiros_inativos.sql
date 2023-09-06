/*
Autor: Miguel Henrique Chinellato (RA:791964)
Descrição: Função para recuperar todos os parceiros inativos 
           do sistema com a utilização de cursor explícito
*/

CREATE OR REPLACE FUNCTION fn_parceiros_inativos()
-- Retorna uma tabela com todos os parceiros inativos e seus atributos
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
    -- Declaração do cursor explícito para buscar os parceiros inativos
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

    -- Declaração de um registro para armazenar cada parceiro inativo
    registro_parceiro_inativo RECORD;
BEGIN
    OPEN cparceirosinativos;

    -- Loop que itera sobre todos os parceiros inativos
    LOOP
        -- O parceiro é armazenado no registro
        FETCH cparceirosinativos INTO registro_parceiro_inativo;
        EXIT WHEN NOT FOUND;

        -- Atribui os valores do parceiro atual às variáveis de retorno
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
