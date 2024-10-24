-- 1 Esse comando cria uma view que lista músicos com suas funções e descrições.
CREATE VIEW View_MusicosFuncoes AS
SELECT m.nome AS Musico, f.nomeFuncao AS Funcao, f.descricaoFuncao
FROM FuncaoDosMusicos f
JOIN Musicos m ON f.Musicos_idMusicos = m.idMusico;

-- 2 Esse comando cria uma view que exibe sinfonias, suas datas de criação e as orquestras associadas.
CREATE VIEW View_SinfoniasOrquestras AS
SELECT s.nomeSinfonia, s.dataCriacao, o.nomeOrquestra
FROM Sinfonias s
JOIN Orquestras o ON s.Orquestras_idOrquestras = o.idOrquestras;

-- 3 Esse comando cria uma view que relaciona músicos aos instrumentos que tocam.
CREATE VIEW View_InstrumentosMusicos AS  
SELECT m.nome AS Musico, i.nomeInstrumento  
FROM Instrumentos i  
JOIN ParticipacaoSinfoniaInstrumento p 
    ON i.idInstrumentos = p.Instrumentos_idInstrumentos  
JOIN Musicos m 
    ON p.Músicos_idMúsicos = m.idMusico;
    
-- 4 Esse comando cria uma view que lista as sinfonias cuja data de criação é futura em relação à data atual.
CREATE VIEW View_SinfoniasFuturas AS
SELECT nomeSinfonia, dataCriacao 
FROM Sinfonias 
WHERE dataCriacao > CURDATE();

-- 5 Esse comando cria uma view que exibe orquestras com mais de cinco sinfonias associadas.
CREATE VIEW View_OrquestrasPopulares AS
SELECT o.nomeOrquestra, COUNT(s.idSinfonias) AS TotalSinfonias
FROM Orquestras o
JOIN Sinfonias s ON o.idOrquestras = s.Orquestras_idOrquestras
GROUP BY o.nomeOrquestra
HAVING TotalSinfonias > 5;

-- 6 Esse comando cria uma view que lista funções que ainda não estão ocupadas por músicos.
CREATE VIEW View_FuncoesNaoOcupadas AS
SELECT nomeFuncao 
FROM FuncaoDosMusicos 
WHERE Musicos_idMusicos IS NULL;

-- 7 Esse comando cria uma view que relaciona músicos às orquestras em que atuam.
CREATE VIEW View_ContatoMusicosOrquestra AS
SELECT m.nome AS Musico, o.nomeOrquestra
FROM Musicos m
JOIN FuncaoDosMusicos f ON m.idMusico = f.Musicos_idMusicos
JOIN Sinfonias s ON f.Sinfonias_idSinfonias = s.idSinfonias
JOIN Orquestras o ON s.Orquestras_idOrquestras = o.idOrquestras;

-- 8 Esse comando cria uma view que mostra sinfonias, suas datas de criação e as orquestras associadas.
CREATE VIEW View_SinfoniasPorData AS
SELECT s.nomeSinfonia, s.dataCriacao, o.nomeOrquestra
FROM Sinfonias s
JOIN Orquestras o ON s.Orquestras_idOrquestras = o.idOrquestras;

-- 9 Esse comando cria uma view que lista músicos e as sinfonias criadas nos últimos seis meses.
CREATE VIEW View_MusicosRecentes AS
SELECT m.nome AS Musico, s.nomeSinfonia, s.dataCriacao
FROM Musicos m
JOIN FuncaoDosMusicos f ON m.idMusico = f.Musicos_idMusicos
JOIN Sinfonias s ON f.Sinfonias_idSinfonias = s.idSinfonias
WHERE s.dataCriacao >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH);

-- 10 Esse comando cria uma view que resume as participações de músicos, incluindo suas funções e as sinfonias em que atuam.
CREATE VIEW View_ResumoParticipacoes AS
SELECT 
    m.nome AS Musico, 
    s.nomeSinfonia AS Sinfonia, 
    f.nomeFuncao AS Funcao
FROM 
    Musicos m
JOIN FuncaoDosMusicos f ON m.idMusico = f.Musicos_idMusicos
JOIN Sinfonias s ON f.Sinfonias_idSinfonias = s.idSinfonias;

-- 11 Esse comando cria uma view que relaciona músicos aos instrumentos que tocam e às sinfonias em que participam.
CREATE VIEW View_InstrumentosPorMusico AS
SELECT 
    m.nome AS Musico, 
    i.nomeInstrumento AS Instrumento, 
    s.nomeSinfonia AS Sinfonia
FROM 
    Musicos m
JOIN ParticipacaoSinfoniaInstrumento p 
    ON m.idMusico = p.Músicos_idMúsicos1
JOIN Instrumentos i 
    ON p.Instrumentos_idInstrumentos = i.idInstrumentos
JOIN Sinfonias s 
    ON p.Sinfonias_idSinfonias = s.idSinfonias;























