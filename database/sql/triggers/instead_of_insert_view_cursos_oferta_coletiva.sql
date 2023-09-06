-- Criação do Trigger Instead Of
CREATE OR REPLACE FUNCTION instead_of_insert_view_cursos_oferta_coletiva()
RETURNS TRIGGER AS $$
BEGIN
    -- Inserir na tabela 'curso'
    INSERT INTO curso (nome, codigo, idioma, carga_horaria, link_plano_de_ensino)
    VALUES (NEW.nome_curso, NEW.codigo_curso, NEW.idioma_curso, NEW.carga_horaria_curso, NEW.link_plano_de_ensino);

    -- Obter o ID inserido na tabela 'curso'
    SELECT currval(pg_get_serial_sequence('curso', 'id')) INTO NEW.curso_id;

    -- Inserir na tabela 'turma_ofertada_idioma'
    INSERT INTO turma_ofertada_idioma (dia_semana, horario_inicio, idioma, id_curso, dia_horario_aulas, titulo, data_inicio, data_fim, tipo_oferta, horario_termino, numero_inscritos, cpf_professor_isf)
    VALUES (NEW.dia_semana, NEW.horario_inicio, NEW.idioma_curso, NEW.curso_id, '', '', NULL, NULL, NULL, NULL, NULL, '');

    -- Obter o ID inserido na tabela 'turma_ofertada_idioma'
    SELECT currval(pg_get_serial_sequence('turma_ofertada_idioma', 'id')) INTO NEW.turma_id;

    -- Atualizar a view 'view_cursos_oc' com os dados inseridos
    UPDATE view_cursos_oc
    SET curso_id = NEW.curso_id, turma_id = NEW.turma_id
    WHERE curso_id IS NULL AND turma_id IS NULL;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Associar o Trigger Instead Of à view 'view_cursos_oc'
CREATE TRIGGER trg_insert_instead_of_view_cursos_oc
INSTEAD OF INSERT ON view_cursos_oc
FOR EACH ROW
EXECUTE FUNCTION instead_of_insert_view_cursos_oferta_coletiva();
