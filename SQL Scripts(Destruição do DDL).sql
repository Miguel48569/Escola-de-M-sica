-- Remoção das tabelas
drop table if exists ParticipacaoSinfoniaInstrumento;
drop table if exists funcao_dos_musicos;
DROP TABLE IF EXISTS `Função dos Músicos`;
drop table if exists instrumentos;
drop table if exists músicos;
drop table if exists orquestras;
drop table if exists sinfonias;

-- Remoção das Views
drop view if exists listamusicos;
drop view if exists sinfoniasorquestras;
drop view if exists musicosinstrumentos;

-- Desativando Chaves Estrangeiras Temporariamente
SET FOREIGN_KEY_CHECKS = 0;  -- Desabilita a verificação de dependências
SET FOREIGN_KEY_CHECKS = 1;  -- Reabilita a verificação

 -- Excluir o banco de dados por completo
DROP DATABASE IF EXISTS Escola_de_musica;







