-- Descomente e altere as linhas abaixo:

DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.plans_user(
    `plan_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name_plan` VARCHAR(45) NOT NULL,
    `price_plan` DECIMAL(3,2) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.users(
    `user_id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
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
  `user_id` INT PRIMARY KEY AUTO_INCREMENT,
  `artist_id` INT PRIMARY KEY AUTO_INCREMENT,
  CONSTRAINT PRIMARY KEY(user_id, artist_id),
  FOREIGN KEY(user_id) REFERENCES SpotifyClone.users(user_id),
  FOREIGN KEY(artist_id) REFERENCES SpotifyClone.artists(artist_id)
) engine = InnoDB;


CREATE TABLE SpotifyClone.albuns(
    `album_id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name_album` VARCHAR(45) NOT NULL,
    `artist_id` INT NOT NULL,
    `realese_date` INTEGER NOT NULL,
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
  `user_id` INT PRIMARY KEY AUTO_INCREMENT,
  `song_id` INT PRIMARY KEY AUTO_INCREMENT,
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

INSERT INTO SpotifyClone.artists (user_id, name, age, subscription_date, plan_id)
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

INSERT INTO SpotifyClone.users (artist_id, name_artist)
VALUES
  (1, "Beyoncè"),
  (2, "Queen"),
  (3, "Elis Regina"),
  (4, "Baco Exu do Blues"),
  (5, "Blind Guardian"),
  (6, "Nina Simone");