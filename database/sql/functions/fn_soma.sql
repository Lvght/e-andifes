CREATE FUNCTION fn_soma(a integer, b integer)
RETURNS integer LANGUAGE plpgsql
AS $$
BEGIN
    RETURN a + b;
END
$$;