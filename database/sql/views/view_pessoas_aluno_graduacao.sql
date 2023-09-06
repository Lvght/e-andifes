CREATE VIEW view_pessoas_aluno_graduacao AS
SELECT (p.cpf), p.nome, p.genero, g.link_certPOCA, g.link_resultadoSelecao, g.link_vinculoFile, g.link_termoCompromisso
FROM pessoa p
         LEFT JOIN (SELECT * FROM aluno_graduacao) g ON g.cpf = p.cpf
