-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mimatte_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mimatte_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mimatte_db` DEFAULT CHARACTER SET utf8 ;
USE `mimatte_db` ;

-- -----------------------------------------------------
-- Table `mimatte_db`.`facial_treatment_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mimatte_db`.`facial_treatment_type` ;

CREATE TABLE IF NOT EXISTS `mimatte_db`.`facial_treatment_type` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(6) NOT NULL,
  `name` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `code_UNIQUE` (`code` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mimatte_db`.`treatment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mimatte_db`.`treatment` ;

CREATE TABLE IF NOT EXISTS `mimatte_db`.`treatment` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `description` BLOB NULL,
  `base_price` DECIMAL(7,2) NOT NULL,
  `duration` TINYINT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mimatte_db`.`facial_treatment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mimatte_db`.`facial_treatment` ;

CREATE TABLE IF NOT EXISTS `mimatte_db`.`facial_treatment` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `facial_treatment_type_id` INT UNSIGNED NOT NULL,
  `treatment_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_facial_treatment_facial_treatment_type_idx` (`facial_treatment_type_id` ASC),
  INDEX `fk_facial_treatment_treatment1_idx` (`treatment_id` ASC),
  CONSTRAINT `fk_facial_treatment_facial_treatment_type`
    FOREIGN KEY (`facial_treatment_type_id`)
    REFERENCES `mimatte_db`.`facial_treatment_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_facial_treatment_treatment1`
    FOREIGN KEY (`treatment_id`)
    REFERENCES `mimatte_db`.`treatment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mimatte_db`.`body_treatment_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mimatte_db`.`body_treatment_type` ;

CREATE TABLE IF NOT EXISTS `mimatte_db`.`body_treatment_type` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(6) NOT NULL,
  `name` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `code_UNIQUE` (`code` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mimatte_db`.`body_treatment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mimatte_db`.`body_treatment` ;

CREATE TABLE IF NOT EXISTS `mimatte_db`.`body_treatment` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `body_treatment_type_id` INT UNSIGNED NOT NULL,
  `treatment_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_body_treatment_body_treatment_type1_idx` (`body_treatment_type_id` ASC),
  INDEX `fk_body_treatment_treatment1_idx` (`treatment_id` ASC),
  CONSTRAINT `fk_body_treatment_body_treatment_type1`
    FOREIGN KEY (`body_treatment_type_id`)
    REFERENCES `mimatte_db`.`body_treatment_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_body_treatment_treatment1`
    FOREIGN KEY (`treatment_id`)
    REFERENCES `mimatte_db`.`treatment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mimatte_db`.`waxing_treatment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mimatte_db`.`waxing_treatment` ;

CREATE TABLE IF NOT EXISTS `mimatte_db`.`waxing_treatment` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `treatment_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_waxing_treatment_treatment1_idx` (`treatment_id` ASC),
  CONSTRAINT `fk_waxing_treatment_treatment1`
    FOREIGN KEY (`treatment_id`)
    REFERENCES `mimatte_db`.`treatment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mimatte_db`.`other_treatment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mimatte_db`.`other_treatment` ;

CREATE TABLE IF NOT EXISTS `mimatte_db`.`other_treatment` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `treatment_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_other_treatment_treatment1_idx` (`treatment_id` ASC),
  CONSTRAINT `fk_other_treatment_treatment1`
    FOREIGN KEY (`treatment_id`)
    REFERENCES `mimatte_db`.`treatment` (`id`)
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
  `address` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mimatte_db`.`hour`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mimatte_db`.`hour` ;

CREATE TABLE IF NOT EXISTS `mimatte_db`.`hour` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `start_time` TIME NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `start_time_UNIQUE` (`start_time` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mimatte_db`.`day`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mimatte_db`.`day` ;

CREATE TABLE IF NOT EXISTS `mimatte_db`.`day` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(3) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `code_UNIQUE` (`code` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mimatte_db`.`month`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mimatte_db`.`month` ;

CREATE TABLE IF NOT EXISTS `mimatte_db`.`month` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(3) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `code_UNIQUE` (`code` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mimatte_db`.`appointment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mimatte_db`.`appointment` ;

CREATE TABLE IF NOT EXISTS `mimatte_db`.`appointment` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `hour_id` INT UNSIGNED NOT NULL,
  `day_id` INT UNSIGNED NOT NULL,
  `month_id` INT UNSIGNED NOT NULL,
  `customer_id` INT UNSIGNED NOT NULL,
  `treatment_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_appointment_hour1_idx` (`hour_id` ASC),
  INDEX `fk_appointment_day1_idx` (`day_id` ASC),
  INDEX `fk_appointment_month1_idx` (`month_id` ASC),
  INDEX `fk_appointment_customer1_idx` (`customer_id` ASC),
  INDEX `fk_appointment_treatment1_idx` (`treatment_id` ASC),
  CONSTRAINT `fk_appointment_hour1`
    FOREIGN KEY (`hour_id`)
    REFERENCES `mimatte_db`.`hour` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_appointment_day1`
    FOREIGN KEY (`day_id`)
    REFERENCES `mimatte_db`.`day` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_appointment_month1`
    FOREIGN KEY (`month_id`)
    REFERENCES `mimatte_db`.`month` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
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
  PRIMARY KEY (`id`),
  INDEX `fk_rejected_appointment_appointment1_idx` (`appointment_id` ASC),
  CONSTRAINT `fk_rejected_appointment_appointment1`
    FOREIGN KEY (`appointment_id`)
    REFERENCES `mimatte_db`.`appointment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
