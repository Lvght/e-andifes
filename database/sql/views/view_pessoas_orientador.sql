/*
Autor: Alisson Nunes (RA:725862)
Descrição: View para listar os dados dos orientadores
*/

CREATE OR REPLACE VIEW view_pessoas_orientador AS
SELECT
    p.cpf,
    p.nome,
    p.nascimento,
    p.genero,
    p.endereco_numero,
    p.endereco_rua,
    p.endereco_bairro,
    e.tipo_instituicao_atua AS tipo_instituicao,
    e.nome_mae,
    e.cert_poca AS certidao_poca,
    e.tipo_vinculo,
    e.setor_atuacao,
    e.lattes,
    e.maior_titulacao,
    do_disp.disp_orientandos_grad,
    do_disp.disp_orientandos_ce,
    do_disp.pos_orientar_outras_ies,
    do_disp.gestor_oferta,
    do_disp.coord_administrativo
FROM
    pessoa p
LEFT JOIN
    especialista e ON p.cpf = e.cpf
LEFT JOIN
    docente_orientador do_disp ON p.cpf = do_disp.cpf;
