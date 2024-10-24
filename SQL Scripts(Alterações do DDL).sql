ALTER TABLE Músicos 
ADD telefone VARCHAR(15) AFTER cpf; 

alter table Músicos
drop column telefone;

alter table orquestras
modify nomeOrquestra varchar(150);

RENAME TABLE `Função dos Músicos` TO FuncaoDosMusicos; 

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

DROP TABLE IF EXISTS FuncaoDosMusicos;

CREATE TABLE FuncaoDosMusicos (
    idFuncaoDosMusicos INT PRIMARY KEY,
    nomeFuncao VARCHAR(100),
    descricaoFuncao VARCHAR(255),
    dataInicio DATE,
    dataFim DATE,
    Musicos_idMusicos INT,
    Sinfonias_idSinfonias INT
);

   
alter table músicos
rename column idMúsicos to idMusico

rename table músicos to Musicos



























