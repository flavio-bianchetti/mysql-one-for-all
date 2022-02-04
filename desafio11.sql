SELECT
  s.name AS `nome_musica`,
  CASE
    WHEN s.name = 'Dance With Her Own' THEN 'Dance With Trybe'
    WHEN s.name = "Let's Be Silly" THEN "Let's Be Nice"
    WHEN s.name = 'Magic Circus' THEN 'Magic Pull Request'
    WHEN s.name = 'Troubles Of My Inner Fire' THEN 'Troubles Of My Project'
    WHEN s.name = 'Without My Streets' THEN 'Without My Code Review'
  END AS `novo_nome`
FROM SpotifyClone.SONG AS s
  WHERE s.id IN (3, 15, 6, 4, 18)
ORDER BY s.name;
