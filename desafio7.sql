SELECT
  art.name AS `artista`,
  alb.name AS `album`,
  COUNT(ua.artist_id) AS `seguidores`
FROM SpotifyClone.ARTIST AS art
  INNER JOIN SpotifyClone.ALBUM as alb
    ON alb.artist_id = art.id
  INNER JOIN SpotifyClone.USER_ARTIST AS ua
    ON ua.artist_id = art.id
GROUP BY ua.artist_id, alb.name
ORDER BY COUNT(ua.artist_id) DESC,
  art.name,
  alb.name;
