
DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

-- Table `artistas`
DROP TABLE IF EXISTS `artistas` ;

CREATE TABLE IF NOT EXISTS `artistas` (
  `artista_id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`artista_id`))
ENGINE = InnoDB;

-- Table `albuns`
DROP TABLE IF EXISTS `albuns`;

CREATE TABLE IF NOT EXISTS `albuns` (
  `album_id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `artista_id` INT NOT NULL,
  `ano_lancamento` YEAR(4) NOT NULL,
  PRIMARY KEY (`album_id`),
  CONSTRAINT `fk_artistas`
    FOREIGN KEY (`artista_id`)
    REFERENCES `artistas` (`artista_id`))
ENGINE = InnoDB;

-- Table `cancoes`
DROP TABLE IF EXISTS `cancoes`;

CREATE TABLE IF NOT EXISTS `cancoes` (
  `cancao_id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `album_id` INT NOT NULL,
  `duracao_segundos` INT UNSIGNED NULL,
  PRIMARY KEY (`cancao_id`),
  CONSTRAINT `fk_albuns`
    FOREIGN KEY (`album_id`)
    REFERENCES `albuns` (`album_id`))
ENGINE = InnoDB;

-- Table `planos`
DROP TABLE IF EXISTS `planos`;

CREATE TABLE IF NOT EXISTS `planos` (
  `plano_id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `valor` DECIMAL(5,2) NULL,
  PRIMARY KEY (`plano_id`))
ENGINE = InnoDB;

