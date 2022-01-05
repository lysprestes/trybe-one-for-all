SELECT 
  usuarios.nome AS `usuario`,
  COUNT(cancoes.cancao_id) AS `qtde_musicas_ouvidas`,
  FORMAT(SUM(cancoes.duracao_segundos)/60, 2) AS `total_minutos`
FROM SpotifyClone.historico_reproducoes AS `historico_reproducoes`
  INNER JOIN SpotifyClone.usuarios AS `usuarios` ON historico_reproducoes.usuario_id = usuarios.usuario_id
  INNER JOIN SpotifyClone.cancoes AS `cancoes` ON historico_reproducoes.cancao_id = cancoes.cancao_id
GROUP BY usuarios.nome
ORDER BY usuarios.nome;