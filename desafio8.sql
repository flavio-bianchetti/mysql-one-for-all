SELECT
  art.name AS `artista`,
  alb.name AS `album`
FROM SpotifyClone.ARTIST AS art
  INNER JOIN SpotifyClone.ALBUM AS alb
    ON art.id = alb.artist_id
WHERE art.name = 'Walter Phoenix'
ORDER BY alb.name;
