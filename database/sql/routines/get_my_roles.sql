-- Esta função diz quem você é na fila do pão.
-- Necessário para construir alguns elementos da interface.

-- A integridade do banco é garantida por vias mais drásticas.
-- Isso aqui é só para ajudar a construção da interface.

CREATE OR REPLACE FUNCTION get_my_roles()
    RETURNS TABLE
            (
                role_name VARCHAR
            )
AS
$$
DECLARE
    _role_name VARCHAR;
BEGIN
    FOR _role_name IN
        SELECT r.rolname
        FROM pg_roles r
                 INNER JOIN pg_auth_members m ON m.roleid = r.oid
                 INNER JOIN pg_roles u ON u.oid = m.member
        WHERE u.rolname = CURRENT_USER
          AND r.rolname !~ '^pg_'
          AND r.rolname <> 'postgres'
        LOOP
            -- atribui na coluna de saída
            role_name := _role_name;
            RETURN NEXT;
        END LOOP;
END;
$$ LANGUAGE plpgsql;
