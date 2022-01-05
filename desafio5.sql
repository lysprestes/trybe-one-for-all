SELECT 
  cancao.nome AS `cancao`,
  COUNT(historico_reproducoes.cancao_id) AS `reproducoes`
FROM SpotifyClone.cancoes AS `cancao`
  INNER JOIN SpotifyClone.historico_reproducoes AS `historico_reproducoes` ON cancao.cancao_id = historico_reproducoes.cancao_id
GROUP BY cancao.nome
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;