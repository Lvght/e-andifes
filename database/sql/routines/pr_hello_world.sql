-- Cria um procedimento que imprime Hello, world!
CREATE PROCEDURE pr_hello_world()
LANGUAGE plpgsql
AS $$
BEGIN
    RAISE NOTICE 'Hello, world!';
END
$$;
