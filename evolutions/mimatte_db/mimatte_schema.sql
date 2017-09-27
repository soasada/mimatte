-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema mimatte_db
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mimatte_db` ;

-- -----------------------------------------------------
-- Schema mimatte_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mimatte_db` DEFAULT CHARACTER SET utf8 ;
USE `mimatte_db` ;

-- -----------------------------------------------------
-- Table `mimatte_db`.`customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mimatte_db`.`customer` ;

CREATE TABLE IF NOT EXISTS `mimatte_db`.`customer` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(150) NOT NULL,
  `surname` VARCHAR(150) NOT NULL,
  `birth_date` DATE NOT NULL,
  `email` VARCHAR(1000) NOT NULL,
  `digest` VARCHAR(150) NOT NULL,
  `address` VARCHAR(255) NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mimatte_db`.`product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mimatte_db`.`product` ;

CREATE TABLE IF NOT EXISTS `mimatte_db`.`product` (
  `id` SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `code` VARCHAR(4) NOT NULL,
  `description` BLOB NULL DEFAULT NULL,
  `base_price` DECIMAL(7,2) NOT NULL,
  `duration` TINYINT(4) UNSIGNED NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `code_UNIQUE` (`code` ASC))
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mimatte_db`.`appointment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mimatte_db`.`appointment` ;

CREATE TABLE IF NOT EXISTS `mimatte_db`.`appointment` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` INT(10) UNSIGNED NOT NULL,
  `product_id` SMALLINT(5) UNSIGNED NOT NULL,
  `selected_datetime` DATETIME NOT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_appointment_customer1_idx` (`customer_id` ASC),
  INDEX `fk_appointment_treatment1_idx` (`product_id` ASC),
  CONSTRAINT `fk_appointment_customer1`
  FOREIGN KEY (`customer_id`)
  REFERENCES `mimatte_db`.`customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_appointment_treatment1`
  FOREIGN KEY (`product_id`)
  REFERENCES `mimatte_db`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mimatte_db`.`accepted_appointment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mimatte_db`.`accepted_appointment` ;

CREATE TABLE IF NOT EXISTS `mimatte_db`.`accepted_appointment` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `appointment_id` INT(10) UNSIGNED NOT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_accepted_appointment_appointment1_idx` (`appointment_id` ASC),
  CONSTRAINT `fk_accepted_appointment_appointment1`
  FOREIGN KEY (`appointment_id`)
  REFERENCES `mimatte_db`.`appointment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mimatte_db`.`rejected_appointment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mimatte_db`.`rejected_appointment` ;

CREATE TABLE IF NOT EXISTS `mimatte_db`.`rejected_appointment` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `appointment_id` INT(10) UNSIGNED NOT NULL,
  `reason` BLOB NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_rejected_appointment_appointment1_idx` (`appointment_id` ASC),
  CONSTRAINT `fk_rejected_appointment_appointment1`
  FOREIGN KEY (`appointment_id`)
  REFERENCES `mimatte_db`.`appointment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mimatte_db`.`tag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mimatte_db`.`tag` ;

CREATE TABLE IF NOT EXISTS `mimatte_db`.`tag` (
  `id` SMALLINT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mimatte_db`.`product_has_tag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mimatte_db`.`product_has_tag` ;

CREATE TABLE IF NOT EXISTS `mimatte_db`.`product_has_tag` (
  `product_id` SMALLINT(5) UNSIGNED NOT NULL,
  `tag_id` SMALLINT(3) UNSIGNED NOT NULL,
  PRIMARY KEY (`product_id`, `tag_id`),
  INDEX `fk_product_has_tag_tag1_idx` (`tag_id` ASC),
  INDEX `fk_product_has_tag_product1_idx` (`product_id` ASC),
  CONSTRAINT `fk_product_has_tag_product1`
  FOREIGN KEY (`product_id`)
  REFERENCES `mimatte_db`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_has_tag_tag1`
  FOREIGN KEY (`tag_id`)
  REFERENCES `mimatte_db`.`tag` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mimatte_db`.`admin`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mimatte_db`.`admin` ;

CREATE TABLE IF NOT EXISTS `mimatte_db`.`admin` (
  `id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(150) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `digest` VARCHAR(150) NOT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
  ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
