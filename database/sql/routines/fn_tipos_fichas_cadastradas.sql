-- Essa função retorna os tipos de fichas cadastradas no sistema
CREATE OR REPLACE FUNCTION fn_tipos_fichas_cadastradas()
RETURNS TABLE (
    tipo_ficha VARCHAR(255)
) AS
$$
BEGIN
    RETURN QUERY
    SELECT DISTINCT titulo
    FROM ficha_base;
END;
$$
LANGUAGE plpgsql;
