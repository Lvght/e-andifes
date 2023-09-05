CREATE PROCEDURE pr_AdicionarFicha (
  tipo_ficha VARCHAR,
  -- Dados  adesao docente oferta coletiva
  emissor CHAR(11) = NULL,
  professor_isf CHAR(11) = NULL,
  turma_ofertada INTEGER = NULL,
  -- Dados adesao redes andifes
  link_termo_compromisso TEXT    = NULL,
  link_oficio_coordenador_pedagogico_geral TEXT    = NULL,
  link_politica_linguistica TEXT    = NULL,
  instituicao INTEGER = NULL,
  -- Dados credenciamento especialista
  especialista CHAR(11) = NULL,
  credenciado_em TEXT = NULL,
  -- Dados credenciamento professor
  docente_orientador CHAR(11) = NULL,
  -- Ficha base
  titulo VARCHAR = NULL,
  data_inicio DATE = NULL,
  data_termino DATE = NULL,
  observacoes TEXT = NULL,
  criado_em DATE = NULL,
  criado_por CHAR(11) = NULL,
  edital INTEGER = NULL
)
AS $$
BEGIN
    -- Verificar qual tabela corresponde ao tipo de ficha e inserir a descrição
    IF tipo_ficha = 'Formulario de Adesao a Rede Andifes' THEN
        INSERT INTO ficha_adesao_rede_andifes (link_termo_compromisso, link_oficio_coordenador_pedagogico_geral, link_politica_linguistica, instituicao) VALUES (link_termo_compromisso, link_oficio_coordenador_pedagogico_geral, link_politica_linguistica, instituicao);
    
    ELSIF tipo_ficha = 'Formulario de Credenciamento de Especialistas' THEN
        INSERT INTO ficha_credenciamento_especialista (especialista, credenciado_em) VALUES (especialista, credenciado_em);
    
    ELSIF tipo_ficha = 'Formulario de Credenciamento de Professores IsF' THEN
        INSERT INTO ficha_credenciamento_professor_isf (docente_orientador, professor_isf) VALUES (docente_orientador, professor_isf);
    
    ELSIF tipo_ficha = 'Formulario de Adesão do Docente à Oferta Coletiva' THEN
        INSERT INTO ficha_adesao_docente_oferta_coletiva (emissor, professor_isf, turma_ofertada) VALUES (emissor, professor_isf, turma_ofertada);
    
    ELSIF tipo_ficha = 'Formulario de Inscrição em Oferta Coletiva' THEN
        INSERT INTO ficha_inscricao_oferta_coletiva (turma_ofertada) VALUES (turma_ofertada);
    
    ELSIF tipo_ficha = 'Ficha base' THEN
        INSERT INTO ficha_base (titulo, data_inicio, data_termino, observacoes, criado_em, criado_por, edital) VALUES (titulo, data_inicio, data_termino, observacoes, criado_em, criado_por, edital);

    END IF;
END
$$ LANGUAGE plpgsql;
