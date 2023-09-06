/*
Autor: Caio Ueda Sampaio (RA:802215)
Descrição: assertion checa se o a ficha inda está ativa,
ou seja, se a data de término ainda não passou

trigger DML registra as modificações feitas na tabela "ficha_base" em uma tabela de auditoria
que rastreará qualquer operação de INSERT, UPDATE ou DELETE na tabela.
*/

/* esta sintaxe não funciona no postgres 9.6
CREATE OR REPLACE FUNCTION ficha_ativa()
CHECK (
    current_date <= ALL (
    SELECT data_termino
        FROM ficha_base
    )
);
*/

/*
--Assertion
CREATE OR REPLACE FUNCTION ficha_ativa()
    RETURNS trigger
    LANGUAGE plpgsql
AS
$$
BEGIN
    IF NEW.data_termino <= current_date THEN
        RAISE EXCEPTION 'Este edital já encerrou';
    END IF;
    RETURN NEW;
END;
$$ 

CREATE OR REPLACE TRIGGER tr_ficha_ativa
BEFORE INSERT OR UPDATE ON ficha_base
FOR EACH ROW
WHEN (NEW.data_termino <= CURRENT_DATE)
EXECUTE FUNCTION ficha_ativa();
*/
--TriggerDML
CREATE TABLE ficha_base_audit (
    id SERIAL PRIMARY KEY,
    acao VARCHAR(10),
    data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    usuario CHAR(11),
    registro_afetado INTEGER,
    titulo VARCHAR(255),
    data_inicio DATE,
    data_termino DATE,
    observacoes TEXT
);

CREATE OR REPLACE FUNCTION ficha_base_audit_trigger()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO ficha_base_audit (acao, usuario, registro_afetado, titulo, data_inicio, data_termino, observacoes)
        VALUES ('INSERT', CURRENT_USER, NEW.id, NEW.titulo, NEW.data_inicio, NEW.data_termino, NEW.observacoes);
    ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO ficha_base_audit (acao, usuario, registro_afetado, titulo, data_inicio, data_termino, observacoes)
        VALUES ('UPDATE', CURRENT_USER, OLD.id, NEW.titulo, NEW.data_inicio, NEW.data_termino, NEW.observacoes);
    ELSIF TG_OP = 'DELETE' THEN
        INSERT INTO ficha_base_audit (acao, usuario, registro_afetado, titulo, data_inicio, data_termino, observacoes)
        VALUES ('DELETE', CURRENT_USER, OLD.id, OLD.titulo, OLD.data_inicio, OLD.data_termino, OLD.observacoes);
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER ficha_base_audit
AFTER INSERT OR UPDATE OR DELETE ON ficha_base
FOR EACH ROW
EXECUTE FUNCTION ficha_base_audit_trigger();

