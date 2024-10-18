-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Escola_de_musica
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Escola_de_musica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Escola_de_musica` DEFAULT CHARACTER SET utf8 ;
USE `Escola_de_musica` ;

-- -----------------------------------------------------
-- Table `Escola_de_musica`.`Músicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Escola_de_musica`.`Músicos` (
  `idMúsicos` INT NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `nacionalidade` VARCHAR(50) NULL,
  `dataNascimento` DATE NOT NULL,
  `cpf` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`idMúsicos`),
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Escola_de_musica`.`Orquestras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Escola_de_musica`.`Orquestras` (
  `idOrquestras` INT NOT NULL,
  `nomeOrquestra` VARCHAR(100) NOT NULL,
  `cidade` VARCHAR(50) NOT NULL,
  `pais` VARCHAR(50) NOT NULL,
  `dataCriacao` DATE NOT NULL,
  PRIMARY KEY (`idOrquestras`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Escola_de_musica`.`Sinfonias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Escola_de_musica`.`Sinfonias` (
  `idSinfonias` INT NOT NULL,
  `nomeSinfonia` VARCHAR(100) NOT NULL,
  `compositor` VARCHAR(100) NOT NULL,
  `dataCriacao` DATE NOT NULL,
  `Orquestras_idOrquestras` INT NOT NULL,
  PRIMARY KEY (`idSinfonias`),
  INDEX `fk_Sinfonias_Orquestras1_idx` (`Orquestras_idOrquestras` ASC) VISIBLE,
  CONSTRAINT `fk_Sinfonias_Orquestras1`
    FOREIGN KEY (`Orquestras_idOrquestras`)
    REFERENCES `Escola_de_musica`.`Orquestras` (`idOrquestras`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Escola_de_musica`.`Instrumentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Escola_de_musica`.`Instrumentos` (
  `idInstrumentos` INT NOT NULL,
  `nomeInstrumento` VARCHAR(100) NOT NULL,
  `tipoInstrumento` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idInstrumentos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Escola_de_musica`.`Função dos Músicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Escola_de_musica`.`Função dos Músicos` (
  `idFunção dos Músicos` INT NOT NULL,
  `nomeFuncao` VARCHAR(100) NOT NULL,
  `descricaoFuncao` VARCHAR(100) NULL,
  `dataInicio` DATE NOT NULL,
  `dataFim` DATE NOT NULL,
  `Músicos_idMúsicos` INT NOT NULL,
  `Sinfonias_idSinfonias` INT NOT NULL,
  PRIMARY KEY (`idFunção dos Músicos`, `Músicos_idMúsicos`, `Sinfonias_idSinfonias`),
  INDEX `fk_Função dos Músicos_Músicos_idx` (`Músicos_idMúsicos` ASC) VISIBLE,
  INDEX `fk_Função dos Músicos_Sinfonias1_idx` (`Sinfonias_idSinfonias` ASC) VISIBLE,
  CONSTRAINT `fk_Função dos Músicos_Músicos`
    FOREIGN KEY (`Músicos_idMúsicos`)
    REFERENCES `Escola_de_musica`.`Músicos` (`idMúsicos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Função dos Músicos_Sinfonias1`
    FOREIGN KEY (`Sinfonias_idSinfonias`)
    REFERENCES `Escola_de_musica`.`Sinfonias` (`idSinfonias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Escola_de_musica`.`ParticipacaoSinfoniaInstrumento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Escola_de_musica`.`ParticipacaoSinfoniaInstrumento` (
  `Músicos_idMúsicos` INT NOT NULL,
  `Músicos_idMúsicos1` INT NOT NULL,
  `Instrumentos_idInstrumentos` INT NOT NULL,
  `Sinfonias_idSinfonias` INT NOT NULL,
  PRIMARY KEY (`Músicos_idMúsicos`),
  INDEX `fk_ParticipacaoSinfoniaInstrumento_Músicos1_idx` (`Músicos_idMúsicos1` ASC) VISIBLE,
  INDEX `fk_ParticipacaoSinfoniaInstrumento_Instrumentos1_idx` (`Instrumentos_idInstrumentos` ASC) VISIBLE,
  INDEX `fk_ParticipacaoSinfoniaInstrumento_Sinfonias1_idx` (`Sinfonias_idSinfonias` ASC) VISIBLE,
  CONSTRAINT `fk_ParticipacaoSinfoniaInstrumento_Músicos1`
    FOREIGN KEY (`Músicos_idMúsicos1`)
    REFERENCES `Escola_de_musica`.`Músicos` (`idMúsicos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ParticipacaoSinfoniaInstrumento_Instrumentos1`
    FOREIGN KEY (`Instrumentos_idInstrumentos`)
    REFERENCES `Escola_de_musica`.`Instrumentos` (`idInstrumentos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ParticipacaoSinfoniaInstrumento_Sinfonias1`
    FOREIGN KEY (`Sinfonias_idSinfonias`)
    REFERENCES `Escola_de_musica`.`Sinfonias` (`idSinfonias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- View: Listar todos os músicos e suas nacionalidades
CREATE VIEW ListaMusicos AS
SELECT idMúsicos, nome, nacionalidade FROM Músicos;

-- View: Listar sinfonias e suas respectivas orquestras
CREATE VIEW SinfoniasOrquestras AS
SELECT S.nomeSinfonia, O.nomeOrquestra
FROM Sinfonias S
JOIN Orquestras O ON S.Orquestras_idOrquestras = O.idOrquestras;

-- View: Músicos e os instrumentos que tocam em sinfonias
CREATE VIEW MusicosInstrumentos AS
SELECT M.nome AS Musico, I.nomeInstrumento AS Instrumento, S.nomeSinfonia AS Sinfonia
FROM ParticipacaoSinfoniaInstrumento P
JOIN Músicos M ON P.Músicos_idMúsicos = M.idMúsicos
JOIN Instrumentos I ON P.Instrumentos_idInstrumentos = I.idInstrumentos
JOIN Sinfonias S ON P.Sinfonias_idSinfonias = S.idSinfonias;

























