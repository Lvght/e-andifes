CREATE VIEW view_pessoas_aluno_graduacao AS
SELECT (p.cpf), p.nome, p.genero, g.linkPOCA
FROM pessoa p
         LEFT JOIN (SELECT * FROM alunograudacao) g ON g.cpf = p.cpf
