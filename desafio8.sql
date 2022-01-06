SELECT
  artistas.nome AS `artista`,
  albuns.nome AS `album`
FROM SpotifyClone.albuns AS `albuns`
INNER JOIN SpotifyClone.artistas AS `artistas` ON albuns.artista_id = artistas.artista_id
WHERE artistas.nome = "Walter Phoenix";