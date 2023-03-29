-- Postgres Script
-- Tue Mar 21 17:42:52 2023
-- Model: New Model    Version: 2.0

-- -----------------------------------------------------
-- Querys for use in the database library
-- -----------------------------------------------------

-- Use of INNER JOIN to get the books that are available

SELECT a.name AS author, b.title AS books_available FROM authors a INNER JOIN books b ON a.id_author = b.id_book WHERE b.availability = true;