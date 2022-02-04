SELECT
  COUNT(us.song_id) AS `quantidade_musicas_no_historico`
FROM SpotifyClone.USER_SONG AS us
  INNER JOIN SpotifyClone.USER AS u
    ON us.user_id = u.id
WHERE u.name = 'Bill';
