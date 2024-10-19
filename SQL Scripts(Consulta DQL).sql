SELECT m.nome AS Musico, s.nomeSinfonia 
FROM Musicos m
JOIN FuncaoDosMusicos f ON m.idMusico = f.Musicos_idMusicos
JOIN Sinfonias s ON f.Sinfonias_idSinfonias = s.idSinfonias;

SELECT nomeFuncao, nome 
FROM Musicos m 
JOIN FuncaoDosMusicos f ON m.idMusico = f.Musicos_idMusicos
WHERE f.dataFim >= CURRENT_DATE;

SELECT o.nomeOrquestra, s.nomeSinfonia 
FROM Orquestras o 
JOIN Sinfonias s ON o.idOrquestras = s.Orquestras_idOrquestras
WHERE o.nomeOrquestra = 'Filarmônica Brasileira';

SELECT s.nomeSinfonia, COUNT(f.Musicos_idMusicos) AS TotalMusicos 
FROM Sinfonias s
JOIN FuncaoDosMusicos f ON s.idSinfonias = f.Sinfonias_idSinfonias
GROUP BY s.nomeSinfonia;

SELECT m.nome AS Musico, f.nomeFuncao, f.descricaoFuncao 
FROM FuncaoDosMusicos f 
JOIN Musicos m ON f.Musicos_idMusicos = m.idMusico;

SELECT o.nomeOrquestra, m.nome AS Maestro 
FROM Orquestras o 
JOIN FuncaoDosMusicos f ON o.idOrquestras = f.Sinfonias_idSinfonias
JOIN Musicos m ON f.Musicos_idMusicos = m.idMusico
WHERE f.nomeFuncao = 'Maestro';

SELECT nomeSinfonia 
FROM Sinfonias s 
WHERE s.idSinfonias NOT IN (
    SELECT Sinfonias_idSinfonias FROM FuncaoDosMusicos
);

SELECT Musicos_idMusicos, COUNT(Sinfonias_idSinfonias) AS TotalSinfonias 
FROM FuncaoDosMusicos
GROUP BY Musicos_idMusicos
HAVING TotalSinfonias > 1;

SELECT m.nome AS Musico, o.nomeOrquestra 
FROM Musicos m 
JOIN FuncaoDosMusicos f ON m.idMusico = f.Musicos_idMusicos
JOIN Sinfonias s ON f.Sinfonias_idSinfonias = s.idSinfonias
JOIN Orquestras o ON s.Orquestras_idOrquestras = o.idOrquestras;

SELECT m.nome AS Musico, MAX(f.dataFim) AS UltimaParticipacao 
FROM Musicos m 
JOIN FuncaoDosMusicos f ON m.idMusico = f.Musicos_idMusicos
GROUP BY m.nome;

SELECT o.nomeOrquestra, COUNT(s.idSinfonias) AS TotalSinfonias 
FROM Orquestras o
JOIN Sinfonias s ON o.idOrquestras = s.Orquestras_idOrquestras
GROUP BY o.nomeOrquestra;

SELECT nome 
FROM Musicos 
WHERE idMusico NOT IN (
    SELECT Musicos_idMusicos FROM FuncaoDosMusicos
);

SELECT Musicos_idMusicos, COUNT(nomeFuncao) AS Funcoes 
FROM FuncaoDosMusicos
GROUP BY Musicos_idMusicos
HAVING Funcoes > 1;

SELECT nomeOrquestra 
FROM Orquestras 
WHERE idOrquestras NOT IN (
    SELECT Orquestras_idOrquestras FROM Sinfonias
);

SELECT s.nomeSinfonia, m.nome AS Regente 
FROM Sinfonias s 
JOIN FuncaoDosMusicos f ON s.idSinfonias = f.Sinfonias_idSinfonias
JOIN Musicos m ON f.Musicos_idMusicos = m.idMusico
WHERE f.nomeFuncao = 'Maestro';

SELECT o.nomeOrquestra, COUNT(f.Musicos_idMusicos) AS TotalMusicos 
FROM Orquestras o 
JOIN Sinfonias s ON o.idOrquestras = s.Orquestras_idOrquestras
JOIN FuncaoDosMusicos f ON s.idSinfonias = f.Sinfonias_idSinfonias
GROUP BY o.nomeOrquestra;

SELECT m.nome, f.dataFim 
FROM Musicos m 
JOIN FuncaoDosMusicos f ON m.idMusico = f.Musicos_idMusicos
WHERE f.dataFim < '2024-01-01';

SELECT s.nomeSinfonia, COUNT(f.Musicos_idMusicos) AS TotalMusicos 
FROM Sinfonias s 
JOIN FuncaoDosMusicos f ON s.idSinfonias = f.Sinfonias_idSinfonias
GROUP BY s.nomeSinfonia
HAVING TotalMusicos > 5;

SELECT m.nome AS Musico, 
       DATEDIFF(f.dataFim, f.dataInicio) AS DuracaoDias 
FROM Musicos m 
JOIN FuncaoDosMusicos f ON m.idMusico = f.Musicos_idMusicos;

SELECT s.nomeSinfonia, s.dataCriacao 
FROM Sinfonias s 
JOIN Orquestras o ON s.Orquestras_idOrquestras = o.idOrquestras
WHERE o.nomeOrquestra = 'Orquestra Sinfônica de São Paulo';






