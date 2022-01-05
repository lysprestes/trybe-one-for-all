SELECT 
  usuarios.nome AS `usuario`,
    IF(MAX(YEAR(historico_reproducoes.data_reproducao)) = '2021', 'Usuário ativo', 'Usuário inativo') AS `condicao_usuario`
FROM SpotifyClone.historico_reproducoes AS `historico_reproducoes`
  INNER JOIN SpotifyClone.usuarios AS `usuarios` ON historico_reproducoes.usuario_id = usuarios.usuario_id
GROUP BY usuarios.nome
ORDER BY usuarios.nome;