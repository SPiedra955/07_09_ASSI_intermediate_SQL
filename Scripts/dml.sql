-- For insert the data in the table 'Books' we have to run a python file.

-- Data for insert into 'authors'

INSERT INTO authors(name, birth_date, country) VALUES('Miguel de Cervantes','1547-09-29', 'Spain');
INSERT INTO authors(name, birth_date, country) VALUES('Antoine Saint-Exupéry','1990-06-29', 'France');
INSERT INTO authors(name, birth_date, country) VALUES('John Boyne','1971-04-30','Ireland');
INSERT INTO authors(name, birth_date, country) VALUES('Iñaki Jiménez Largo','1976-05-08', 'Spain');
INSERT INTO authors(name, birth_date, country) VALUES('Jordi Sierra I Fabra','1947-06-26', 'Spain');
INSERT INTO authors(name, birth_date, country) VALUES('Jordi Wild','1984-08-28','Spain');
INSERT INTO authors(name, birth_date, country) VALUES('Allen Carr','1934-09-02','United Kingdom');
INSERT INTO authors(name, birth_date, country) VALUES('Sandra Carbajal Tudón','1980-03-13','Spain');
INSERT INTO authors(name, birth_date, country) VALUES('The Pokemon Company','1998-04-23','Japan');

-- Data for insert into 'clients'

INSERT INTO clients(name, surname, last_name, direction, email, phone_number) VALUES('Manuel', 'Ovejero', 'Martinez', 'C/Tramuntana 18', 'manuov@gmail.com', 655789453);
INSERT INTO clients(name, surname, last_name, direction, email, phone_number) VALUES('Neus', 'Cabrera', 'Font', 'C/Mateu Enric Llado', 'neuscabrerafont@gmail.com', 611197269);
INSERT INTO clients(name, surname, last_name, direction, email, phone_number) VALUES('Andres', 'Bosch', 'Valero', 'C/Sant Nicolau', 'abv@gmail.com', 619062308);
INSERT INTO clients(name, surname, last_name, direction, email, phone_number) VALUES('Abel', 'Perez', 'Lopez', 'C/Can Serinya', 'abel98@gmail.com', 680134407);
INSERT INTO clients(name, surname, last_name, direction, email, phone_number) VALUES('Maria', 'Bonin', 'Villen', 'C/Lima', 'mbonin@gmail.com', 611197269);

-- Data for insert into 'employees'

INSERT INTO employees(name, surname, last_name, direction, email, phone_number, job, date_of_hire, date_of_fired) VALUES('Ismael', 'Gomez', 'Paez', 'C/Libertad 18', 'IsmaG@gmail.com', 657489735, 'Seller', '2015-06-04', '2022-09-26');
INSERT INTO employees(name, surname, last_name, direction, email, phone_number, job, date_of_hire, date_of_fired) VALUES('Leando', 'Cuadrado', 'Paz', 'C/Son Ferreret', 'cuadrado25@gmail.com', 625482354, 'Seller', '2011-08-20', NULL);
INSERT INTO employees(name, surname, last_name, direction, email, phone_number, job, date_of_hire, date_of_fired) VALUES('Dolores', 'Magan', 'Quint', 'C/Manresa', 'lolamaga@gmail.com', 625876902, 'Cleaner', '2022-01-01','2023-03-30');
INSERT INTO employees(name, surname, last_name, direction, email, phone_number, job, date_of_hire, date_of_fired) VALUES('Cristina', 'Santos', 'Tur', 'C/Dorothy Bate', 'crissantos@gmail.com', 698754824, 'Commercial', '2016-12-30', '2022-08-28');
INSERT INTO employees(name, surname, last_name, direction, email, phone_number, job, date_of_hire, date_of_fired) VALUES('Andrea', 'Llano', 'Hermoso', 'C/Son Sant Joan', 'andrea@llano.com', 641324796, 'Commercial', '2017-02-01', NULL);
INSERT INTO employees(name, surname, last_name, direction, email, phone_number, job, date_of_hire, date_of_fired) VALUES('Raul', 'Gillamon', 'Pere', 'C/Buenos aires', 'raulgp78@gmail.com', 658217630, 'Manager', '2010-10-15', NULL);
INSERT INTO employees(name, surname, last_name, direction, email, phone_number, job, date_of_hire, date_of_fired) VALUES('Francesc', 'Petit', 'Croix', 'C/Son Roig', 'cesc_petit@gmail.com', 698874523, 'Cleaner', '2018-07-09', '2021-11-30');
INSERT INTO employees(name, surname, last_name, direction, email, phone_number, job, date_of_hire, date_of_fired) VALUES('Maria','Rodriguez','Barrantes','Calle De Rio,22','maria2@gmail.com',659243654,'receptionist','2022-04-04','2023-04-04');
INSERT INTO employees(name, surname, last_name, direction, email, phone_number, job, date_of_hire, date_of_fired) VALUES('Toni','Espinar','Torres','Carer Almendras,12','toni24@gmail.com',659243232,'restocking','2022-02-03','2025-02-03');

--