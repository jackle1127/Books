-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema gsuBooks
-- -----------------------------------------------------

DROP SCHEMA IF EXISTS `gsuBooks` ;

-- -----------------------------------------------------
-- Schema gsuBooks
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `gsuBooks` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `gsuBooks` ;

-- -----------------------------------------------------
-- Table `gsuBooks`.`Users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gsuBooks`.`Users` ;

CREATE TABLE IF NOT EXISTS `gsuBooks`.`Users` (
  `id` INT NOT NULL AUTO_INCREMENT  ,
  `firstname` VARCHAR(100) NOT NULL  ,
  `lastname` VARCHAR(100) NOT NULL  ,
  `username` VARCHAR(40) NOT NULL  ,
  `password` VARCHAR(100) NOT NULL  ,
  PRIMARY KEY (`id`)   )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gsuBooks`.`Books`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gsuBooks`.`Books` ;

CREATE TABLE IF NOT EXISTS `gsuBooks`.`Books` (
  `id` INT NOT NULL AUTO_INCREMENT  ,
  `title` VARCHAR(200) NOT NULL  ,
  `isbn` INT(13) NOT NULL  ,
  `authors` VARCHAR(200) NOT NULL  ,
  PRIMARY KEY (`id`)   )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gsuBooks`.`Bookmarket`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gsuBooks`.`Bookmarket` ;

CREATE TABLE IF NOT EXISTS `gsuBooks`.`Bookmarket` (
  `id` INT NOT NULL AUTO_INCREMENT  ,
  `imageurl` VARCHAR(100) NOT NULL  ,
  `condition` VARCHAR(45) NOT NULL  ,
  `Price` INT NOT NULL  ,
  `bookid` INT NOT NULL  ,
  `userid` INT NOT NULL  ,
  PRIMARY KEY (`id`)   ,
  INDEX `fkbookid_idx` (`bookid` ASC)   ,
  INDEX `fkuserid_idx` (`userid` ASC)   ,
  CONSTRAINT `fkbookid`
    FOREIGN KEY (`bookid`)
    REFERENCES `gsuBooks`.`Books` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fkuserid`
    FOREIGN KEY (`userid`)
    REFERENCES `gsuBooks`.`Users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gsuBooks`.`Userwishlist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gsuBooks`.`Userwishlist` ;

CREATE TABLE IF NOT EXISTS `gsuBooks`.`Userwishlist` (
  `id` INT NOT NULL AUTO_INCREMENT  ,
  `userid` INT NOT NULL  ,
  `bookid` INT NOT NULL  ,
  PRIMARY KEY (`id`)   ,
  INDEX `fkwishlistuser_idx` (`userid` ASC)   ,
  INDEX `fkwishlistbook_idx` (`bookid` ASC)   ,
  CONSTRAINT `fkwishlistuser`
    FOREIGN KEY (`userid`)
    REFERENCES `gsuBooks`.`Users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fkwishlistbook`
    FOREIGN KEY (`bookid`)
    REFERENCES `gsuBooks`.`Books` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS ;