CREATE VIEW view_reg_pessoa AS
SELECT DISTINCT ON (p.cpf) p.nome, p.genero, t.codigo_pais, t.codigo_area, t.numero, am.nome as aplicativo
FROM pessoa p
         LEFT JOIN (SELECT * FROM pessoa_telefone WHERE principal = TRUE) pt ON pt.cpf_pessoa = p.cpf
         LEFT JOIN telefone t ON t.id = pt.id_telefone
         LEFT JOIN telefone_aplicativo ta ON ta.id_telefone = t.id
         LEFT JOIN aplicativo_mensagem am ON am.id = ta.id_aplicativo_mensagem;
