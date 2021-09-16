-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema m06e03-entrega
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema m06e03-entrega
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `m06e03-entrega` DEFAULT CHARACTER SET utf8 ;
USE `m06e03-entrega` ;

-- -----------------------------------------------------
-- Table `m06e03-entrega`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `m06e03-entrega`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `m06e03-entrega`.`notes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `m06e03-entrega`.`notes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `createdAt` INT NULL,
  `updatedAt` INT NULL,
  `description` LONGTEXT NOT NULL,
  `users_id` INT NOT NULL,
  PRIMARY KEY (`id`, `users_id`),
  INDEX `fk_notes_users_idx` (`users_id` ASC) VISIBLE,
  CONSTRAINT `fk_notes_users`
    FOREIGN KEY (`users_id`)
    REFERENCES `m06e03-entrega`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `m06e03-entrega`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `m06e03-entrega`.`categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `m06e03-entrega`.`notes_has_categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `m06e03-entrega`.`notes_has_categories` (
  `notes_id` INT NOT NULL,
  `notes_users_id` INT NOT NULL,
  `categories_id` INT NOT NULL,
  PRIMARY KEY (`notes_id`, `notes_users_id`, `categories_id`),
  INDEX `fk_notes_has_categories_categories1_idx` (`categories_id` ASC) VISIBLE,
  INDEX `fk_notes_has_categories_notes1_idx` (`notes_id` ASC, `notes_users_id` ASC) VISIBLE,
  CONSTRAINT `fk_notes_has_categories_notes1`
    FOREIGN KEY (`notes_id` , `notes_users_id`)
    REFERENCES `m06e03-entrega`.`notes` (`id` , `users_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_notes_has_categories_categories1`
    FOREIGN KEY (`categories_id`)
    REFERENCES `m06e03-entrega`.`categories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
