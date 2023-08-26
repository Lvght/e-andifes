-- Impede que qualquer usuário possa chamar os procedimentos definidos no banco.
-- Essa instrução revoga as permissões do usuário que define as rotinas.
-- Assim, essas permissões não são levadas adiante.
ALTER DEFAULT PRIVILEGES FOR USER postgres
    REVOKE EXECUTE ON ROUTINES FROM public;
