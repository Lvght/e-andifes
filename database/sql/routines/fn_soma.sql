CREATE OR REPLACE FUNCTION fn_soma(a integer, b integer)
RETURNS INTEGER LANGUAGE plpgsql
AS $$
BEGIN
    RAISE WARNING 'Soma chamada pelo usuário %', current_user;
    RETURN a + b;
END
$$;

REVOKE ALL PRIVILEGES ON FUNCTION fn_soma(integer, integer) FROM PUBLIC;
GRANT EXECUTE ON FUNCTION fn_soma(integer, integer) TO postgres;