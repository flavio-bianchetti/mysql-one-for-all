SELECT
  s.name AS `cancao`,
  COUNT(us.song_id) AS `reproducoes`
FROM SpotifyClone.USER_SONG AS us
  INNER JOIN SpotifyClone.SONG AS s
    ON us.song_id = s.id
GROUP BY us.song_id
ORDER BY COUNT(us.song_id) DESC,
  s.name
LIMIT 2;
