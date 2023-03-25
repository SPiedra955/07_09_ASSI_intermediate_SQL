-- Postgres Script
-- Tue Mar 21 17:42:52 2023
-- Model: New Model    Version: 2.0

-- -----------------------------------------------------
-- Schema library
-- -----------------------------------------------------

SELECT 'CREATE DATABASE library' WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'library')\gexec;

-- -----------------------------------------------------
-- Table `Books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Books (
  id_book SERIAL PRIMARY KEY,
  title VARCHAR(45) NOT NULL,
  author VARCHAR(45) NOT NULL,
  category VARCHAR(45) NOT NULL CHECK (category IN ('drama', 'classic', 'history', 'children', 'didactic')),
  ISBN VARCHAR(20) NOT NULL,
  date_release DATE NOT NULL,
  gender VARCHAR(45) NOT NULL,
  availability SMALLINT NOT NULL,
  books_images BYTEA
);

-- -----------------------------------------------------
-- Table `mydb`.`Authors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Authors` (
  `id_author` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `birth_date` DATE NOT NULL,
  `nacionality` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_author`),
  UNIQUE INDEX `id_author_UNIQUE` (`id_author` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Clients` (
  `id_client` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `direcction` VARCHAR(45) NOT NULL,
  `mail` VARCHAR(45) NOT NULL,
  `number` INT NOT NULL,
  PRIMARY KEY (`id_client`),
  UNIQUE INDEX `id_client_UNIQUE` (`id_client` ASC) VISIBLE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`Provideds`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Provideds` (
  `id_provided` INT NOT NULL AUTO_INCREMENT,
  `start_date` DATE NOT NULL,
  `finish_date` DATE NOT NULL,
  `Books_id_book` INT NOT NULL,
  `Clients_id_client` INT NOT NULL,
  PRIMARY KEY (`id_provided`, `Books_id_book`, `Clients_id_client`),
  UNIQUE INDEX `id_provided_UNIQUE` (`id_provided` ASC) VISIBLE,
  INDEX `fk_Provideds_Books1_idx` (`Books_id_book` ASC) VISIBLE,
  INDEX `fk_Provideds_Clients1_idx` (`Clients_id_client` ASC) VISIBLE,
  CONSTRAINT `fk_Provideds_Books1`
    FOREIGN KEY (`Books_id_book`)
    REFERENCES `mydb`.`Books` (`id_book`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Provideds_Clients1`
    FOREIGN KEY (`Clients_id_client`)
    REFERENCES `mydb`.`Clients` (`id_client`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Employees` (
  `id_employee` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `direcction` VARCHAR(45) NOT NULL,
  `mail` VARCHAR(45) NOT NULL,
  `number` INT NOT NULL,
  `job` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_employee`),
  UNIQUE INDEX `id_employee_UNIQUE` (`id_employee` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Sells`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Sells` (
  `id_sell` INT NOT NULL AUTO_INCREMENT,
  `date_sell` DATE NOT NULL,
  `price` DOUBLE NOT NULL,
  `Books_id_book` INT NOT NULL,
  `Clients_id_client` INT NOT NULL,
  `Employees_id_employee` INT NOT NULL,
  PRIMARY KEY (`id_sell`, `Books_id_book`, `Clients_id_client`, `Employees_id_employee`),
  UNIQUE INDEX `id_sell_UNIQUE` (`id_sell` ASC) VISIBLE,
  INDEX `fk_Sells_Books1_idx` (`Books_id_book` ASC) VISIBLE,
  INDEX `fk_Sells_Clients1_idx` (`Clients_id_client` ASC) VISIBLE,
  INDEX `fk_Sells_Employees1_idx` (`Employees_id_employee` ASC) VISIBLE,
  CONSTRAINT `fk_Sells_Books1`
    FOREIGN KEY (`Books_id_book`)
    REFERENCES `mydb`.`Books` (`id_book`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sells_Clients1`
    FOREIGN KEY (`Clients_id_client`)
    REFERENCES `mydb`.`Clients` (`id_client`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sells_Employees1`
    FOREIGN KEY (`Employees_id_employee`)
    REFERENCES `mydb`.`Employees` (`id_employee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`Books_has_Authors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Books_has_Authors` (
  `Books_id_book` INT NOT NULL,
  `Authors_id_author` INT NOT NULL,
  PRIMARY KEY (`Books_id_book`, `Authors_id_author`),
  INDEX `fk_Books_has_Authors_Authors1_idx` (`Authors_id_author` ASC) VISIBLE,
  INDEX `fk_Books_has_Authors_Books_idx` (`Books_id_book` ASC) VISIBLE,
  CONSTRAINT `fk_Books_has_Authors_Books`
    FOREIGN KEY (`Books_id_book`)
    REFERENCES `mydb`.`Books` (`id_book`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Books_has_Authors_Authors1`
    FOREIGN KEY (`Authors_id_author`)
    REFERENCES `mydb`.`Authors` (`id_author`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


