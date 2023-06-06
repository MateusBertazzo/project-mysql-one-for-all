SELECT user.name AS pessoa_usuaria,
IF (MAX(YEAR(his.playback_date)) >= '2021', 'Ativa', 'Inativa') AS status_pessoa_usuaria
FROM SpotifyClone.users AS user
INNER JOIN SpotifyClone.history AS his
ON his.user_id = user.user_id
GROUP BY pessoa_usuaria
ORDER BY pessoa_usuaria;