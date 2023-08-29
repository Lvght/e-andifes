-- Indica se o CPF informado tem acesso ao sistema.
CREATE FUNCTION fn_has_system_access(cpf CHAR(11))
RETURNS BOOLEAN LANGUAGE plpgsql
AS $$
BEGIN
    RETURN EXISTS(SELECT 1 FROM pg_roles WHERE rolname = cpf);
END;
$$;
