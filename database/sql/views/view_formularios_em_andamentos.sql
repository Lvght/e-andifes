-- View para ver os formularios em andamento
CREATE OR REPLACE VIEW ficha_em_andamento AS
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
    ficha_base
WHERE
    data_termino IS NULL OR data_termino > CURRENT_DATE;
