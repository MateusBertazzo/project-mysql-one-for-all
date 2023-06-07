SELECT song.name_song AS cancao, COUNT(his.song_id) AS reproducoes
FROM SpotifyClone.songs AS song
INNER JOIN SpotifyClone.history AS his ON song.song_id = his.song_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao LIMIT 2;