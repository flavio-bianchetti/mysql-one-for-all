-- MySQL developed by Flávio José Bianchetti with requirement
-- of project MySQL One for All - Trybe.
-- 
-- Date: 03/02/2022
-- -----------------------------------------------------------
DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.PLAN(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(20) NOT NULL,
    `value` DECIMAL(3,2) DEFAULT '0',
    PRIMARY KEY(`id`)
) engine = InnoDB;

CREATE TABLE SpotifyClone.ARTIST(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    PRIMARY KEY(`id`)
) engine = InnoDB;

CREATE TABLE SpotifyClone.USER(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `plan_id` INTEGER NOT NULL,
    `name` VARCHAR(50) NOT NULL,
    `age` DECIMAL(3,0) NULL,
    `signature_date` DATE NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY (`plan_id`) REFERENCES `PLAN` (`id`)
) engine = InnoDB;

CREATE TABLE SpotifyClone.ALBUM(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `artist_id` INTEGER NOT NULL,
    `name` VARCHAR(30) NOT NULL,
    `release_year` DECIMAL(4,0) NOT NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY (`artist_id`) REFERENCES `ARTIST` (`id`)
) engine = InnoDB;

CREATE TABLE SpotifyClone.SONG(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `album_id` INTEGER NOT NULL,
    -- `artist_id` INTEGER NOT NULL,
    `name` VARCHAR(50) NOT NULL,
    `duration_seconds` DECIMAL(3,0) NOT NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY (`album_id`) REFERENCES `ALBUM` (`id`)
    -- FOREIGN KEY (`artist_id`) REFERENCES `ARTIST` (`id`)
) engine = InnoDB;

CREATE TABLE SpotifyClone.USER_SONG(
    `user_id` INTEGER NOT NULL,
    `song_id` INTEGER NOT NULL,
    `reproduction_date` DATETIME NOT NULL,
    PRIMARY KEY(`user_id`, `song_id`, `reproduction_date`),
    FOREIGN KEY (`user_id`) REFERENCES `USER` (`id`),
    FOREIGN KEY (`song_id`) REFERENCES `SONG` (`id`)
) engine = InnoDB;

CREATE TABLE SpotifyClone.USER_ARTIST(
    `user_id` INTEGER NOT NULL,
    `artist_id` INTEGER NOT NULL,
    PRIMARY KEY(`user_id`, `artist_id`),
    FOREIGN KEY (`user_id`) REFERENCES `USER` (`id`),
    FOREIGN KEY (`artist_id`) REFERENCES `ARTIST` (`id`)
) engine = InnoDB;


INSERT INTO SpotifyClone.PLAN (`id`, `name`, `value`)
VALUES
  (1, 'gratuito', 0),
  (2, 'universitario', 5.99),
  (3, 'pessoal', 6.99),
  (4, 'familiar', 7.99);
  
INSERT INTO SpotifyClone.ARTIST (`id`, `name`)
VALUES
  (1, 'Walter Phoenix'),
  (2, 'Peter Strong'),
  (3, 'Lance Day'),
  (4, 'Freedie Shannon'),
  (5, 'Tyler Isle'),
  (6, 'Fog');
  
  INSERT INTO SpotifyClone.USER (`id`, `plan_id`, `name`, `age`, `signature_date`)
VALUES
  (1, 1,'Thati', 23,'2019-10-20'),
  (2, 4,'Cintia', 35,'2017-12-30'),
  (3, 2,'Bill', 20,'2019-06-05'),
  (4, 3,'Roger', 45,'2020-05-13'),
  (5, 4,'Norman', 58,'2017-02-17'),
  (6, 4,'Patrick', 33,'2017-01-06'),
  (7, 2,'Vivian', 26,'2018-01-05'),
  (8, 2,'Carol', 19,'2018-02-14'),
  (9, 4,'Angelina', 42,'2018-04-29'),
  (10, 4,'Paul', 46,'2017-01-17');

  INSERT INTO SpotifyClone.ALBUM (`id`, `artist_id`, `name`, `release_year`)
VALUES
  (1, 1,'Envious', '1990'),
  (2, 1,'Exuberant', '1993'),
  (3, 2,'Hallowed Steam', '1995'),
  (4, 3,'Incandescent', '1998'),
  (5, 4,'Temporary Culture', '2001'),
  (6, 4,'Library of liberty', '2003'),
  (7, 5,'Chained Down', '2007'),
  (8, 5,'Cabinet of fools', '2012'),
  (9, 5,'No guarantees', '2015'),
  (10, 6,'Apparatus', '2015');
  
