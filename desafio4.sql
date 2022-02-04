SELECT
  u.name AS `usuario`,
  IF(
	  YEAR(MAX(us.reproduction_date)) = '2021',
	    'Usuário ativo',
		'Usuário inativo'
	) AS `condicao_usuario`
FROM SpotifyClone.USER AS u
  INNER JOIN SpotifyClone.USER_SONG AS us
    ON us.user_id = u.id
GROUP BY u.id
ORDER BY u.name;
