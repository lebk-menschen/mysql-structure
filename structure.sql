DROP DATABASE IF EXISTS Battleship;

CREATE DATABASE IF NOT EXISTS Battleship 
 DEFAULT CHARACTER SET = 'utf8' DEFAULT COLLATE 'utf8_general_ci';
 
USE Battleship;

CREATE TABLE `Game` (
  `uid` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `datePlayed` TIMESTAMP,
  `timePlayed` TIMESTAMP,
  `winnerPlayerId` INT
);

CREATE TABLE `Player` (
  `uid` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` TEXT,
  `password` TEXT
);

CREATE TABLE `GamePlayer` (
  `gameId` INT,
  `playerId` INT,
  `score` INT
);

CREATE TABLE `Ship` (
  `uid` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` TEXT,
  `length` INT,
  `points` INT
);

CREATE TABLE `GamePlayerShip` (
  `uid` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `gameId` INT,
  `playerId` INT,
  `shipId` INT,
  `line` TEXT,
  `hits` INT
);

CREATE TABLE `Result` (
  `uid` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `description` TEXT
);

CREATE TABLE `GamePlayerShot` (
  `uid` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `gameId` INT,
  `playerId` INT,
  `point` TEXT,
  `resultId` INT
);

ALTER TABLE `Game` ADD CONSTRAINT `Game_fk1` FOREIGN KEY (`winnerPlayerId`) REFERENCES Player(`uid`);

ALTER TABLE `GamePlayer` ADD CONSTRAINT `GamePlayer_fk1` FOREIGN KEY (`gameId`) REFERENCES Game(`uid`);
ALTER TABLE `GamePlayer` ADD CONSTRAINT `GamePlayer_fk2` FOREIGN KEY (`playerId`) REFERENCES Player(`uid`);

ALTER TABLE `GamePlayerShip` ADD CONSTRAINT `GamePlayerShip_fk1` FOREIGN KEY (`gameId`) REFERENCES Game(`uid`);
ALTER TABLE `GamePlayerShip` ADD CONSTRAINT `GamePlayerShip_fk2` FOREIGN KEY (`playerId`) REFERENCES Player(`uid`);
ALTER TABLE `GamePlayerShip` ADD CONSTRAINT `GamePlayerShip_fk3` FOREIGN KEY (`shipId`) REFERENCES Ship(`uid`);

ALTER TABLE `GamePlayerShot` ADD CONSTRAINT `GamePlayerShot_fk1` FOREIGN KEY (`gameId`) REFERENCES Game(`uid`);
ALTER TABLE `GamePlayerShot` ADD CONSTRAINT `GamePlayerShot_fk2` FOREIGN KEY (`playerId`) REFERENCES Player(`uid`);
ALTER TABLE `GamePlayerShot` ADD CONSTRAINT `GamePlayerShot_fk3` FOREIGN KEY (`resultId`) REFERENCES Result(`uid`);

INSERT INTO Ship(name, length, points) VALUES("Patrol boat", 2, 20);
INSERT INTO Ship(name, length, points) VALUES("Destroyer", 3, 30);
INSERT INTO Ship(name, length, points) VALUES("Submarine", 3, 30);
INSERT INTO Ship(name, length, points) VALUES("Battleship", 4, 40);
INSERT INTO Ship(name, length, points) VALUES("Aircraft carrier", 5, 50);

INSERT INTO Result(description) VALUES("Miss");
INSERT INTO Result(description) VALUES("Hit");
INSERT INTO Result(description) VALUES("Sunk");
INSERT INTO Result(description) VALUES("Won");
INSERT INTO Result(description) VALUES("ERROR");
