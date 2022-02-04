SELECT
  MIN(p.value) AS `faturamento_minimo`,
  MAX(p.value) AS `faturamento_maximo`,
  ROUND(AVG(p.value), 2) AS `faturamento_medio`,
  SUM(p.value) AS `faturamento_total`
FROM SpotifyClone.PLAN AS p
  INNER JOIN SpotifyClone.USER AS u
    ON u.plan_id = p.id;
