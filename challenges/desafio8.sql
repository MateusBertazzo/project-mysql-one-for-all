SELECT
  artist.name_artist AS artista,
  album.name_album AS album
FROM SpotifyClone.artists AS artist
INNER JOIN SpotifyClone.albuns AS album ON artist.artist_id = album.artist_id
WHERE artist.artist_id = 3 ORDER BY album;