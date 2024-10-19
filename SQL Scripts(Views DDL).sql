CREATE VIEW View_MusicosFuncoes AS
SELECT m.nome AS Musico, f.nomeFuncao AS Funcao, f.descricaoFuncao
FROM FuncaoDosMusicos f
JOIN Musicos m ON f.Musicos_idMusicos = m.idMusico;

CREATE VIEW View_SinfoniasOrquestras AS
SELECT s.nomeSinfonia, s.dataCriacao, o.nomeOrquestra
FROM Sinfonias s
JOIN Orquestras o ON s.Orquestras_idOrquestras = o.idOrquestras;

CREATE VIEW View_InstrumentosMusicos AS  
SELECT m.nome AS Musico, i.nomeInstrumento  
FROM Instrumentos i  
JOIN ParticipacaoSinfoniaInstrumento p 
    ON i.idInstrumentos = p.Instrumentos_idInstrumentos  
JOIN Musicos m 
    ON p.Músicos_idMúsicos = m.idMusico;
    
CREATE VIEW View_SinfoniasFuturas AS
SELECT nomeSinfonia, dataCriacao 
FROM Sinfonias 
WHERE dataCriacao > CURDATE();

CREATE VIEW View_OrquestrasPopulares AS
SELECT o.nomeOrquestra, COUNT(s.idSinfonias) AS TotalSinfonias
FROM Orquestras o
JOIN Sinfonias s ON o.idOrquestras = s.Orquestras_idOrquestras
GROUP BY o.nomeOrquestra
HAVING TotalSinfonias > 5;

CREATE VIEW View_FuncoesNaoOcupadas AS
SELECT nomeFuncao 
FROM FuncaoDosMusicos 
WHERE Musicos_idMusicos IS NULL;

CREATE VIEW View_ContatoMusicosOrquestra AS
SELECT m.nome AS Musico, o.nomeOrquestra
FROM Musicos m
JOIN FuncaoDosMusicos f ON m.idMusico = f.Musicos_idMusicos
JOIN Sinfonias s ON f.Sinfonias_idSinfonias = s.idSinfonias
JOIN Orquestras o ON s.Orquestras_idOrquestras = o.idOrquestras;

CREATE VIEW View_SinfoniasPorData AS
SELECT s.nomeSinfonia, s.dataCriacao, o.nomeOrquestra
FROM Sinfonias s
JOIN Orquestras o ON s.Orquestras_idOrquestras = o.idOrquestras;

CREATE VIEW View_MusicosRecentes AS
SELECT m.nome AS Musico, s.nomeSinfonia, s.dataCriacao
FROM Musicos m
JOIN FuncaoDosMusicos f ON m.idMusico = f.Musicos_idMusicos
JOIN Sinfonias s ON f.Sinfonias_idSinfonias = s.idSinfonias
WHERE s.dataCriacao >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH);

CREATE VIEW View_ResumoParticipacoes AS
SELECT 
    m.nome AS Musico, 
    s.nomeSinfonia AS Sinfonia, 
    f.nomeFuncao AS Funcao
FROM 
    Musicos m
JOIN FuncaoDosMusicos f ON m.idMusico = f.Musicos_idMusicos
JOIN Sinfonias s ON f.Sinfonias_idSinfonias = s.idSinfonias;

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























