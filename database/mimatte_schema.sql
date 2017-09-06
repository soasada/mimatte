-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mimatte_db
-- -----------------------------------------------------

DROP SCHEMA IF EXISTS `mimatte_db`;

-- -----------------------------------------------------
-- Schema mimatte_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mimatte_db` DEFAULT CHARACTER SET utf8 ;
USE `mimatte_db` ;

-- -----------------------------------------------------
-- Table `mimatte_db`.`treatment_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mimatte_db`.`treatment_category` ;

CREATE TABLE IF NOT EXISTS `mimatte_db`.`treatment_category` (
  `id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(3) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `deleted_at` TIMESTAMP NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `code_UNIQUE` (`code` ASC))
  ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mimatte_db`.`treatment_sub_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mimatte_db`.`treatment_sub_category` ;

CREATE TABLE IF NOT EXISTS `mimatte_db`.`treatment_sub_category` (
  `id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(3) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `treatment_category_id` TINYINT UNSIGNED NOT NULL,
  `deleted_at` TIMESTAMP NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `code_UNIQUE` (`code` ASC),
  INDEX `fk_treatment_sub_category_treatment_category1_idx` (`treatment_category_id` ASC),
  CONSTRAINT `fk_treatment_sub_category_treatment_category1`
  FOREIGN KEY (`treatment_category_id`)
  REFERENCES `mimatte_db`.`treatment_category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
  ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mimatte_db`.`treatment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mimatte_db`.`treatment` ;

CREATE TABLE IF NOT EXISTS `mimatte_db`.`treatment` (
  `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `description` BLOB NULL,
  `base_price` DECIMAL(7,2) NOT NULL,
  `duration` TINYINT NOT NULL,
  `treatment_sub_category_id` TINYINT UNSIGNED NOT NULL,
  `deleted_at` TIMESTAMP NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_treatment_treatment_sub_category1_idx` (`treatment_sub_category_id` ASC),
  CONSTRAINT `fk_treatment_treatment_sub_category1`
  FOREIGN KEY (`treatment_sub_category_id`)
  REFERENCES `mimatte_db`.`treatment_sub_category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
  ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mimatte_db`.`customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mimatte_db`.`customer` ;

CREATE TABLE IF NOT EXISTS `mimatte_db`.`customer` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(150) NOT NULL,
  `surname` VARCHAR(150) NOT NULL,
  `birth_date` DATE NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `digest` VARCHAR(255) NOT NULL,
  `address` VARCHAR(255) NULL,
  `deleted_at` TIMESTAMP NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
  ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mimatte_db`.`appointment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mimatte_db`.`appointment` ;

CREATE TABLE IF NOT EXISTS `mimatte_db`.`appointment` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` INT UNSIGNED NOT NULL,
  `treatment_id` SMALLINT UNSIGNED NOT NULL,
  `selected_datetime` DATETIME NOT NULL,
  `deleted_at` TIMESTAMP NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_appointment_customer1_idx` (`customer_id` ASC),
  INDEX `fk_appointment_treatment1_idx` (`treatment_id` ASC),
  CONSTRAINT `fk_appointment_customer1`
  FOREIGN KEY (`customer_id`)
  REFERENCES `mimatte_db`.`customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_appointment_treatment1`
  FOREIGN KEY (`treatment_id`)
  REFERENCES `mimatte_db`.`treatment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
  ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mimatte_db`.`accepted_appointment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mimatte_db`.`accepted_appointment` ;

CREATE TABLE IF NOT EXISTS `mimatte_db`.`accepted_appointment` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `appointment_id` INT UNSIGNED NOT NULL,
  `deleted_at` TIMESTAMP NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_accepted_appointment_appointment1_idx` (`appointment_id` ASC),
  CONSTRAINT `fk_accepted_appointment_appointment1`
  FOREIGN KEY (`appointment_id`)
  REFERENCES `mimatte_db`.`appointment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
  ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mimatte_db`.`rejected_appointment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mimatte_db`.`rejected_appointment` ;

CREATE TABLE IF NOT EXISTS `mimatte_db`.`rejected_appointment` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `appointment_id` INT UNSIGNED NOT NULL,
  `reason` BLOB NULL,
  `deleted_at` TIMESTAMP NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_rejected_appointment_appointment1_idx` (`appointment_id` ASC),
  CONSTRAINT `fk_rejected_appointment_appointment1`
  FOREIGN KEY (`appointment_id`)
  REFERENCES `mimatte_db`.`appointment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
  ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mimatte_db`.`admin`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mimatte_db`.`admin` ;

CREATE TABLE IF NOT EXISTS `mimatte_db`.`admin` (
  `id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(150) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `digest` VARCHAR(255) NOT NULL,
  `deleted_at` TIMESTAMP NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
  ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
