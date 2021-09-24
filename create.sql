CREATE DATABASE IF NOT EXISTS RESERVATION_MOVIE_THEATER CHARACTER SET  utf8mb4 COLLATE utf8mb4_general_ci;
USE RESERVATION_MOVIE_THEATER;

CREATE TABLE Rate 
(
    id_rate INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    type VARCHAR(20) NOT NULL,
    price DECIMAL(10,2) NOT NULL
)engine = INNODB;

CREATE TABLE Roles 
(
    id_roles INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL
)engine = INNODB;


CREATE TABLE Users
(
    id_user INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    lastName VARCHAR(20) NOT NULL,
    firstName VARCHAR(20),
    email VARCHAR(20) NOT NULL,
    login VARCHAR(20) NOT NULL,
    password VARCHAR(40) NOT NULL,
    account BOOLEAN NOT NULL,
    idRate INTEGER NOT NULL,
    FOREIGN KEY (idRate) REFERENCES Rate(id_rate)
)engine = INNODB;

CREATE TABLE UserRoles
(
    idRoles INTEGER NOT NULL,
    FOREIGN KEY (idRoles) REFERENCES roles(id_roles),
    idUser INTEGER NOT NULL,
    FOREIGN KEY (idUser) REFERENCES Users(id_user)
)engine = INNODB;

CREATE TABLE Room 
(
    id_room INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(10),
    capacity INTEGER
)engine = INNODB;

CREATE table Session
(
    id_session INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    hours TIME,
    idRoom INTEGER NOT NULL,
    FOREIGN KEY (idRoom) REFERENCES Room(id_room)
)engine = INNODB;

CREATE TABLE Movie 
(
    id_movie INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(20),
    releaseDate DATE,
    endDate DATE,
    idSession INTEGER NOT NULL,
    FOREIGN KEY (idSession) REFERENCES Session(id_session)
)engine = INNODB;

CREATE TABLE Theater 
(
    id_movieTheater INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(20),
    ville VARCHAR(20)

)engine = INNODB;

CREATE TABLE Payment
(
    id_payment INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    type VARCHAR(20)
)engine = INNODB;

CREATE TABLE Reservation 
(
    id_reservation INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    date DATETIME,
    idMovieTheater INTEGER NOT NULL,
    FOREIGN KEY (idMovieTheater) REFERENCES Theater(id_movieTheater),
    idPayment INTEGER NOT NULL,
    FOREIGN KEY (idPayment) REFERENCES Payment(id_payment),
    idUser INTEGER NOT NULL,
    FOREIGN KEY (idUser) REFERENCES Users(id_user),
    idRate INTEGER NOT NULL,
    FOREIGN KEY (idRate) REFERENCES Rate(id_rate),
    idMovie INTEGER NOT NULL,
    FOREIGN KEY (idMovie) REFERENCES Movie(id_movie)
)engine = INNODB;

INSERT INTO rate (type, price)
VALUES
    ('Plein tarif', 9.20),
    ('Etudiant', 7.60),
    ('Moins de 14ans', 5.90);

INSERT INTO roles (id_roles, name)
VALUES
    (1, 'Administrateur'),
    (2, 'Utilisateur');

INSERT INTO payment (id_payment, type)
VALUES
    (1, 'Paiement sur place'),
    (2, 'Paiement en ligne');


