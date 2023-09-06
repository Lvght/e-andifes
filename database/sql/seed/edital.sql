INSERT INTO edital(nome, data_publicacao, ano, semestre, publicado_por, arquivo)
VALUES ('Edital 1', CURRENT_DATE, 2023, 1, '1', pg_read_binary_file('/opt/sql/seed/dummy.pdf'));
