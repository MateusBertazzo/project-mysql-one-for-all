SELECT
  (SELECT COUNT (song_id) FROM SpotifyClone.songs) AS cancoes,
  (SELECT COUNT (artist_id) FROM SpotifyClone.artists) AS artistas,
  (SELECT COUNT (album_id) FROM SpotifyClone.albuns) AS albuns;

  