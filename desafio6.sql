SELECT
  MIN(planos.valor) AS `faturamento_minimo`,
  MAX(planos.valor) AS `faturamento_maximo`,
  FORMAT(AVG(planos.valor), 2) AS `faturamento_medio`,
  SUM(planos.valor) AS `faturamento_total`
FROM SpotifyClone.usuarios
INNER JOIN SpotifyClone.planos ON usuarios.plano_id = planos.plano_id;