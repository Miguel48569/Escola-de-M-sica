-- 1 musicos e sinfonia de cada musico
SELECT m.nome AS Musico, s.nomeSinfonia 
FROM Musicos m
JOIN FuncaoDosMusicos f ON m.idMusico = f.Musicos_idMusicos
JOIN Sinfonias s ON f.Sinfonias_idSinfonias = s.idSinfonias;

-- 2 função dos musicos e seu nome que estejam ativos
SELECT nomeFuncao, nome 
FROM Musicos m 
JOIN FuncaoDosMusicos f ON m.idMusico = f.Musicos_idMusicos
WHERE f.dataFim >= CURRENT_DATE;

-- 3 listar as sinfonias executadas por uma orquestra específica chamada "Filarmônica Brasileira
SELECT o.nomeOrquestra, s.nomeSinfonia 
FROM Orquestras o 
JOIN Sinfonias s ON o.idOrquestras = s.Orquestras_idOrquestras
WHERE o.nomeOrquestra = 'Filarmônica Brasileira';

-- 4 nome da sinfonia e quantidade de musicos nessa sinfonia
SELECT s.nomeSinfonia, COUNT(f.Musicos_idMusicos) AS TotalMusicos 
FROM Sinfonias s
JOIN FuncaoDosMusicos f ON s.idSinfonias = f.Sinfonias_idSinfonias
GROUP BY s.nomeSinfonia;

-- 5 nome do musico sua função e descrição dessa função
SELECT m.nome AS Musico, f.nomeFuncao, f.descricaoFuncao 
FROM FuncaoDosMusicos f 
JOIN Musicos m ON f.Musicos_idMusicos = m.idMusico;

-- 6 listar as orquestras e os músicos que atuam como maestro em cada uma delas.
SELECT o.nomeOrquestra, m.nome AS Maestro 
FROM Orquestras o 
JOIN FuncaoDosMusicos f ON o.idOrquestras = f.Sinfonias_idSinfonias
JOIN Musicos m ON f.Musicos_idMusicos = m.idMusico
WHERE f.nomeFuncao = 'Maestro';

-- 7 sinfonias que não possuem nenhum músico associado a elas.
SELECT nomeSinfonia 
FROM Sinfonias s 
WHERE s.idSinfonias NOT IN (
    SELECT Sinfonias_idSinfonias FROM FuncaoDosMusicos
);

-- 8 istar os músicos que participaram de mais de uma sinfonia, assim como o total de sinfonias em que cada um esteve envolvido.
SELECT Musicos_idMusicos, COUNT(Sinfonias_idSinfonias) AS TotalSinfonias 
FROM FuncaoDosMusicos
GROUP BY Musicos_idMusicos
HAVING TotalSinfonias > 1;

--  9 listar o nome de cada músico junto com o nome da orquestra em que ele está participando, considerando as funções que os músicos desempenham nas sinfonias.
SELECT m.nome AS Musico, o.nomeOrquestra 
FROM Musicos m 
JOIN FuncaoDosMusicos f ON m.idMusico = f.Musicos_idMusicos
JOIN Sinfonias s ON f.Sinfonias_idSinfonias = s.idSinfonias
JOIN Orquestras o ON s.Orquestras_idOrquestras = o.idOrquestras;

-- 10 ultima participação de um musico em sua função.
SELECT m.nome AS Musico, MAX(f.dataFim) AS UltimaParticipacao 
FROM Musicos m 
JOIN FuncaoDosMusicos f ON m.idMusico = f.Musicos_idMusicos
GROUP BY m.nome;

-- 11 nome da orquestra e seu total de sinfonias
SELECT o.nomeOrquestra, COUNT(s.idSinfonias) AS TotalSinfonias 
FROM Orquestras o
JOIN Sinfonias s ON o.idOrquestras = s.Orquestras_idOrquestras
GROUP BY o.nomeOrquestra;

-- 12 musicos que estão sem função.
SELECT nome 
FROM Musicos 
WHERE idMusico NOT IN (
    SELECT Musicos_idMusicos FROM FuncaoDosMusicos
);

-- 13 Essa consulta conta quantas funções cada músico tem e retorna apenas aqueles que possuem mais de uma função registrada.
SELECT Musicos_idMusicos, COUNT(nomeFuncao) AS Funcoes 
FROM FuncaoDosMusicos
GROUP BY Musicos_idMusicos
HAVING Funcoes > 1;

-- 14 Essa consulta retorna os nomes das orquestras que não têm registros na tabela Sinfonias, ou seja, orquestras que ainda não participaram de nenhuma sinfonia.
SELECT nomeOrquestra 
FROM Orquestras 
WHERE idOrquestras NOT IN (
    SELECT Orquestras_idOrquestras FROM Sinfonias
);

-- 15 Essa consulta seleciona o nome das sinfonias e o nome do regente associado a cada uma, mostrando apenas os músicos que atuam como "Maestro".
SELECT s.nomeSinfonia, m.nome AS Regente 
FROM Sinfonias s 
JOIN FuncaoDosMusicos f ON s.idSinfonias = f.Sinfonias_idSinfonias
JOIN Musicos m ON f.Musicos_idMusicos = m.idMusico
WHERE f.nomeFuncao = 'Maestro';

-- 16 Essa consulta retorna o nome das orquestras e a contagem total de músicos associados a cada uma, agrupando os resultados por orquestra.
SELECT o.nomeOrquestra, COUNT(f.Musicos_idMusicos) AS TotalMusicos 
FROM Orquestras o 
JOIN Sinfonias s ON o.idOrquestras = s.Orquestras_idOrquestras
JOIN FuncaoDosMusicos f ON s.idSinfonias = f.Sinfonias_idSinfonias
GROUP BY o.nomeOrquestra;

-- 17 Essa consulta seleciona os nomes dos músicos e as datas de término de suas funções, mostrando apenas aqueles cujas funções terminaram antes de 1º de janeiro de 2024.
SELECT m.nome, f.dataFim 
FROM Musicos m 
JOIN FuncaoDosMusicos f ON m.idMusico = f.Musicos_idMusicos
WHERE f.dataFim < '2024-01-01';

-- 18 Essa consulta retorna os nomes das sinfonias e a contagem total de músicos associados a cada uma, filtrando para mostrar apenas aquelas que têm mais de cinco músicos.
SELECT s.nomeSinfonia, COUNT(f.Musicos_idMusicos) AS TotalMusicos 
FROM Sinfonias s 
JOIN FuncaoDosMusicos f ON s.idSinfonias = f.Sinfonias_idSinfonias
GROUP BY s.nomeSinfonia
HAVING TotalMusicos > 5;

-- 19 Essa consulta seleciona o nome dos músicos e a duração em dias de suas funções, calculando a diferença entre as datas de início e término de cada função.
SELECT m.nome AS Musico, 
       DATEDIFF(f.dataFim, f.dataInicio) AS DuracaoDias 
FROM Musicos m 
JOIN FuncaoDosMusicos f ON m.idMusico = f.Musicos_idMusicos;

-- 20 Essa consulta retorna os nomes e as datas de criação das sinfonias associadas à "Orquestra Sinfônica de São Paulo".
SELECT s.nomeSinfonia, s.dataCriacao 
FROM Sinfonias s 
JOIN Orquestras o ON s.Orquestras_idOrquestras = o.idOrquestras
WHERE o.nomeOrquestra = 'Orquestra Sinfônica de São Paulo';