insert into users (id_user, lastName, firstName, email, login, password, account, idRate) values (1, 'Bauduin', 'Eudora', 'ebauduin0@arizona.edu', 'Eudora Bauduin', '$2y$10$D1DB7Z7e9URzu1myfZeyG.3WiZY0Vk.GuCja56hMz9WKI3sM9yEUO', true, 1);
insert into users (id_user, lastName, firstName, email, login, password, account, idRate) values (2, 'Allwood', 'Olympe', 'oallwood1@ucoz.ru', 'Olympe Allwood', '$2y$10$jE6VYt4QcXlbKED7PXJmyeIqRCoqY2WloV0IMUKgBQbBcfLwKXj4u', true, 2);
insert into users (id_user, lastName, firstName, email, login, password, account, idRate) values (3, 'Dacey', 'Kristina', 'kdacey2@bing.com', 'Kristina Dacey', 'SsnY3oFbRvo$2y$10$drOs8NqkrI429Bw0r6eqluf6zqcoqJNYYc2Fn3IKztBJgGzTE4FWS', false, 3);
insert into users (id_user, lastName, firstName, email, login, password, account, idRate) values (4, 'Kohn', 'Eddie', 'ekohn3@jugem.jp', 'Eddie Kohn', '$2y$10$ICcAo3xkOEZsMpjpxfaJwu.KQmXYnvhNbU/.mJF6.UP10UFwmtu26', true, 1);
insert into users (id_user, lastName, firstName, email, login, password, account, idRate) values (5, 'Lemery', 'Jeniece', 'jlemery4@go.com', 'Jeniece Lemery', '$2y$10$9TdkgzjGxL9uwoLKAWqlTOZqwDagoO/WhJf7eUU1i/ZdSbGrWQDne', true, 1);
insert into users (id_user, lastName, firstName, email, login, password, account, idRate) values (6, 'Labarre', 'Jerry', 'jlabarre5@list-manage.com', 'Jerry Labarre', '$2y$10$i5P/yRLAMG35r4DrkgkLAuGAjeOf0QFBe8ollKDviwG4jk0Jalqn2', false, 2);
insert into users (id_user, lastName, firstName, email, login, password, account, idRate) values (7, 'Abramov', 'Duane', 'dabramov6@github.io', 'Duane Abramov', '$2y$10$bLYQ75KjEMx7TB8qDtLbmufYcKL1UWamfmRHUGnK.mEYu3wxY4kpOv', true, 3);
insert into users (id_user, lastName, firstName, email, login, password, account, idRate) values (8, 'Botterman', 'Constantin', 'cbotterman7@w3.org', 'Constantin Botterman', '$2y$10$tzbYnDQLbSwv4a9P5l7gF.KjMog8TPrBNE71v/9Z/GQUuzwuVxyzu', false, 2);
insert into users (id_user, lastName, firstName, email, login, password, account, idRate) values (9, 'Layborn', 'Eden', 'elayborn8@woothemes.com', 'Eden Layborn', '$2y$10$93ffvBaJ3yJ0OuwoYgX3IepTP5h9gj5NahEhhplgvfSXQM9fHm/kC', true, 3);
insert into users (id_user, lastName, firstName, email, login, password, account, idRate) values (10, 'Hearmon', 'Jedediah', 'jhearmon9@tuttocitta.it', 'Jedediah Hearmon', '$2y$10$4qvqk9.rIuaEHsdBIt6Iseg4nFvxHYiohdqb0siCo6yNL3/sqPFrC', true, 2);
insert into users (id_user, lastName, firstName, email, login, password, account, idRate) values (11, 'Jovicic', 'Mallissa', 'mjovicica@ca.gov', 'Mallissa Jovicic', '$2y$10$3VDusDdOdBgv7/mLTepn8.QgXmeyeHDxvUk6.qlHulsYBmwRDCN/i', true, 1);
insert into users (id_user, lastName, firstName, email, login, password, account, idRate) values (12, 'Tieraney', 'Kimberly', 'ktieraneyb@webnode.com', 'Kimberly Tieraney', '$2y$10$eYgwLgxlq6N0LtmRoWH2POJ1sDtPmHUfql6OWD6wSvwPp4tv9DVom', true, 3);
insert into users (id_user, lastName, firstName, email, login, password, account, idRate) values (13, 'Carmont', 'Catlee', 'ccarmontc@usda.gov', 'Catlee Carmont', '$2y$10$HGSIAx5UWEuwNrRCbEVgoOT6UXuLdyPe5DpPEH58PrSE3HuCiXBNS', false, 2);
insert into users (id_user, lastName, firstName, email, login, password, account, idRate) values (14, 'Brabin', 'Hewet', 'hbrabind@parallels.com', 'Hewet Brabin', '$2y$10$pa1G2wUj07c9caZixqKpJOA46qWGEFWfnkr2DKWK3Imnd5ACCIJdK', false, 1);
insert into users (id_user, lastName, firstName, email, login, password, account, idRate) values (15, 'Arro', 'Elisabetta', 'earroe@yelp.com', 'Elisabetta Arro', '$2y$10$dJ9MKt.6hlvpmsurIOhPauqik0XvMtky.hKysKaOLzdfUn/zpUxH.', true, 1);
insert into users (id_user, lastName, firstName, email, login, password, account, idRate) values (16, 'Rings', 'Willdon', 'wringsf@deviantart.com', 'Willdon Rings', '$2y$10$0ZuEPo3AfMnAIw3brWdL9.9X9fAf8jVQ7J95DhRr030c1e1OF6zOC', false, 3);
insert into users (id_user, lastName, firstName, email, login, password, account, idRate) values (17, 'Eason', 'Nesta', 'neasong@va.gov', 'Nesta Eason', '$2y$10$ZlxV6FABfLni/P7txTNP1O571q2Yt9FHwwqisFqkqR3TrMVaekKSC', true, 2);
insert into users (id_user, lastName, firstName, email, login, password, account, idRate) values (18, 'Mattingly', 'Samantha', 'smattinglyh@scribd.com', 'Samantha Mattingly', '$2y$10$HWOell23FeOl1U0fI45A.u2D120QJcjLEV3E2Nl8Az5mBSiJTobRC', false, 1);
insert into users (id_user, lastName, firstName, email, login, password, account, idRate) values (19, 'Ciobotaro', 'Sutherland', 'sciobotaroi@bloglovin.com', 'Sutherland Ciobotaro', '$2y$10$pq/rK5jOWhf/DCOLzt2YUuv.gd/GkZDco0VG0czJs2xk.17Rgki0q', false, 1);
insert into users (id_user, lastName, firstName, email, login, password, account, idRate) values (20, 'Alday', 'Nadiya', 'naldayj@nytimes.com', 'Nadiya Alday', '$2y$10$IulBOFrHudq6jbsPjf6i9O0KmX4jbmL0VzJ9m4iObJljoyMvOBQy6', false, 1);

