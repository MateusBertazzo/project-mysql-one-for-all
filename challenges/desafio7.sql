SELECT 
  artist.name_artist AS artista,
  album.name_album AS album,
  COUNT(fallower.artist_id) AS pessoas_seguidoras
FROM SpotifyClone.albuns AS album
INNER JOIN SpotifyClone.artists AS artist ON album.artist_id = artist.artist_id
INNER JOIN SpotifyClone.follower_artist AS fallower ON fallower.artist_id = album.artist_id
GROUP BY album.album_id
ORDER BY pessoas_seguidoras DESC, artista, album;