CREATE OR REPLACE FUNCTION fn_insert_turma_ofertada_idioma() RETURNS TRIGGER AS $BODY$
BEGIN
    INSERT INTO turma_ofertada_idioma(
        dia_semana,
        horario_inicio,
        idioma,
        id_curso,
        dia_horario_aulas,
        titulo,
        data_inicio,
        data_fim,
        tipo_oferta,
        horario_termino,
        numero_inscritos,
        cpf_professor_isf
    )
    VALUES(
        NEW.dia_semana,
        NEW.horario_inicio,
        NEW.idioma,
        NEW.id_curso,
        NEW.dia_horario_aulas,
        NEW.titulo,
        NEW.data_inicio,
        NEW.data_fim,
        NEW.tipo_oferta,
        NEW.horario_termino,
        NEW.numero_inscritos,
        NEW.cpf_professor_isf
    );
    
    RETURN NEW;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER tr_insert_turma_ofertada_idioma
INSTEAD OF INSERT ON view_turma_ofertada_idioma
FOR EACH ROW
EXECUTE FUNCTION fn_insert_turma_ofertada_idioma();
