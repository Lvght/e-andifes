CREATE ROLE especialista NOLOGIN;
CREATE ROLE gestor_andifes INHERIT NOLOGIN;
CREATE ROLE gestor_oferta_coletiva INHERIT NOLOGIN;
CREATE ROLE coordenador_administrativo INHERIT NOLOGIN;
CREATE ROLE aluno_especializacao INHERIT NOLOGIN;

GRANT especialista TO gestor_andifes;
