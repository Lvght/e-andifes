-- Resolve boa parte da filosofia em 1 linha.
CREATE OR REPLACE FUNCTION fn_who_am_i() RETURNS SETOF pessoa
AS $$
    SELECT * FROM pessoa WHERE cpf = CURRENT_USER;
$$ LANGUAGE SQL;

-- Todos merecem conhecer a si mesmo.
GRANT EXECUTE ON FUNCTION fn_who_am_i() TO public;
