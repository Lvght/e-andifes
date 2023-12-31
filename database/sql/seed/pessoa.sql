CREATE ROLE "1" INHERIT LOGIN PASSWORD '123mudar';
CREATE ROLE "2" INHERIT LOGIN PASSWORD '123mudar';
CREATE ROLE "3" INHERIT LOGIN PASSWORD '123mudar';
CREATE ROLE "4" INHERIT LOGIN PASSWORD '123mudar';
CREATE ROLE "5" INHERIT LOGIN PASSWORD '123mudar';

INSERT INTO pessoa
(cpf, nome_registro, nome_social, nascimento, endereco_numero, endereco_rua, endereco_bairro, endereco_id)

VALUES ('1', 'Administrador Andifes', NULL, '1990-01-01', '123A', 'Rua Paulista', 'Centro', 1),
       ('2', 'Maria de Souza', 'Fernando de Souza', '1992-02-02', '045B', 'Rua do Rio', 'Copacabana', 2),
       ('3', 'Carlos Pereira', NULL, '1985-03-03', '078C', 'Rua Mineira', 'Savassi', 3),
       ('4', 'Luciana Menezes', NULL, '1978-04-04', '055D', 'Rua Brasiliense', 'Asa Norte', 4),
       ('5', 'Roberto Alves', NULL, '2000-05-05', '99AE', 'Rua Gaúcha', 'Moinhos', 5),
       ('12345678915', 'Isabel Dias', NULL, '1993-06-06', '222F', 'Rua Pernambucana', 'Boa Viagem', 6),
       ('12345678916', 'Gabriel Santos', NULL, '1982-07-07', '11AG', 'Rua Baiana', 'Pelourinho', 7),
       ('12345678917', 'Daniela Oliveira', NULL, '1999-08-08', '333H', 'Rua Curitibana', 'Batel', 8),
       ('12345678918', 'Eduardo Smith', NULL, '1960-09-09', '444I', '5th Avenue', 'Manhattan', 9),
       ('12345678919', 'Emily Johnson', NULL, '1991-10-10', '777J', 'Sunset Boulevard', 'Hollywood', 10),
       ('12345678920', 'Simon Williams', NULL, '1988-11-11', '56AK', 'Sherbrooke St', 'Westmount', 11),
       ('12345678921', 'Anna Wilson', NULL, '1972-12-12', '12AL', 'Yonge Street', 'Downtown', 12),
       ('12345678922', 'Brian Martin', NULL, '2001-01-13', '23AM', 'Marine Drive', 'West End', 13),
       ('12345678923', 'Grace Hall', NULL, '1984-02-14', '45AN', 'Shinjuku Road', 'Shinjuku', 14),
       ('12345678924', 'Nancy Lee', NULL, '1979-03-15', '67AO', 'Osaka Bay', 'Naniwa', 15),
       ('12345678925', 'Steven Lewis', NULL, '1995-04-16', '12AP', 'Kyoto Street', 'Nakagyo', 16),
       ('12345678926', 'Frank Harris', NULL, '1980-05-17', '78AQ', 'Alfama Street', 'Alfama', 17),
       ('12345678927', 'Diana Young', NULL, '1990-06-18', '34AR', 'Porto Avenue', 'Cedofeita', 18),
       ('12345678928', 'Jerry Clark', NULL, '2003-07-19', '56AS', 'Calle Mayor', 'Centro', 19),
       ('12345678929', 'Megan Wilson', NULL, '1975-08-20', '12AT', 'La Rambla', 'Ciutat Vella', 20),
       ('12345678930', 'Walter Gray', NULL, '1983-09-21', '45AU', 'Friedrichstraße', 'Mitte', 21),
       ('12345678931', 'Suzanne Scott', NULL, '1999-10-22', '34AV', 'Sendlinger Straße', 'Altstadt', 22),
       ('12345678932', 'Raymond Evans', NULL, '1965-11-23', '78AW', 'Oxford Street', 'Westminster', 23),
       ('12345678933', 'Rebecca White', NULL, '2002-12-24', '90AX', 'Deansgate', 'Spinningfields', 24),
       ('12345678934', 'Gary Nelson', NULL, '1971-01-25', '12AY', 'George Street', 'CBD', 25),
       ('12345678935', 'Denise King', NULL, '1989-02-26', '34AZ', 'Collins Street', 'Docklands', 26),
       ('12345678936', 'Bruce Wright', NULL, '1977-03-27', '56BA', 'Adelaide Street', 'New Farm', 27),
       ('12345678937', 'Rose Hill', NULL, '1994-04-28', '67BB', 'Champs-Élysées', '8th arr.', 28),
       ('12345678938', 'Alan Murphy', NULL, '1985-05-29', '90BC', 'Canebière', '1st arr.', 29),
       ('12345678939', 'Virginia Lee', NULL, '1998-06-30', '12BD', 'Via del Corso', 'Centro Storico', 30),
       ('12345678940', 'Bobby Walker', NULL, '2001-07-31', '45BE', 'Corso Buenos Aires', 'Loreto', 31),
       ('12345678941', 'Jane Adams', NULL, '1960-08-01', '78BF', 'Rue Royale', 'Center', 32),
       ('12345678942', 'Harold Baker', NULL, '1983-09-02', '12BG', 'Meir', 'Center', 33),
       ('12345678943', 'Diane Kelly', NULL, '1972-10-03', '45BH', 'Damrak', 'Centrum', 34),
       ('12345678944', 'Stephen Rogers', NULL, '1996-11-04', '67BI', 'Coolsingel', 'Centrum', 35),
       ('12345678945', 'Annie Edwards', NULL, '1975-12-05', '90BJ', 'Bahnhofstrasse', '1st District', 36),
       ('12345678946', 'Roger Campbell', NULL, '1990-01-06', '12BK', 'Rue du Rhône', 'Paquis', 37),
       ('12345678947', 'Lois Allen', NULL, '1981-02-07', '45BL', 'Karl Johans gate', 'Sentrum', 38),
       ('12345678948', 'Ralph Perez', NULL, '1966-03-08', '78BM', 'Kungsgatan', 'Norrmalm', 39),
       ('12345678949', 'Anne Howard', NULL, '1999-04-09', '90BN', 'Nevsky Prospekt', 'Tsentralny', 40),
       ('12345678950', 'Carl Ross', NULL, '1978-05-10', '12BO', 'Khreshchatyk St', 'Pechersk', 41),
       ('12345678951', 'Evelyn Morris', NULL, '1987-06-11', '45BP', 'Rustaveli Ave', 'Mtatsminda', 42),
       ('12345678952', 'Arthur Alexander', NULL, '1965-07-12', '67BQ', 'İstiklal Caddesi', 'Beyoğlu', 43),
       ('12345678953', 'Janet Harrison', NULL, '2000-08-13', '90BR', 'Nowy Świat', 'Śródmieście', 44),
       ('12345678954', 'Philip Nelson', NULL, '1994-09-14', '12BS', 'Andrássy út', 'Terezvaros', 45),
       ('12345678955', 'Kathleen Ward', NULL, '1982-10-15', '45BT', 'Knez Mihailova', 'Stari Grad', 46),
       ('12345678956', 'Henry Ford', NULL, '1979-11-16', '67BU', 'Avinguda Diagonal', 'Eixample', 47),
       ('12345678957', 'Frances Turner', NULL, '1998-12-17', '90BV', 'Rua Augusta', 'Liberdade', 48);
