-- Este arquivo faz a configuração inicial do banco de dados.

CREATE DATABASE andifes WITH ENCODING 'UTF8'
                                      -- Determina a ordenação dos dados textuais.
                                      LC_COLLATE 'en_US.utf8'

                                      -- Determina a classificação dos dados textuais.
                                      LC_CTYPE 'en_US.utf8';
