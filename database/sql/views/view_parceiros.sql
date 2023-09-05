CREATE OR REPLACE VIEW view_parceiros AS
SELECT
    p.cnpj,
    p.nome,
    p.numero,
    p.rua,
    p.bairro,
    p.complemento,
    p.cpf,
    p.id,
    p.status
FROM
    parceiro p;