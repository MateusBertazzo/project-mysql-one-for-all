SELECT user.name AS pessoa_usuaria,
  COUNT(his.playback_date) AS musicas_ouvidas,
  ROUND(SUM(song.duration)/ 60, 2) AS total_minutos
FROM SpotifyClone.users AS user
INNER JOIN SpotifyClone.history AS his ON user.user_id = his.user_id
INNER JOIN SpotifyClone.songs AS song ON song.song_id = his.song_id
GROUP BY pessoa_usuaria
ORDER BY pessoa_usuaria ASC;