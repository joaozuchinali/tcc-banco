-- MySQL Script generated by MySQL Workbench
-- Sat Apr 20 18:49:06 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema dbmain
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dbmain
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dbmain` DEFAULT CHARACTER SET utf8 ;
USE `dbmain` ;

-- -----------------------------------------------------
-- Table `dbmain`.`equipestatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbmain`.`equipestatus` (
  `idequipestatus` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idequipestatus`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbmain`.`equipe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbmain`.`equipe` (
  `idequipe` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `idstatus` INT NOT NULL,
  PRIMARY KEY (`idequipe`),
  INDEX `fk_equipe_equipestatus1_idx` (`idstatus` ASC) VISIBLE,
  CONSTRAINT `fk_equipe_equipestatus1`
    FOREIGN KEY (`idstatus`)
    REFERENCES `dbmain`.`equipestatus` (`idequipestatus`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbmain`.`projetostatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbmain`.`projetostatus` (
  `idprojetostatus` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idprojetostatus`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbmain`.`projeto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbmain`.`projeto` (
  `idprojeto` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  `identificador` VARCHAR(45) NOT NULL,
  `codigo` INT NOT NULL,
  `idequipe` INT NOT NULL,
  `idstatus` INT NOT NULL,
  PRIMARY KEY (`idprojeto`),
  INDEX `fk_projeto_equipe1_idx` (`idequipe` ASC) VISIBLE,
  INDEX `fk_projeto_projetostatus1_idx` (`idstatus` ASC) VISIBLE,
  CONSTRAINT `fk_projeto_equipe1`
    FOREIGN KEY (`idequipe`)
    REFERENCES `dbmain`.`equipe` (`idequipe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_projeto_projetostatus1`
    FOREIGN KEY (`idstatus`)
    REFERENCES `dbmain`.`projetostatus` (`idprojetostatus`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbmain`.`usuariostatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbmain`.`usuariostatus` (
  `idusuariostatus` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idusuariostatus`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbmain`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbmain`.`usuario` (
  `idusuario` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  `senha` VARCHAR(50) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `idstatus` INT NOT NULL,
  PRIMARY KEY (`idusuario`),
  INDEX `fk_usuario_usuariostatus1_idx` (`idstatus` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_usuariostatus1`
    FOREIGN KEY (`idstatus`)
    REFERENCES `dbmain`.`usuariostatus` (`idusuariostatus`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbmain`.`credencial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbmain`.`credencial` (
  `idcredencial` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idcredencial`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbmain`.`equipeuso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbmain`.`equipeuso` (
  `idequipeuso` INT NOT NULL AUTO_INCREMENT,
  `idcredencial` INT NOT NULL,
  `idequipe` INT NOT NULL,
  `idusuario` INT NOT NULL,
  PRIMARY KEY (`idequipeuso`),
  INDEX `fk_equipeuso_credencial1_idx` (`idcredencial` ASC) VISIBLE,
  INDEX `fk_equipeuso_equipe1_idx` (`idequipe` ASC) VISIBLE,
  INDEX `fk_equipeuso_usuario1_idx` (`idusuario` ASC) VISIBLE,
  CONSTRAINT `fk_equipeuso_credencial1`
    FOREIGN KEY (`idcredencial`)
    REFERENCES `dbmain`.`credencial` (`idcredencial`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_equipeuso_equipe1`
    FOREIGN KEY (`idequipe`)
    REFERENCES `dbmain`.`equipe` (`idequipe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_equipeuso_usuario1`
    FOREIGN KEY (`idusuario`)
    REFERENCES `dbmain`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbmain`.`usopesquisados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbmain`.`usopesquisados` (
  `idusopesquisados` INT NOT NULL AUTO_INCREMENT,
  `deviceid` VARCHAR(250) NOT NULL,
  `idprojeto` INT NOT NULL,
  PRIMARY KEY (`idusopesquisados`),
  INDEX `fk_usopesquisados_projeto1_idx` (`idprojeto` ASC) VISIBLE,
  CONSTRAINT `fk_usopesquisados_projeto1`
    FOREIGN KEY (`idprojeto`)
    REFERENCES `dbmain`.`projeto` (`idprojeto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbmain`.`registronavegacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbmain`.`registronavegacao` (
  `idregistronavegacao` INT NOT NULL AUTO_INCREMENT,
  `acesso` BIGINT NOT NULL,
  `dominio` VARCHAR(200) NOT NULL,
  `anonimo` INT NOT NULL,
  `titulo` TEXT NOT NULL,
  `url` TEXT NOT NULL,
  `favicon` TEXT NULL,
  `width` INT NOT NULL,
  `height` INT NOT NULL,
  `useragent` TEXT NOT NULL,
  `appversion` TEXT NOT NULL,
  `contype` VARCHAR(45) NOT NULL,
  `idusopesquisados` INT NOT NULL,
  `idprojeto` INT NOT NULL,
  PRIMARY KEY (`idregistronavegacao`),
  INDEX `fk_registronavegacao_usopesquisados1_idx` (`idusopesquisados` ASC) VISIBLE,
  INDEX `fk_registronavegacao_projeto1_idx` (`idprojeto` ASC) VISIBLE,
  CONSTRAINT `fk_registronavegacao_usopesquisados1`
    FOREIGN KEY (`idusopesquisados`)
    REFERENCES `dbmain`.`usopesquisados` (`idusopesquisados`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_registronavegacao_projeto1`
    FOREIGN KEY (`idprojeto`)
    REFERENCES `dbmain`.`projeto` (`idprojeto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbmain`.`tempodominio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbmain`.`tempodominio` (
  `idtempodominio` INT NOT NULL AUTO_INCREMENT,
  `tempo` INT NOT NULL,
  `dominio` VARCHAR(200) NOT NULL,
  `idusopesquisados` INT NOT NULL,
  `idprojeto` INT NOT NULL,
  PRIMARY KEY (`idtempodominio`),
  INDEX `fk_tempodominio_usopesquisados1_idx` (`idusopesquisados` ASC) VISIBLE,
  INDEX `fk_tempodominio_projeto1_idx` (`idprojeto` ASC) VISIBLE,
  CONSTRAINT `fk_tempodominio_usopesquisados1`
    FOREIGN KEY (`idusopesquisados`)
    REFERENCES `dbmain`.`usopesquisados` (`idusopesquisados`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tempodominio_projeto1`
    FOREIGN KEY (`idprojeto`)
    REFERENCES `dbmain`.`projeto` (`idprojeto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
