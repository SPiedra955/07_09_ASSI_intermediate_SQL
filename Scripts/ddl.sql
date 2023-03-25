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
-- Table `Authors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Authors (
  id_author SERIAL PRIMARY KEY,
  name VARCHAR(45) NOT NULL,
  birth_date DATE NOT NULL,
  nationality VARCHAR(45) NOT NULL
);

-- -----------------------------------------------------
-- Table `Clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Clients (
    id_client SERIAL PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    direction VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL,
    number INT NOT NULL,
    CONSTRAINT id_client_UNIQUE UNIQUE (id_client)
) WITH (oids = false);

-- -----------------------------------------------------
-- Table `Provideds`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Provideds (
id_provided SERIAL PRIMARY KEY,
start_date_loan DATE NOT NULL,
finish_date_loan DATE NOT NULL,
books_id_book INT NOT NULL,
clients_id_client INT NOT NULL,
CONSTRAINT fk_Provideds_Books1 FOREIGN KEY (books_id_book)
REFERENCES Books (id_book)
ON DELETE CASCADE
ON UPDATE CASCADE,
CONSTRAINT fk_Provideds_Clients1 FOREIGN KEY (clients_id_client)
REFERENCES Clients (id_client)
ON DELETE CASCADE
ON UPDATE CASCADE,
CONSTRAINT start_finish_dates_check CHECK (start_date_loan < finish_date_loan)
);

-- -----------------------------------------------------
-- Table `Employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Employees (
id_employee SERIAL PRIMARY KEY,
name VARCHAR(45) NOT NULL,
direction VARCHAR(45) NOT NULL,
email VARCHAR(45) NOT NULL,
number INT NOT NULL,
job VARCHAR(45) NOT NULL,
date_of_hire DATE NOT NULL,
date_of_fired DATE NULL,
CHECK(date_of_fired IS NULL OR date_of_hire > date_of_fired),
UNIQUE (id_employee)
);


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


