-- Função que será chamada pelo trigger
CREATE OR REPLACE FUNCTION verificar_numero_inscritos()
RETURNS TRIGGER AS $$
BEGIN
    -- Verificar se o número de inscritos é negativo
    IF NEW.numero_inscritos < 0 THEN
        RAISE EXCEPTION 'Número de inscritos não pode ser negativo!';
    END IF;
    -- Se tudo estiver ok, retorna NEW para permitir a inserção/atualização
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Criação do trigger que chama a função acima antes de uma inserção ou atualização
CREATE TRIGGER tr_verificar_inscritos
BEFORE INSERT OR UPDATE ON turma_ofertada_idioma
FOR EACH ROW
EXECUTE FUNCTION verificar_numero_inscritos();
