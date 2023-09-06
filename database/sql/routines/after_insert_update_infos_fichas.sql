/*
Autor: Caio Ueda Sampaio (RA:802215)
Descrição: checa se o a ficha inda está ativa,
ou seja, se a data de término ainda não passou
*/

CREATE OR REPLACE ASSERTION ficha_ativa
CHECK (NOT EXISTS (
    SELECT *
    FROM ficha_base
    WHERE current_date > data_termino
)
);