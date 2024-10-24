update musicos
set nome = 'Marcos de Palha'
where idMusico = 1;

UPDATE Sinfonias 
SET dataCriacao = '1802-03-18' 
WHERE idSinfonias = 3;

UPDATE FuncaoDosMusicos 
SET nomeFuncao = 'Coordenador de Ensaios' 
WHERE idFuncaoDosMusicos = 4;

-- desativei: modo safe updates (atualizações seguras) está ativado
SET SQL_SAFE_UPDATES = 0;

UPDATE funcaodosmusicos
SET descricaoFuncao = 'Responsável por ensaios e suporte adicional'
WHERE nomeFuncao = 'Maestro';

UPDATE Musicos 
SET nome = 'Gabriel Almeida'
WHERE idMusico = 3;

UPDATE Orquestras 
SET nomeOrquestra = 'Orquestra Filarmônica Nacional' 
WHERE idOrquestras = 1;

UPDATE FuncaoDosMusicos 
SET descricaoFuncao = 'Líder do grupo de percussão.' 
WHERE idFuncaoDosMusicos = 6;

UPDATE FuncaoDosMusicos 
SET dataFim = '2023-12-31'
where idFuncaoDosMusicos = 5;

UPDATE FuncaoDosMusicos 
SET nomeFuncao = 'Líder da seção de metais' 
WHERE idFuncaoDosMusicos = 5;

update funcaodosmusicos
SET descricaoFuncao = 'Acompanha outros músicos com uma guitarra'
where idFuncaoDosMusicos = 5;

UPDATE FuncaoDosMusicos 
SET dataInicio = DATE_ADD(dataInicio, INTERVAL 2 MONTH) 
WHERE idFuncaoDosMusicos = 4;

-- desativei: modo safe updates (atualizações seguras) está ativado
SET SQL_SAFE_UPDATES = 0;

UPDATE FuncaoDosMusicos 
SET dataFim = '2023-12-31';

-- ativei de volta
SET SQL_SAFE_UPDATES = 1;

UPDATE musicos 
SET nome = 'Carlos Silva'
WHERE idMusico = 8;

UPDATE FuncaoDosMusicos 
SET descricaoFuncao = 'Líder do grupo de percussão.' 
WHERE idFuncaoDosMusicos = 6;

UPDATE Sinfonias 
SET nomeSinfonia = 'Sinfonia Primavera' 
WHERE idSinfonias = 3;

UPDATE musicos 
SET nome = 'João Gabriel de Medeiros Neto' 
WHERE idMusico = 4;

-- desativei: modo safe updates (atualizações seguras) está ativado
SET SQL_SAFE_UPDATES = 0;

DELETE FROM FuncaoDosMusicos 
WHERE nomeFuncao = 'Contrabaixista';

DELETE FROM FuncaoDosMusicos 
WHERE Musicos_idMusicos = 7;

DELETE FROM Orquestras 
WHERE nomeOrquestra = 'Orquestra Sinfônica Local';

DELETE FROM Orquestras 
WHERE idOrquestras NOT IN (SELECT Orquestras_idOrquestras FROM Sinfonias);

DELETE FROM FuncaoDosMusicos 
WHERE idFuncaoDosMusicos = 5;

DELETE FROM FuncaoDosMusicos 
WHERE Musicos_idMusicos = 7;

SET SQL_SAFE_UPDATES = 1;

