ALTER TABLE Músicos 
ADD telefone VARCHAR(15) AFTER cpf; 

alter table Músicos
drop column telefone;

alter table orquestras
modify nomeOrquestra varchar(150);

RENAME TABLE `Função dos Músicos` TO FuncoesMusicos; 

RENAME TABLE FuncoesMusicos TO `Função dos Músicos`; 

alter table músicos
modify dataNascimento datetime;

alter table músicos
modify dataNascimento date;

alter table orquestras
add anoCriacao year after datacriacao;

alter table orquestras
drop column anoCriacao;

alter table instrumentos
add descricao text after nomeInstrumento;

alter table instrumentos
drop column descricao;

ALTER TABLE `Função dos Músicos` 
RENAME TO FuncaoDosMusicos;

ALTER TABLE FuncaoDosMusicos 
CHANGE `idFunção dos Músicos` idFuncaoDosMusicos INT PRIMARY KEY;

ALTER TABLE FuncaoDosMusicos 
CHANGE `nomeFuncao` nomeFuncao VARCHAR(100),
CHANGE `descricaoFuncao` descricaoFuncao VARCHAR(255),
CHANGE `dataInicio` dataInicio DATE,
CHANGE `dataFim` dataFim DATE,
CHANGE `Músicos_idMúsicos` Musicos_idMusicos INT,
CHANGE `Sinfonias_idSinfonias` Sinfonias_idSinfonias INT;




























