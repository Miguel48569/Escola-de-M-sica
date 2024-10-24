-- Remoção das tabelas
DROP TABLE IF EXISTS ParticipacaoSinfoniaInstrumento;
DROP TABLE IF EXISTS funcaodosmusicos;
DROP TABLE IF EXISTS instrumentos;
DROP TABLE IF EXISTS musicos;
DROP TABLE IF EXISTS sinfonias;
DROP TABLE IF EXISTS orquestras;

-- Remoção das Views
DROP VIEW IF EXISTS View_MusicosFuncoes;
DROP VIEW IF EXISTS View_SinfoniasOrquestras;
DROP VIEW IF EXISTS View_InstrumentosMusicos;
DROP VIEW IF EXISTS View_SinfoniasFuturas;
DROP VIEW IF EXISTS View_OrquestrasPopulares;
DROP VIEW IF EXISTS View_FuncoesNaoOcupadas;
DROP VIEW IF EXISTS View_ContatoMusicosOrquestra;
DROP VIEW IF EXISTS View_SinfoniasPorData;
DROP VIEW IF EXISTS View_MusicosRecentes;
DROP VIEW IF EXISTS View_ResumoParticipacoes;
DROP VIEW IF EXISTS View_InstrumentosPorMusico;



-- Desativando Chaves Estrangeiras Temporariamente
SET FOREIGN_KEY_CHECKS = 0;  -- Desabilita a verificação de dependências
SET FOREIGN_KEY_CHECKS = 1;  -- Reabilita a verificação

 -- Excluir o banco de dados por completo
DROP DATABASE IF EXISTS Escola_de_musica;






