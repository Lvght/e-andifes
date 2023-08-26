drop view if exists view_pessoa;
CREATE VIEW view_admin_pessoa AS
SELECT cpf,
       nome,
       primeiro_nome,
       sobrenome,
       fn_has_system_access(cpf) as possui_acesso,
       nascimento,
       endereco_rua,
       endereco_numero,
       endereco_bairro,
       codigo_postal as endereco_codigo_postal,
       cidade as endereco_cidade,
       estado as endereco_estado,
       pais as endereco_pais
FROM pessoa
         INNER JOIN endereco ON pessoa.endereco_id = endereco.id;

select * from view_admin_pessoa;