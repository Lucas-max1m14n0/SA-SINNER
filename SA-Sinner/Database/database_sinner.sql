-- MySQL Script generated by MySQL Workbench
-- Tue Sep 10 20:26:22 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema database_sinner
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema database_sinner
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `database_sinner` DEFAULT CHARACTER SET utf8 ;
USE `database_sinner` ;

-- -----------------------------------------------------
-- Table `database_sinner`.`tb_tipo_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `database_sinner`.`tb_tipo_usuario` (
  `id_tipo_usuario` INT NOT NULL AUTO_INCREMENT,
  `ds_tipo` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id_tipo_usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `database_sinner`.`tb_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `database_sinner`.`tb_usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `e_mail` VARCHAR(50) NOT NULL,
  `senha` VARCHAR(8) NOT NULL,
  `img` VARCHAR(100) NOT NULL,
  `tb_tipo_usuario_id_tipo_usuario1` INT NOT NULL,
  PRIMARY KEY (`id_usuario`),
  INDEX `fk_tb_usuario_tb_tipo_usuario_idx` (`tb_tipo_usuario_id_tipo_usuario1` ASC) VISIBLE,
  CONSTRAINT `fk_tb_usuario_tb_tipo_usuario`
    FOREIGN KEY (`tb_tipo_usuario_id_tipo_usuario1`)
    REFERENCES `database_sinner`.`tb_tipo_usuario` (`id_tipo_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `database_sinner`.`tb_banda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `database_sinner`.`tb_banda` (
  `id_banda` INT NOT NULL AUTO_INCREMENT,
  `dsbanda` VARCHAR(40) NOT NULL,
  `img` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_banda`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `database_sinner`.`tb_usuario_banda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `database_sinner`.`tb_usuario_banda` (
  `id_usuario_banda` INT NOT NULL AUTO_INCREMENT,
  `tb_usuario_id_usuario1` INT NOT NULL,
  `tb_banda_id_banda` INT NOT NULL,
  PRIMARY KEY (`id_usuario_banda`),
  INDEX `fk_tb_usuario_banda_tb_usuario1_idx` (`tb_usuario_id_usuario1` ASC) VISIBLE,
  INDEX `fk_tb_usuario_banda_tb_banda1_idx` (`tb_banda_id_banda` ASC) VISIBLE,
  CONSTRAINT `fk_tb_usuario_banda_tb_usuario1`
    FOREIGN KEY (`tb_usuario_id_usuario1`)
    REFERENCES `database_sinner`.`tb_usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_usuario_banda_tb_banda1`
    FOREIGN KEY (`tb_banda_id_banda`)
    REFERENCES `database_sinner`.`tb_banda` (`id_banda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `database_sinner`.`tb_album`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `database_sinner`.`tb_album` (
  `id_tb_album` INT NOT NULL AUTO_INCREMENT,
  `duracao` CHAR(8) NOT NULL,
  `ds_album` VARCHAR(30) NOT NULL,
  `img` VARCHAR(100) NOT NULL,
  `tb_banda_id_banda` INT NOT NULL,
  PRIMARY KEY (`id_tb_album`),
  INDEX `fk_tb_album_tb_banda1_idx` (`tb_banda_id_banda` ASC) VISIBLE,
  CONSTRAINT `fk_tb_album_tb_banda1`
    FOREIGN KEY (`tb_banda_id_banda`)
    REFERENCES `database_sinner`.`tb_banda` (`id_banda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `database_sinner`.`tb_genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `database_sinner`.`tb_genero` (
  `id_genero` INT NOT NULL,
  `ds_genero` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`id_genero`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `database_sinner`.`tb_musica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `database_sinner`.`tb_musica` (
  `id_musica` INT NOT NULL,
  `dsmusica` VARCHAR(30) NOT NULL,
  `duracao` CHAR(8) NOT NULL,
  `musica` VARCHAR(100) NOT NULL,
  `tb_album_id_tb_album` INT NOT NULL,
  `tb_genero_id_genero` INT NOT NULL,
  PRIMARY KEY (`id_musica`),
  INDEX `fk_tb_musica_tb_album1_idx` (`tb_album_id_tb_album` ASC) VISIBLE,
  INDEX `fk_tb_musica_tb_genero1_idx` (`tb_genero_id_genero` ASC) VISIBLE,
  CONSTRAINT `fk_tb_musica_tb_album1`
    FOREIGN KEY (`tb_album_id_tb_album`)
    REFERENCES `database_sinner`.`tb_album` (`id_tb_album`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_musica_tb_genero1`
    FOREIGN KEY (`tb_genero_id_genero`)
    REFERENCES `database_sinner`.`tb_genero` (`id_genero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `database_sinner`.`tb_noticia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `database_sinner`.`tb_noticia` (
  `id_noticia` INT NOT NULL,
  `dsnoticia` VARCHAR(50) NOT NULL,
  `conteudo` MEDIUMTEXT NOT NULL,
  `img` VARCHAR(100) NOT NULL,
  `tb_genero_id_genero` INT NOT NULL,
  PRIMARY KEY (`id_noticia`),
  INDEX `fk_tb_noticia_tb_genero1_idx` (`tb_genero_id_genero` ASC) VISIBLE,
  CONSTRAINT `fk_tb_noticia_tb_genero1`
    FOREIGN KEY (`tb_genero_id_genero`)
    REFERENCES `database_sinner`.`tb_genero` (`id_genero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
