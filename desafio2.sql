SELECT
  COUNT(DISTINCT son.id) AS `cancoes`,
  COUNT(DISTINCT art.id) AS `artistas`,
  COUNT(DISTINCT alb.id) AS `albuns`
FROM SpotifyClone.SONG AS son
  INNER JOIN SpotifyClone.ALBUM AS alb
    ON son.album_id = alb.id
  INNER JOIN SpotifyClone.ARTIST AS art
    ON alb.artist_id = art.id;
