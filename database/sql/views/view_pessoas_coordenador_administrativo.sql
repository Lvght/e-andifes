-- VIEW PARA LISTAR AS INFORMAÇÕES 
-- DE UM COORDENADOR ADMINISTRATIVO

CREATE VIEW view_pessoas_coordenador_administrativo AS
select p.nome,
	   p.sobrenome,
	   p.cpf,
       p.nascimento
from pessoa p
where p.cargo = "Coordenador Administrativo";