INSERT INTO room (id_room, name, capacity)
VALUES  
    (1, 'normal', 180),
    (2, 'normal', 273),
    (3, 'normal', 183),
    (4, '4K', 352),
    (5, '4K', 234),
    (6, 'normal', 50),
    (7, 'normal', 90);

INSERT INTO session (id_session, hours,idRoom)
VALUES
    (1, '10:00:00', 1),
    (2, '12:00:00', 2),
    (3, '13:00:00', 3),
    (4, '16:00:00', 4),
    (5, '20:00:00', 5),
    (6, '23:00:00', 6),
    (7, '10:00:00', 7),
    (8, '12:00:00', 6),
    (9, '13:00:00', 5),
    (10, '16:00:00', 4),
    (11, '20:00:00', 3),
    (12, '23:00:00', 2);




insert into movie (id_movie, name, releaseDate, endDate, idSession) values (1, 'Still Life (Sanxia haoren)', '10/12/2021', '11/14/2021', 1);
insert into movie (id_movie, name, releaseDate, endDate, idSession) values (2, 'Chinese Box', '10/4/2021', '11/10/2021', 2);
insert into movie (id_movie, name, releaseDate, endDate, idSession) values (3, 'Celtic Pride', '10/12/2021', '11/9/2021', 3);
insert into movie (id_movie, name, releaseDate, endDate, idSession) values (4, 'From the Orient with Fury', '10/5/2021', '11/28/2021', 12);
insert into movie (id_movie, name, releaseDate, endDate, idSession) values (5, 'Acid House, The', '10/23/2021', '11/27/2021', 10);
insert into movie (id_movie, name, releaseDate, endDate, idSession) values (6, 'Caterina in the Big City (Caterina va in città)', '10/13/2021', '12/3/2021', 3);
insert into movie (id_movie, name, releaseDate, endDate, idSession) values (7, 'Act of Seeing with One''s Own Eyes, The ', '10/22/2021', '11/28/2021', 1);
insert into movie (id_movie, name, releaseDate, endDate, idSession) values (8, 'Sympathy for Mr. Vengeance (Boksuneun naui geot)', '10/6/2021', '12/6/2021', 5);
insert into movie (id_movie, name, releaseDate, endDate, idSession) values (9, 'Angus', '10/6/2021', '12/1/2021', 7);
insert into movie (id_movie, name, releaseDate, endDate, idSession) values (10, 'Falling Up', '10/19/2021', '11/22/2021', 9);
insert into movie (id_movie, name, releaseDate, endDate, idSession) values (11, 'Life of Jesus, The (La vie de Jésus)', '9/30/2021', '12/5/2021', 1);
insert into movie (id_movie, name, releaseDate, endDate, idSession) values (12, '12:01 PM', '9/29/2021', '11/12/2021', 6);
insert into movie (id_movie, name, releaseDate, endDate, idSession) values (13, 'What Doesn''t Kill You', '9/29/2021', '12/1/2021', 8);
insert into movie (id_movie, name, releaseDate, endDate, idSession) values (14, 'Big Jim McLain', '9/30/2021', '12/4/2021', 4);
insert into movie (id_movie, name, releaseDate, endDate, idSession) values (15, 'Carrie', '10/17/2021', '11/24/2021', 2);

