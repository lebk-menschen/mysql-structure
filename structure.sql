CREATE TABLE `Game` (
  `uid` INT NOT NULL AUTO_INCREMENT,
  `datePlayed` TIMESTAMP,
  `timePlayed` TIMESTAMP,
  `winnerPlayerId` INT,
  PRIMARY KEY  (`uid`)
);

CREATE TABLE `Player` (
  `uid` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR,
  PRIMARY KEY  (`uid`)
);

CREATE TABLE `GamePlayer` (
  `gameId` INT,
  `playerId` INT,
  `score` INT
);

CREATE TABLE `Ship` (
  `uid` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR,
  `length` INT,
  `points` INT,
  PRIMARY KEY  (`uid`)
);

CREATE TABLE `GamePlayerShip` (
  `uid` INT NOT NULL AUTO_INCREMENT,
  `gameId` INT,
  `playerId` INT,
  `shipId` INT,
  `line` TEXT,
  `hits` INT,
  PRIMARY KEY  (`uid`)
);

CREATE TABLE `Result` (
  `uid` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR,
  PRIMARY KEY  (`uid`)
);

CREATE TABLE `gamePlayerShot` (
  `uid` INT NOT NULL AUTO_INCREMENT,
  `gameId` INT,
  `playerId` INT,
  `point` TEXT,
  `resultId` INT,
  PRIMARY KEY  (`uid`)
);

ALTER TABLE `Game` ADD CONSTRAINT `Game_fk1` FOREIGN KEY (`winnerPlayerId`) REFERENCES GamePlayer(`playerId`);

ALTER TABLE `GamePlayer` ADD CONSTRAINT `GamePlayer_fk1` FOREIGN KEY (`gameId`) REFERENCES Game(`uid`);
ALTER TABLE `GamePlayer` ADD CONSTRAINT `GamePlayer_fk2` FOREIGN KEY (`playerId`) REFERENCES Player(`uid`);

ALTER TABLE `GamePlayerShip` ADD CONSTRAINT `GamePlayerShip_fk1` FOREIGN KEY (`gameId`) REFERENCES GamePlayer(`gameId`);
ALTER TABLE `GamePlayerShip` ADD CONSTRAINT `GamePlayerShip_fk2` FOREIGN KEY (`playerId`) REFERENCES GamePlayer(`playerId`);
ALTER TABLE `GamePlayerShip` ADD CONSTRAINT `GamePlayerShip_fk3` FOREIGN KEY (`shipId`) REFERENCES Ship(`uid`);

ALTER TABLE `gamePlayerShot` ADD CONSTRAINT `gamePlayerShot_fk1` FOREIGN KEY (`gameId`) REFERENCES GamePlayer(`gameId`);
ALTER TABLE `gamePlayerShot` ADD CONSTRAINT `gamePlayerShot_fk2` FOREIGN KEY (`playerId`) REFERENCES GamePlayer(`playerId`);
ALTER TABLE `gamePlayerShot` ADD CONSTRAINT `gamePlayerShot_fk3` FOREIGN KEY (`resultId`) REFERENCES Result(`uid`);

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