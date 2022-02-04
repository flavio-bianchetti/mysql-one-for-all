SELECT
  u.name AS `usuario`,
  COUNT(*) AS `qtde_musicas_ouvidas`,
  ROUND(SUM(s.duration_seconds) / 60, 2) AS `total_minutos`
FROM SpotifyClone.USER AS u
  INNER JOIN SpotifyClone.USER_SONG AS us
    ON us.user_id = u.id
  INNER JOIN SpotifyClone.SONG AS s
    ON s.id = us.song_id
GROUP BY u.id
ORDER BY u.name;