INSERT INTO SpotifyClone.SONG (`id`, `album_id`, `name`, `duration_seconds`)
VALUES
  (1, 1,'Soul For Us', 200),
  (2, 1,'Reflections Of Magic', 163),
  (3, 1,'Dance With Her Own', 116),
  (4, 2,'Troubles Of My Inner Fire', 203),
  (5, 2,'Time Fireworks', 152),
  (6, 3,'Magic Circus', 105),
  (7, 3,'Honey, So Do I', 207),
  (8, 3,"Sweetie, Let's Go Wild", 139),
  (9, 3,'She Knows', 244),
  (10, 4,'Fantasy For Me', 100),
  (11, 4,'Celebration Of More', 146),
  (12, 4,'Rock His Everything', 223),
  (13, 4,'Home Forever', 231),
  (14, 4,'Diamond Power', 241),
  (15, 4,"Let's Be Silly", 132),
  (16, 5,'Thang Of Thunder', 240),
  (17, 5,'Words Of Her Life', 185),
  (18, 5,'Without My Streets', 176),
  (19, 6,'Need Of The Evening', 190),
  (20, 6,'History Of My Roses', 222),
  (21, 6,'Without My Love', 111),
  (22, 6,'Walking And Game', 123),
  (23, 6,'Young And Father', 197),
  (24, 7,'Finding My Traditions', 179),
  (25, 7,'Walking And Man', 229),
  (26, 7,'Hard And Time', 135),
  (27, 7,"Honey, I'm A Lone Wolf", 150),
  (28, 8,"She Thinks I Won't Stay Tonight", 166),
  (29, 8,"He Heard You're Bad For Me", 154),
  (30, 8,"He Hopes We Can't Stay", 210),
  (31, 8,'I Know I Know', 117),
  (32, 9,"He's Walking Away", 159),
  (33, 9,"He's Trouble", 138),
  (34, 9,'I Heard I Want To Bo Alone', 120),
  (35, 9,'I Ride Alone', 151),
  (36, 10,'Honey', 79),
  (37, 10,'You Cheated On Me', 95),
  (38, 10,"Wouldn't It Be Nice", 213),
  (39, 10,'Baby', 136),
  (40, 10,'You Make Me Feel So', 83);

INSERT INTO SpotifyClone.USER_ARTIST (`user_id`, `artist_id`)
VALUES
  ( 1, 1),
  ( 1, 4),
  ( 1, 3),
  ( 2, 1),
  ( 2, 3),
  ( 3, 2),
  ( 3, 1),
  ( 4, 4),
  ( 5, 5),
  ( 5, 6),
  ( 6, 6),
  ( 6, 3),
  ( 6, 1),
  ( 7, 2),
  ( 7, 5),
  ( 8, 1),
  ( 8, 5),
  ( 9, 6),
  ( 9, 4),
  ( 9, 3),
  ( 10, 2),
  ( 10, 6);
  
INSERT INTO SpotifyClone.USER_SONG (`user_id`, `song_id`, `reproduction_date`)
VALUES
(1, 36, '2020-02-28 10:45:55'),
(1, 25, '2020-05-02 05:30:35'),
(1, 23, '2020-03-06 11:22:33'),
(1, 14, '2020-08-05 08:05:17'),
(1, 15, '2020-09-14 16:32:22'),
(2, 34, '2020-01-02 07:40:33'),
(2, 24, '2020-05-16 06:16:22'),
(2, 21, '2020-10-09 12:27:48'),
(2, 39, '2020-09-21 13:14:46'),
(3, 6, '2020-11-13 16:55:13'),
(3, 3, '2020-12-05 18:38:30'),
(3, 26, '2020-07-30 10:00:00'),
(4, 2, '2021-08-15 17:10:10'),
(4, 35, '2021-07-10 15:20:30'),
(4, 27, '2021-01-09 01:44:33'),
(5, 7, '2020-07-03 19:33:28'),
(5, 12, '2017-02-24 21:14:22'),
(5, 14, '2020-08-06 15:23:43'),
(5, 1, '2020-11-10 13:52:27'),
(6, 38, '2019-02-07 20:33:48'),
(6, 29, '2017-01-24 00:31:17'),
(6, 30, '2017-10-12 12:35:20'),
(6, 22, '2018-05-29 14:56:41'),
(7, 5, '2018-05-09 22:30:49'),
(7, 4, '2020-07-27 12:52:58'),
(7, 11, '2018-01-16 18:40:43'),
(8, 39, '2018-03-21 16:56:40'),
(8, 40, '2020-10-18 13:38:05'),
(8, 32, '2019-05-25 08:14:03'),
(8, 33, '2021-08-15 21:37:09'),
(9, 16, '2021-05-24 17:23:45'),
(9, 17, '2018-12-07 22:48:52'),
(9, 8, '2021-03-14 06:14:26'),
(9, 9, '2020-04-01 03:36:00'),
(10, 20, '2017-02-06 08:21:34'),
(10, 21, '2017-12-04 05:33:43'),
(10, 12, '2017-07-27 05:24:49'),
(10, 13, '2017-12-25 01:03:57');
