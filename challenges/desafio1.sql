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


INSERT INTO SpotifyClone.tabela1 (coluna1, coluna2)
VALUES
  ('exemplo de dados 1', 'exemplo de dados A'),
  ('exemplo de dados 2', 'exemplo de dados B'),
  ('exemplo de dados 3', 'exemplo de dados C');

INSERT INTO SpotifyClone.tabela2 (coluna1, coluna2)
VALUES
  ('exemplo de dados 1', 'exemplo de dados X'),
  ('exemplo de dados 2', 'exemplo de dados Y');
