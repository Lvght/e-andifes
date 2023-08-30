CREATE PROCEDURE sp_AdicionarFicha (
  tipo_ficha NVARCHAR(255),
  -- Dados  adesao docente oferta coletiva
  id SERIAL = NULL,
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
  -- Dados inscricao oferta coletiva
  turma_ofertada INTEGER = NULL
  -- Ficha base
  titulo VARCHAR(255) = NULL,
  data_inicio DATE = NULL,
  data_termino DATE = NULL,
  observacoes TEXT = NULL,
  criado_em DATE = NULL,
  criado_por CHAR(11) = NULL,
  edital INTEGER = NULL,
)
AS
BEGIN
    -- Verificar qual tabela corresponde ao tipo de ficha e inserir a descrição
    IF tipo_ficha = 'Formulario de Adesao a Rede Andifes'
    BEGIN
        INSERT INTO ficha_adesao_rede_andifes (id, link_termo_compromisso, link_oficio_coordenador_pedagogico_geral, link_politica_linguistica, instituicao) VALUES (id, link_termo_compromisso, link_oficio_coordenador_pedagogico_geral, link_politica_linguistica, instituicao)
    END
    ELSE IF tipo_ficha = 'Formulario de Credenciamento de Especialistas'
    BEGIN
        INSERT INTO ficha_credenciamento_especialista (id, especialista, credenciado_em) VALUES (id, especialista, credenciado_em)
    END
    ELSE IF tipo_ficha = 'Formulario de Credenciamento de Professores IsF'
    BEGIN
        INSERT INTO ficha_credenciamento_professor_isf (id, docente_orientador, professor_isf) VALUES (id, docente_orientador, professor_isf)
    END
    ELSE IF tipo_ficha = 'Formulario de Adesão do Docente à Oferta Coletiva'
    BEGIN
        INSERT INTO ficha_adesao_docente_oferta_coletiva (id, emissor, professor_isf, turma_ofertada) VALUES (id, emissor, professor_isf, turma_ofertada)
    END
    ELSE IF tipo_ficha = 'Formulario de Inscrição em Oferta Coletiva'
    BEGIN
        INSERT INTO ficha_inscricao_oferta_coletiva (id, turma_ofertada) VALUES (id, turma_ofertada)
    END
    ELSE IF tipo_ficha = 'Ficha base'
    BEGIN
        INSERT INTO ficha_base (id, titulo, data_inicio, data_termino, observacoes, criado_em, criado_por, edital) VALUES (id, titulo, data_inicio, data_termino, observacoes, criado_em, criado_por, edital)
    END
    ELSE
    BEGIN
        -- Tipo de ficha inválido
        RAISERROR('Tipo de ficha inválido!', 16, 1)
    END
END