INSERT INTO theater (id_movieTheater, name, ville)
VALUES  
    (1, 'Cinemanimal', 'Lorient'),
    (2, 'Specktakl', 'Rennes'),
    (3, 'Mon siège à rêves', 'Paris'),
    (4, 'Le coin d\'Hollywood', 'Bordeaux'),
    (5, 'Cinéville', 'Nantes');

INSERT INTO UserRoles (idRoles, idUser)
VALUES
    (1, 1),
    (1, 2),
    (2, 3),
    (2, 4),
    (2, 5),
    (2, 6),
    (2, 7),
    (2, 8),
    (2, 9),
    (2, 10),
    (2, 11),
    (2, 12),
    (2, 13),
    (2, 14),
    (2, 15),
    (2, 16),
    (2, 17),
    (2, 18),
    (2, 19),
    (2, 20);


INSERT INTO Reservation (id_reservation, date, idMovieTheater, idPayment, idUser, idRate, idMovie)
VALUES
    (1, '2021-05-08 23:20:39', 5, 1, 5, 2, 14),
    (2, '2021-07-22 08:43:55', 1, 1, 20, 1, 10),
    (3, '2021-07-15 16:42:20', 2, 1, 6, 3, 2),
    (4, '2021-08-06 01:10:02', 5, 1, 4, 2, 2),
    (5, '2021-01-01 06:33:38', 4, 1, 15, 1, 1),
    (6, '2020-12-23 09:08:53', 3, 1, 13, 1, 15),
    (7, '2021-03-17 14:19:17', 2, 1, 10, 1, 5),
    (8, '2021-07-26 10:39:44', 1, 1, 2, 1, 4),
    (9, '2021-05-01 02:48:57', 5, 1, 14, 2, 12),
    (10, '2021-04-30 01:14:54', 2, 1, 19, 2, 7),
    (11, '2021-05-12 11:21:16', 3, 1, 17, 3, 8),
    (12, '2021-06-08 20:30:54', 4, 1, 5, 3, 3),
    (13, '2021-04-17 13:53:46', 5, 1, 8, 1, 7),
    (14, '2020-12-05 10:18:20', 1, 1, 4, 1, 13),
    (15, '2021-01-18 19:50:33', 2, 1, 11, 2, 9);


CREATE USER 'nadia'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON * . * TO 'nadia'@'localhost';
FLUSH PRIVILEGES;

