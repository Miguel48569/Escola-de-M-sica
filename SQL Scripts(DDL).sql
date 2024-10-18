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



