-- Table `usuarios`
DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE IF NOT EXISTS `usuarios` (
  `usuario_id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `idade` INT NOT NULL,
  `plano_id` INT NOT NULL,
  `data_assinatura` DATE NOT NULL,
  PRIMARY KEY (`usuario_id`),
  CONSTRAINT `fk_planos`
    FOREIGN KEY (`plano_id`)
    REFERENCES `planos` (`plano_id`))
ENGINE = InnoDB;

-- Table `historico_reproducoes`
DROP TABLE IF EXISTS `historico_reproducoes`;

CREATE TABLE IF NOT EXISTS `historico_reproducoes` (
  `usuario_id` INT NOT NULL,
  `cancao_id` INT NOT NULL,
  `data_reproducao` DATETIME NOT NULL,
  CONSTRAINT PRIMARY KEY (`usuario_id`, `cancao_id`),
  FOREIGN KEY (`usuario_id`)
    REFERENCES `usuarios` (`usuario_id`),
  FOREIGN KEY (`cancao_id`)
    REFERENCES `cancoes` (`cancao_id`))
ENGINE = InnoDB;

-- Table `seguindo_artistas`
DROP TABLE IF EXISTS `seguindo_artistas`;

CREATE TABLE IF NOT EXISTS `seguindo_artistas` (
  `usuario_id` INT NOT NULL,
  `artista_id` INT NOT NULL,
  CONSTRAINT PRIMARY KEY (`usuario_id`, `artista_id`),
  FOREIGN KEY (`usuario_id`)
    REFERENCES `usuarios` (`usuario_id`),
  FOREIGN KEY (`artista_id`)
    REFERENCES `artistas` (`artista_id`))
ENGINE = InnoDB;

-- Data for table `artistas`
INSERT INTO `artistas` (`artista_id`, `nome`)
VALUES
  (DEFAULT, 'Walter Phoenix'),
  (DEFAULT, 'Peter Strong'),
  (DEFAULT, 'Lance Day'),
  (DEFAULT, 'Freedie Shannon'),
  (DEFAULT, 'Tyler Isle'),
  (DEFAULT, 'Fog');

-- Data for table `albuns`
INSERT INTO `albuns` (`album_id`, `nome`, `artista_id`, `ano_lancamento`)
VALUES
  (DEFAULT, 'Envious', 1, 1990),
  (DEFAULT, 'Exuberant', 1, 1993),
  (DEFAULT, 'Hallowed Steam', 2, 1995),
  (DEFAULT, 'Incandescent', 3, 1998),
  (DEFAULT, 'Temporary Culture', 4, 2001),
  (DEFAULT, 'Library of liberty', 4, 2003),
  (DEFAULT, 'Chained Down', 5, 2007),
  (DEFAULT, 'Cabinet of fools', 5, 2012),
  (DEFAULT, 'No guarantees', 5, 2015),
  (DEFAULT, 'Apparatus', 6, 2015);

-- Data for table `cancoes`
INSERT INTO `cancoes` (`cancao_id`, `nome`, `album_id`, `duracao_segundos`)
VALUES
  (DEFAULT, 'Soul For Us', 1, 200),
  (DEFAULT, 'Reflections Of Magic', 1, 163),
  (DEFAULT, 'Dance With Her Own', 1, 116),
  (DEFAULT, 'Troubles Of My Inner Fire', 2, 203),
  (DEFAULT, 'Time Fireworks', 2, 152),
  (DEFAULT, 'Magic Circus', 3, 105),
  (DEFAULT, 'Honey, So Do I', 3, 207),
  (DEFAULT, 'Sweetie, Let\'s Go Wild', 3, 139),
  (DEFAULT, 'She Knows', 3, 244),
  (DEFAULT, 'Fantasy For Me', 4, 100),
  (DEFAULT, 'Celebration Of More', 4, 146),
  (DEFAULT, 'Rock His Everything', 4, 223),
  (DEFAULT, 'Home Forever', 4, 231),
  (DEFAULT, 'Diamond Power', 4, 241),
  (DEFAULT, 'Let\'s Be Silly', 4, 132),
  (DEFAULT, 'Thang Of Thunder', 5, 240),
  (DEFAULT, 'Words Of Her Life', 5, 185),
  (DEFAULT, 'Without My Streets', 5, 176),
  (DEFAULT, 'Need Of The Evening', 6, 190),
  (DEFAULT, 'History Of My Roses', 6, 222),
  (DEFAULT, 'Without My Love', 6, 111),
  (DEFAULT, 'Walking And Game', 6, 123),
  (DEFAULT, 'Young And Father', 6, 197),
  (DEFAULT, 'Finding My Traditions', 7, 179),
  (DEFAULT, 'Walking And Man', 7, 229),
  (DEFAULT, 'Hard And Time', 7, 135),
  (DEFAULT, 'Honey, I\'m A Lone Wolf', 7, 150),
  (DEFAULT, 'She Thinks I Won\'t Stay Tonight', 8, 166),
  (DEFAULT, 'He Heard You\'re Bad For Me', 8, 154),
  (DEFAULT, 'He Hopes We Can\'t Stay', 8, 210),
  (DEFAULT, 'I Know I Know', 8, 117),
  (DEFAULT, 'He\'s Walking Away', 9, 159),
  (DEFAULT, 'He\'s Trouble', 9, 138),
  (DEFAULT, 'I Heard I Want To Bo Alone', 9, 120),
  (DEFAULT, 'I Ride Alone', 9, 151),
  (DEFAULT, 'Honey', 10, 79),
  (DEFAULT, 'You Cheated On Me', 10, 95),
  (DEFAULT, 'Wouldn\'t It Be Nice', 10, 213),
  (DEFAULT, 'Baby', 10, 136),
  (DEFAULT, 'You Make Me Feel So..', 10, 83);

-- Data for table `planos`
INSERT INTO `planos` (`plano_id`, `nome`, `valor`) VALUES
  (DEFAULT, 'gratuito', 0),
  (DEFAULT, 'universitário', 5.99),
  (DEFAULT, 'pessoal', 6.99),
  (DEFAULT, 'familiar', 7.99);

-- Data for table `usuarios`
INSERT INTO `usuarios` (`usuario_id`, `nome`, `idade`, `plano_id`, `data_assinatura`)
VALUES
  (DEFAULT, 'Thati', 23, 1, '2019-10-20'),
  (DEFAULT, 'Cintia', 35, 4, '2017-12-30'),
  (DEFAULT, 'Bill', 20, 2, '2019-06-05'),
  (DEFAULT, 'Roger', 45, 3, '2020-05-13'),
  (DEFAULT, 'Norman', 58, 3, '2017-02-17'),
  (DEFAULT, 'Patrick', 33, 4, '2017-01-06'),
  (DEFAULT, 'Vivian', 26, 2, '2018-01-05'),
  (DEFAULT, 'Carol', 19, 2, '2018-02-14'),
  (DEFAULT, 'Angelina', 42, 4, '2018-04-29'),
  (DEFAULT, 'Paul', 46, 4, '2017-01-17');

-- Data for table `historico_reproducoes`
INSERT INTO `historico_reproducoes` (`usuario_id`, `cancao_id`, `data_reproducao`)
VALUES
  (1, 36, '2020-02-28 10:45:55'),
  (1, 25, '2020-05-02 05:30:35'),
  (1, 23, '2020-05-02 05:30:35'),
  (1, 14, '2020-08-05 08:05:17'),
  (1, 15, '2020-09-14 16:32:22'),
  (2, 34, '2020-01-02 07:40:33'),
  (2, 24, '2020-05-16 06:16:22'),
  (2, 21, '2020-10-09 12:27:48'),
  (2, 39, '2020-09-21 13:14:46'),
  (3, 6, '2020-11-13 16:55:13'),
  (3, 3, '2020-12-05 18:38:30'),
  (3, 26, '2020-07-30 10:00:00'),
  (4, 2, '2021-08-15 17:10:10'),
  (4, 35, '2021-07-10 15:20:30'),
  (4, 27, '2021-01-09 01:44:33'),
  (5, 7, '2020-07-03 19:33:28'),
  (5, 12, '2017-02-24 21:14:22'),
  (5, 14, '2020-08-06 15:23:43'),
  (5, 1, '2020-11-10 13:52:27'),
  (6, 38, '2019-02-07 20:33:48'),
  (6, 29, '2017-01-24 00:31:17'),
  (6, 30, '2017-10-12 12:35:20'),
  (6, 22, '2018-05-29 14:56:41'),
  (7, 5, '2018-05-09 22:30:49'),
  (7, 4, '2020-07-27 12:52:58'),
  (7, 11, '2018-01-16 18:40:43'),
  (8, 39, '2018-03-21 16:56:40'),
  (8, 40, '2020-10-18 13:38:05'),
  (8, 32, '2019-05-25 08:14:03'),
  (8, 33, '2021-08-15 21:37:09'),
  (9, 16, '2021-05-24 17:23:45'),
  (9, 17, '2018-12-07 22:48:52'),
  (9, 8, '2021-03-14 06:14:26'),
  (9, 9, '2020-04-01 03:36:00'),
  (10, 20, '2017-02-06 08:21:34'),
  (10, 21, '2017-12-04 05:33:43'),
  (10, 12, '2017-07-27 05:24:49'),
  (10, 13, '2017-12-25 01:03:57');

-- Data for table `seguindo_artistas`
INSERT INTO `seguindo_artistas` (`usuario_id`, `artista_id`)
VALUES
  (1, 1),
  (1, 4),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (3, 1),
  (4, 4),
  (5, 5),
  (5, 6),
  (6, 6),
  (6, 3),
  (6, 1),
  (7, 2),
  (7, 5),
  (8, 1),
  (8, 5),
  (9, 6),
  (9, 4),
  (9, 3),
  (10, 2),
  (10, 6);