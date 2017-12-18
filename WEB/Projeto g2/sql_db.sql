-- MySQL Workbench Synchronization
-- Generated: 2017-12-06 22:50
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: rapha

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE TABLE IF NOT EXISTS `db_g2_web_teste`.`arquivo` (
  `idArquivo` INT(11) NOT NULL AUTO_INCREMENT,
  `url` BLOB NOT NULL,
  PRIMARY KEY (`idArquivo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `db_g2_web_teste`.`comentario` (
  `idComentario` INT(11) NOT NULL AUTO_INCREMENT,
  `texto` TEXT NOT NULL,
  `codPost` INT(11) NOT NULL,
  `codUsuario` INT(11) NOT NULL,
  PRIMARY KEY (`idComentario`),
  INDEX `fk_Comentario_Post1_idx` (`codPost` ASC),
  INDEX `fk_comentario_usuario1_idx` (`codUsuario` ASC),
  CONSTRAINT `fk_Comentario_Post1`
    FOREIGN KEY (`codPost`)
    REFERENCES `db_g2_web_teste`.`post` (`idPost`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comentario_usuario1`
    FOREIGN KEY (`codUsuario`)
    REFERENCES `db_g2_web_teste`.`usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 23
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `db_g2_web_teste`.`post` (
  `idPost` INT(11) NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NULL DEFAULT NULL,
  `descricao` VARCHAR(45) NULL DEFAULT NULL,
  `codUsuario` INT(11) NOT NULL,
  `codSala` INT(11) NOT NULL,
  `imagemBase` BLOB NULL DEFAULT NULL,
  PRIMARY KEY (`idPost`),
  INDEX `fk_Post_Usuario1_idx` (`codUsuario` ASC),
  INDEX `fk_Post_Sala1_idx` (`codSala` ASC),
  CONSTRAINT `fk_Post_Sala1`
    FOREIGN KEY (`codSala`)
    REFERENCES `db_g2_web_teste`.`sala` (`idSala`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Post_Usuario1`
    FOREIGN KEY (`codUsuario`)
    REFERENCES `db_g2_web_teste`.`usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 22
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `db_g2_web_teste`.`sala` (
  `idSala` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idSala`))
ENGINE = InnoDB
AUTO_INCREMENT = 47
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `db_g2_web_teste`.`salatousuario` (
  `codSala` INT(11) NOT NULL,
  `codUsuario` INT(11) NOT NULL,
  PRIMARY KEY (`codSala`, `codUsuario`),
  INDEX `fk_Sala_has_Usuario_Usuario1_idx` (`codUsuario` ASC),
  INDEX `fk_Sala_has_Usuario_Sala_idx` (`codSala` ASC),
  CONSTRAINT `fk_Sala_has_Usuario_Sala`
    FOREIGN KEY (`codSala`)
    REFERENCES `db_g2_web_teste`.`sala` (`idSala`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sala_has_Usuario_Usuario1`
    FOREIGN KEY (`codUsuario`)
    REFERENCES `db_g2_web_teste`.`usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `db_g2_web_teste`.`usuario` (
  `idUsuario` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  `idade` INT(11) NULL DEFAULT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
