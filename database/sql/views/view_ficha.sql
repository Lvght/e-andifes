--view para visualizar a ficha base
CREATE OR REPLACE VIEW view_ficha AS
SELECT
    id,
    titulo,
    data_inicio,
    data_termino,
    observacoes,
    criado_em,
    criado_por,
    edital
FROM
    ficha_base;
