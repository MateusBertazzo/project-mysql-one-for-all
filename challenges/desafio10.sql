-- Descomente e altere as linhas abaixo::

CREATE TABLE SpotifyClone.favorite(
  `user_id` INT,
  `song_id` INT,
  CONSTRAINT PRIMARY KEY(user_id, song_id),
  FOREIGN KEY(user_id) REFERENCES SpotifyClone.users(user_id),
  FOREIGN KEY(song_id) REFERENCES SpotifyClone.songs(song_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.favorite (user_id, song_id)
VALUES
  (1, 3),
  (1, 6),
  (1, 10),
  (2, 4),
  (3, 1),
  (3, 3),
  (4, 7),
  (4, 4),
  (5, 10),
  (5, 2),
  (8, 4),
  (9, 7),
  (10, 3);
