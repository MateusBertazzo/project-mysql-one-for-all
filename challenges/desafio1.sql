-- Descomente e altere as linhas abaixo:

DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.plans_user(
    `plan_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name_plan` VARCHAR(45) NOT NULL,
    `price_plan` DECIMAL(3,2) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.users(
    `user_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
    `age` INT NOT NULL,
    `subscription_date` DATE NOT NULL,
    `plan_id` INT,
    FOREIGN KEY(plan_id) REFERENCES SpotifyClone.plans_user(plan_id)
) engine = InnoDB;


CREATE TABLE SpotifyClone.artists(
  `artist_id` INT PRIMARY KEY AUTO_INCREMENT,
  `name_artist` VARCHAR(45) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.follower_artist(
  `user_id` INT,
  `artist_id` INT,
  CONSTRAINT PRIMARY KEY(user_id, artist_id),
  FOREIGN KEY(user_id) REFERENCES SpotifyClone.users(user_id),
  FOREIGN KEY(artist_id) REFERENCES SpotifyClone.artists(artist_id)
) engine = InnoDB;


CREATE TABLE SpotifyClone.albuns(
    `album_id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name_album` VARCHAR(45) NOT NULL,
    `artist_id` INT NOT NULL,
    `realese_date` INT NOT NULL,
    `plan_id` INT,
    FOREIGN KEY(artist_id) REFERENCES SpotifyClone.artists(artist_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.songs(
    `song_id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name_song` VARCHAR(45) NOT NULL,
    `duration` INT,
    `album_id` INT,
    FOREIGN KEY(album_id) REFERENCES SpotifyClone.albuns(album_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.history(
  `user_id` INT,
  `song_id` INT,
  `playback_date` DATETIME NOT NULL,
  CONSTRAINT PRIMARY KEY(user_id, song_id),
  FOREIGN KEY(user_id) REFERENCES SpotifyClone.users(user_id),
  FOREIGN KEY(song_id) REFERENCES SpotifyClone.songs(song_id)
) engine = InnoDB;


INSERT INTO SpotifyClone.plans_user (plan_id, name_plan, price_plan)
VALUES
  (1, 'gratuito', 0.00),
  (2, 'universitario', 5.99),
  (3, 'pessoal', 6.99),
  (4, 'familiar', 7.99);

INSERT INTO SpotifyClone.users (user_id, name, age, subscription_date, plan_id)
VALUES
  (1, "Barbara Liskov", 82, "2019-10-20", 1),
  (2, "Robert Cecil Martin", 58, "2017-01-06", 1),
  (3, "Ada Lovelace", 37, "2017-12-30", 4),
  (4, "Martin Fowler", 46, "2017-01-17", 4),
  (5, "Sandi Metz", 58, "2018-04-29", 4),
  (6, "Paulo Freire", 19, "2018-02-14", 2),
  (7, "Bell Hooks", 26, "2018-01-20", 2),
  (8, "Christopher Alexander", 85, "2019-06-05", 3),
  (9, "Judith Butler", 45, "2020-05-13", 3),
  (10,"Jorge Amado", 58, "2017-02-17", 3);

INSERT INTO SpotifyClone.artists (artist_id, name_artist)
VALUES
  (1, "Beyoncè"),
  (2, "Queen"),
  (3, "Elis Regina"),
  (4, "Baco Exu do Blues"),
  (5, "Blind Guardian"),
  (6, "Nina Simone");

INSERT INTO SpotifyClone.albuns (album_id, name_album, artist_id, realese_date)
VALUES
  (1, "Renaissance", 1, 2022),
  (2, "Jazz", 2, 1978),
  (3, "Hot Space", 2, 1982),
  (4, "Falso Brilhante", 3, 1998),
  (5, "Vento de Maio", 3, 2001),
  (6, "QVVJFA?", 4, 2003),
  (7, "Somewhere Far Beyond", 5, 2007),
  (8, "I Put A Spell On You", 6, 2012);

INSERT INTO SpotifyClone.songs (song_id, name_song, duration, album_id)
VALUES
  (1, "BREAK MY SOUL", 279, 1),
  (2, "VIRGO’S GROOVE", 369, 1),
  (3, "ALIEN SUPERSTAR", 116, 1),
  (4, "Don’t Stop Me Now", 203, 2),
  (5, "Under Pressure", 152, 3),
  (6, "Como Nossos Pais", 105, 4),
  (7, "O Medo de Amar é o Medo de ser Livre", 207, 5),
  (8, "Samba em Paris", 267, 6),
  (9, "The Bard’s Song", 244, 7),
  (10, "Feeling Good", 100, 8);

INSERT INTO SpotifyClone.follower_artist (user_id, artist_id)
VALUES
  (1,1),
  (1,2),
  (1,3),
  (2,1),
  (2,3),
  (3,2),
  (4,4),
  (5,5),
  (5,6),
  (6,6),
  (6,1),
  (7,6),
  (9,3),
  (10,2);

INSERT INTO SpotifyClone.history (user_id, song_id, playback_date)
VALUES 
  (1, 8,"2022-02-28 10:45:55"),
  (1, 2,"2020-05-02 05:30:35"),
  (1, 10,"2020-03-06 11:22:33"),
  (2, 10, "2022-08-05 08:05:17"),
  (2, 7, "2020-01-02 07:40:33"),
  (3, 10, "2020-11-13 16:55:13"),
  (3, 2, "2020-12-05 16:55:13"),
  (4, 8, "2021-08-15 17:10:10"),
  (5, 8, "2022-01-09 01:44:33"),
  (5, 5, "2020-08-06 15:23:43"),
  (6, 7, "2017-01-24 00:31:17"),
  (6, 1, "2017-10-12 12:35:20"),
  (7, 4, "2011-12-15 22:30:49"),
  (8, 4, "2012-03-17 14:56:41"),
  (9, 9, "2022-02-24 21:14:22"),
  (10, 3, "2015-12-13 08:30:22");
