SELECT
  artistas.nome AS `artista`,
  albuns.nome AS `album`,
  COUNT(seguindo_artistas.usuario_id) AS `seguidores`
FROM SpotifyClone.seguindo_artistas AS `seguindo_artistas`
INNER JOIN SpotifyClone.artistas AS `artistas` ON artistas.artista_id = seguindo_artistas.artista_id
INNER JOIN SpotifyClone.albuns AS `albuns` ON albuns.artista_id = seguindo_artistas.artista_id
GROUP BY albuns.album_id
ORDER BY `seguidores` DESC, `artista` ASC, `album` ASC;