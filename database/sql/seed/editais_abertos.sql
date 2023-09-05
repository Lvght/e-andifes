INSERT INTO edital (data, nome, conteudo, ano, semestre, publicado_por) VALUES ('2023-10-01', 'Edital de Adesão a rede andifes', 'test', 2023, 2, 1);
INSERT INTO ficha_base (titulo, data_inicio, data_termino, observacoes, criado_em, criado_por, edital) 
VALUES ('Adesão a rede andifes', '2023-10-01', '2023-12-20', 'Algumas observações aqui.', CURRENT_DATE, 1, 1);

INSERT INTO edital (data, nome, conteudo, ano, semestre, publicado_por) VALUES ('2023-10-01', 'Edital de aprovação dos professores da Andifes', 'test', 2023, 2, 1);
INSERT INTO ficha_base (titulo, data_inicio, data_termino, observacoes, criado_em, criado_por, edital) 
VALUES ('Aprovação dos professores da Andifes', '2023-10-01', '2023-12-20', 'Algumas observações aqui.', CURRENT_DATE, 1, 2);