-- Resolve boa parte da filosofia em 1 linha.
CREATE OR REPLACE FUNCTION who_am_i() RETURNS SETOF view_admin_pessoa
AS $$
    SELECT * FROM view_admin_pessoa WHERE cpf = CURRENT_USER;
$$ LANGUAGE SQL;

-- Todos merecem conhecer a si mesmo.
GRANT EXECUTE ON FUNCTION who_am_i() TO public;
