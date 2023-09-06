--criacao da funcao e seus parametros
CREATE OR REPLACE FUNCTION fn_todos_parceiros()
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
    -- declaracao do cursor
    cparceirostodos CURSOR FOR
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
            parceiro p;
    registro_parceiro_todos RECORD;
BEGIN
    -- abre o cursor
    OPEN cparceirostodos;

    -- Loop para percorrer todos
    LOOP
        FETCH cparceirostodos INTO registro_parceiro_todos;
        EXIT WHEN NOT FOUND;

        cnpj := registro_parceiro_todos.cnpj;
        nome := registro_parceiro_todos.nome;
        numero := registro_parceiro_todos.numero;
        rua := registro_parceiro_todos.rua;
        bairro := registro_parceiro_todos.bairro;
        complemento := registro_parceiro_todos.complemento;
        cpf := registro_parceiro_todos.cpf;
        id := registro_parceiro_todos.id;
        status := registro_parceiro_todos.status;
        --retorna os parceiros
        RETURN NEXT;
    END LOOP;

    CLOSE cparceirostodos;
END;
$$ LANGUAGE plpgsql;