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
  id_image INT,
  name_image VARCHAR(50),
  binary_image BYTEA
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
CREATE DOMAIN client_data AS VARCHAR NOT NULL CHECK (value !~ '\s');

CREATE TABLE IF NOT EXISTS Clients2 (
    id_client SERIAL PRIMARY KEY,
    name client_data,
    surname client_data,
    last_name client_data,
    direction client_data,
    email VARCHAR(45),
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
CREATE DOMAIN emplooyees_data AS VARCHAR NOT NULL CHECK (value !~ '\s');

CREATE TABLE IF NOT EXISTS Employees (
id_employee SERIAL PRIMARY KEY,
name  emplooyees_data,
surname  emplooyees_data,
last_name emplooyees_data,
direction VARCHAR(45) NOT NULL,
email VARCHAR(45),
number INT NOT NULL,
job VARCHAR(45) emplooyees_data,
date_of_hire DATE NOT NULL,
date_of_fired DATE NULL,
CHECK(date_of_fired IS NULL OR date_of_hire > date_of_fired),
UNIQUE (id_employee)
);

-- -----------------------------------------------------
-- Table `Sells`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Sells (
id_sell SERIAL PRIMARY KEY,
date_sell DATE NOT NULL,
price NUMERIC(10, 2) NOT NULL,
books_id_book INT NOT NULL,
clients_id_client INT NOT NULL,
employees_id_employee INT NOT NULL,
CONSTRAINT fk_Sells_Books1 FOREIGN KEY (books_id_book)
REFERENCES Books (id_book)
ON DELETE CASCADE
ON UPDATE CASCADE,
CONSTRAINT fk_Sells_Clients1 FOREIGN KEY (clients_id_client)
REFERENCES Clients (id_client)
ON DELETE CASCADE
ON UPDATE CASCADE,
CONSTRAINT fk_Sells_Employees1 FOREIGN KEY (employees_id_employee)
REFERENCES Employees (id_employee)
ON DELETE CASCADE
ON UPDATE CASCADE
);

-- -----------------------------------------------------
-- Table `Books_has_Authors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Books_has_Authors (
Books_id_book INT NOT NULL,
Authors_id_author INT NOT NULL,
PRIMARY KEY (Books_id_book, Authors_id_author),
CONSTRAINT fk_Books_has_Authors_Books FOREIGN KEY (Books_id_book)
REFERENCES Books (id_book)
ON DELETE CASCADE
ON UPDATE CASCADE,
CONSTRAINT fk_Books_has_Authors_Authors1 FOREIGN KEY (Authors_id_author)
REFERENCES Authors (id_author)
ON DELETE CASCADE
ON UPDATE CASCADE
);