SELECT 
  COUNT(DISTINCT(SpotifyClone.cancoes.cancao_id)) AS 'cancoes',
  COUNT(DISTINCT(SpotifyClone.artistas.artista_id)) AS 'artistas',
  COUNT(DISTINCT(SpotifyClone.albuns.album_id)) AS 'albuns'
FROM SpotifyClone.cancoes,
    SpotifyClone.artistas,
    SpotifyClone.albuns;
