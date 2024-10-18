insert into músicos (idMúsicos, nome, nacionalidade, dataNascimento, cpf) values
(1, 'Ana Clara da Silva', 'Brasileira', '1990-03-15', '123.456.789-01'),
(2, 'Carlos Eduardo Oliveira', 'Brasileiro', '1985-07-22', '234.567.890-12'),
(3, 'Fernanda Gabriela Santos', 'Brasileira', '1992-11-30', '345.678.901-23'),
(4, 'Lucas Daniel Pereira', 'Brasileiro', '1988-06-05', '456.789.012-34'),
(5, 'Juliana Maria Costa', 'Brasileira', '1993-02-18', '567.890.123-45'),
(6, 'Pedro Henrique Almeida', 'Brasileiro', '1995-08-10', '678.901.234-56'),
(7, 'Mariana Rosa Lima', 'Brasileira', '1991-09-25', '789.012.345-67'),
(8, 'Rafael Augusto Mendes', 'Brasileiro', '1987-12-12', '890.123.456-78'),
(9, 'Isabela de Oliveira Rocha', 'Brasileira', '1994-04-20', '901.234.567-89'),
(10, 'Thiago Ramos Martins', 'Brasileiro', '1989-05-15', '012.345.678-90');

INSERT INTO Orquestras (idOrquestras, nomeOrquestra, cidade, pais, dataCriacao) VALUES
(1, 'Orquestra Sinfônica Brasileira', 'São Paulo', 'Brasil', '1950-05-10'),
(2, 'Orquestra Filarmônica de Berlim', 'Berlim', 'Alemanha', '1882-06-15'),
(3, 'Orquestra Sinfônica de Nova York', 'Nova York', 'EUA', '1825-10-01'),
(4, 'Orquestra de Câmara de Londres', 'Londres', 'Reino Unido', '1947-04-20'),
(5, 'Orquestra Nacional da França', 'Paris', 'França', '1905-02-12'),
(6, 'Orquestra Sinfônica de Tóquio', 'Tóquio', 'Japão', '1911-07-01'),
(7, 'Orquestra Sinfônica de Melbourne', 'Melbourne', 'Austrália', '1906-11-15'),
(8, 'Orquestra Sinfônica de Stuttgart', 'Stuttgart', 'Alemanha', '1946-03-18'),
(9, 'Orquestra Sinfônica do Rio de Janeiro', 'Rio de Janeiro', 'Brasil', '1892-09-05'),
(10, 'Orquestra Sinfônica da Rádio Nacional', 'Viena', 'Áustria', '1920-08-01');

INSERT INTO Sinfonias (idSinfonias, nomeSinfonia, compositor, dataCriacao, Orquestras_idOrquestras) VALUES
(1, 'Sinfonia nº 5 em Dó Menor', 'Ludwig van Beethoven', '1808-12-22', 1),
(2, 'Sinfonia nº 9 em Ré Menor', 'Ludwig van Beethoven', '1824-05-07', 2),
(3, 'Sinfonia nº 40 em Sol Menor', 'Wolfgang Amadeus Mozart', '1788-07-25', 3),
(4, 'Sinfonia nº 3 em Fá Maior', 'Johannes Brahms', '1883-12-02', 4),
(5, 'Sinfonia nº 7 em Ré Maior', 'Johannes Brahms', '1883-01-31', 5),
(6, 'Sinfonia nº 1 em Ré Maior', 'Gustav Mahler', '1888-03-02', 6),
(7, 'Sinfonia nº 2 em Ré Menor', 'Dmitri Shostakovich', '1937-05-25', 7),
(8, 'Sinfonia nº 6 em Si Menor', 'Pyotr Ilyich Tchaikovsky', '1819-10-30', 8),
(9, 'Sinfonia nº 3 em Lá Menor', 'Sergei Prokofiev', '1928-03-25', 9),
(10, 'Sinfonia nº 8 em Sol Menor', 'Antonín Dvořák', '1893-04-25', 10);

INSERT INTO Instrumentos (idInstrumentos, nomeInstrumento, tipoInstrumento) VALUES
(1, 'Violino Stradivarius', 'Cordas'),
(2, 'Violoncelo de Montagnana', 'Cordas'),
(3, 'Flauta de Ouro', 'Sopro'),
(4, 'Clarinete de Buffet-Crampon', 'Sopro'),
(5, 'Trompete Benge', 'Metálico'),
(6, 'Trombone de Tenor', 'Metálico'),
(7, 'Piano de Cauda Steinway', 'Teclado'),
(8, 'Bateria DW', 'Percussão'),
(9, 'Guitarra Fender Stratocaster', 'Cordas'),
(10, 'Saxofone Selmer', 'Sopro');

INSERT INTO ParticipacaoSinfoniaInstrumento (Músicos_idMúsicos, Músicos_idMúsicos1, Instrumentos_idInstrumentos, Sinfonias_idSinfonias) VALUES
(1, 2, 1, 1),
(2, 3, 2, 2),
(3, 4, 3, 3),
(4, 5, 4, 4),
(5, 6, 5, 5),
(6, 7, 6, 6),
(7, 8, 7, 7),
(8, 9, 8, 8),
(9, 10, 9, 9),
(10, 1, 10, 10);

INSERT INTO FuncaoDosMusicos 
(idFuncaoDosMusicos, nomeFuncao, descricaoFuncao, dataInicio, dataFim, Musicos_idMusicos, Sinfonias_idSinfonias) 
VALUES
(1, 'Maestro', 'Líder da orquestra, responsável pela regência.', '2023-01-15', '2023-12-15', 1, 1),
(2, 'Solista de Violino', 'Violino em destaque nas apresentações.', '2023-02-01', '2024-01-01', 2, 2),
(3, 'Coordenador de Cordas', 'Supervisiona o grupo de instrumentos de corda.', '2023-03-01', '2024-02-28', 3, 3),
(4, 'Flautista Principal', 'Executa solos de flauta.', '2023-02-10', '2023-12-31', 4, 4),
(5, 'Pianista Acompanhador', 'Acompanha outros músicos com piano.', '2023-05-01', '2023-11-01', 5, 5),
(6, 'Percussionista', 'Especialista em instrumentos de percussão.', '2022-12-01', '2023-10-01', 6, 6),
(7, 'Clarinetista', 'Executa melodias principais com clarinete.', '2023-03-20', '2023-09-15', 7, 7),
(8, 'Contrabaixista', 'Responsável pelas partes graves da orquestra.', '2023-04-01', '2024-01-01', 8, 8),
(9, 'Trompetista', 'Líder da seção de metais.', '2023-06-15', '2023-12-20', 9, 9),
(10, 'Harpa Solo', 'Responsável pelas performances de harpa.', '2023-07-01', '2023-12-31', 10, 10);









