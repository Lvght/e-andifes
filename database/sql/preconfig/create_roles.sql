CREATE ROLE especialista NOLOGIN;
CREATE ROLE gestor_andifes INHERIT NOLOGIN;
CREATE ROLE gestor_oferta_coletiva INHERIT NOLOGIN;

GRANT especialista TO gestor_andifes;

GRANT especialista to gestor_oferta_coletiva;