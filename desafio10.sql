SELECT
  s.name AS `nome`,
  COUNT(us.song_id) AS `reproducoes`
FROM SpotifyClone.SONG AS s
  INNER JOIN SpotifyClone.USER_SONG AS us
    ON s.id = us.song_id
  INNER JOIN SpotifyClone.USER AS u
    ON us.user_id = u.id
  INNER JOIN SpotifyClone.PLAN AS p
    ON u.plan_id = p.id
WHERE p.name = 'gratuito'
  OR p.name = 'pessoal'
GROUP BY s.name, us.song_id
ORDER BY s.name;
