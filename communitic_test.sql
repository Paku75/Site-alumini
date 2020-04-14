-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 14, 2020 at 07:42 PM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `communitic_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `annuaire`
--

DROP TABLE IF EXISTS `annuaire`;
CREATE TABLE IF NOT EXISTS `annuaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `promotion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `annuaire`
--

INSERT INTO `annuaire` (`id`, `promotion`) VALUES
(1, '2010-2011'),
(2, '2011-2012'),
(3, '2012-2013'),
(4, '2013-2014'),
(5, '2014-2015'),
(6, '2015-2016'),
(7, '2016-2017'),
(8, '2017-2018'),
(9, '2018-2019'),
(10, '2019-2020');

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contenu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `image_min` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blog_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_23A0E66DAE07E97` (`blog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`id`, `titre`, `contenu`, `created_at`, `image_min`, `image`, `blog_id`) VALUES
(65, 'Sit teos enim rerum.', 'Aliquam ut dolores sit expedita.', '2020-03-20 19:21:48', 'https://lorempixel.com/100/80/?71691', 'https://lorempixel.com/300/250/?55113', 32),
(66, 'Perspiciatis magnam a error et aut ut ab.', 'Nemo est adipisci molestiae voluptates facilis omnis voluptas.', '2019-11-05 09:52:43', 'https://lorempixel.com/100/80/?91064', 'https://lorempixel.com/300/250/?79405', 32),
(67, 'Sit velit accusantium ducimus earum enim dicta.', 'Asperiores nostrum nihil quod veniam odit commodi.', '2020-01-01 12:20:41', 'https://lorempixel.com/100/80/?49100', 'https://lorempixel.com/300/250/?55961', 32),
(68, 'Ut sed aut quis.', 'Impedit iusto quas non qui natus omnis sed.', '2020-03-24 18:46:30', 'https://lorempixel.com/100/80/?31366', 'https://lorempixel.com/300/250/?76921', 32),
(69, 'Sit ut enim aut aut explicabo.', 'Dolor quo ipsam in magni.', '2019-10-09 17:17:45', 'https://lorempixel.com/100/80/?43668', 'https://lorempixel.com/300/250/?51341', 32),
(70, 'Pariatur fuga eligendi quis et omnis esse voluptas.', 'Et velit enim assumenda non adipisci.', '2020-03-06 21:28:47', 'https://lorempixel.com/100/80/?95500', 'https://lorempixel.com/300/250/?38115', 33),
(71, 'Aut expedita eligendi quia exercitationem odio.', 'Et similique nemo eos nihil et vero qui.', '2019-11-05 19:36:29', 'https://lorempixel.com/100/80/?44875', 'https://lorempixel.com/300/250/?58652', 33),
(72, 'Harum veniam molestiae asperiores qui facere exercitationem vero.', 'Ratione quia molestias debitis voluptatem quibusdam aut et.', '2019-12-31 03:43:18', 'https://lorempixel.com/100/80/?59484', 'https://lorempixel.com/300/250/?54668', 33),
(73, 'Impedit velit vitae quam id.', 'Iure dolor nulla placeat debitis qui modi itaque.', '2020-01-06 05:04:21', 'https://lorempixel.com/100/80/?39098', 'https://lorempixel.com/300/250/?76481', 33),
(74, 'Recusandae ipsum assumenda reprehenderit ea id quidem sed.', 'Minus repellat fugit repellendus sunt corrupti eos.', '2019-12-26 14:24:28', 'https://lorempixel.com/100/80/?95966', 'https://lorempixel.com/300/250/?37806', 33),
(75, 'Cum voluptatibus a error ut.', 'Modi beatae velit neque cumque.', '2020-02-11 01:56:41', 'https://lorempixel.com/100/80/?92202', 'https://lorempixel.com/300/250/?20315', 33);

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
CREATE TABLE IF NOT EXISTS `blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_min` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog`
--

INSERT INTO `blog` (`id`, `titre`, `description`, `image_min`, `image`) VALUES
(32, 'Iusto accusantium sit optio cupiditate fugit reprehenderit.', 'Mollitia magni omnis molestias unde deserunt odio. Dolores saepe nobis reprehenderit maiores qui asperiores. Aut tempore maiores nihil porro aut repudiandae. Natus et est ut possimus voluptas.', NULL, NULL),
(33, 'Qui enim repellat dolores.', 'Nam assumenda aliquam sit saepe placeat ullam nemo. Velit provident dolores vero similique repudiandae corporis ipsa. Voluptatem eum ut sequi qui.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `classe`
--

DROP TABLE IF EXISTS `classe`;
CREATE TABLE IF NOT EXISTS `classe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filliere_id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8F87BF9693FA3A0A` (`filliere_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `classe`
--

INSERT INTO `classe` (`id`, `filliere_id`, `nom`) VALUES
(1, 3, 'BTS SIO 1'),
(2, 3, 'BTS SIO 2'),
(3, 3, 'BACHELOR WEB'),
(4, 3, 'BACHELOR SECU'),
(5, 2, 'BTS IRS 1'),
(6, 2, 'BTS IRS 2'),
(7, 2, 'BACHELOR IRS');

-- --------------------------------------------------------

--
-- Table structure for table `classe_annuaire`
--

DROP TABLE IF EXISTS `classe_annuaire`;
CREATE TABLE IF NOT EXISTS `classe_annuaire` (
  `classe_id` int(11) NOT NULL,
  `annuaire_id` int(11) NOT NULL,
  PRIMARY KEY (`classe_id`,`annuaire_id`),
  KEY `IDX_7FA56FA58F5EA509` (`classe_id`),
  KEY `IDX_7FA56FA55132B86A` (`annuaire_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `classe_annuaire`
--

INSERT INTO `classe_annuaire` (`classe_id`, `annuaire_id`) VALUES
(1, 9),
(1, 10),
(2, 9),
(2, 10),
(3, 10),
(4, 10),
(5, 10),
(7, 10);

-- --------------------------------------------------------

--
-- Table structure for table `commentaire`
--

DROP TABLE IF EXISTS `commentaire`;
CREATE TABLE IF NOT EXISTS `commentaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contenu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_67F068BC7294869C` (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `commentaire`
--

INSERT INTO `commentaire` (`id`, `article_id`, `user`, `contenu`, `created_at`) VALUES
(105, 65, 'Emmanuelle-Catherine Huet', 'Cumque quasi nihil facere dolorem repudiandae et quod.', '2020-03-23 11:48:08'),
(106, 65, 'Stéphane Leduc-Vaillant', 'Ad quae quidem omnis numquam magnam et.', '2020-03-25 10:20:39'),
(107, 65, 'Raymond de Gallet', 'Animi eum delectus repellendus aliquid temporibus officiis dolores.', '2020-03-28 17:24:52'),
(108, 65, 'Dorothée Moulin', 'Natus optio magnam qui inventore neque vitae incidunt rem.', '2020-04-05 16:45:49'),
(109, 65, 'Marcelle Thibault', 'Aliquam distinctio nostrum vel perspiciatis.', '2020-03-23 11:41:05'),
(110, 65, 'Alexandre Raynaud', 'Voluptatem nesciunt alias saepe ipsa neque nesciunt qui quaerat.', '2020-03-22 16:40:10'),
(111, 65, 'Charlotte Brunel', 'Doloribus aut facere labore.', '2020-03-28 01:29:13'),
(112, 66, 'Danielle Mercier', 'Modi quo veritatis recusandae odio quae nobis soluta.', '2020-02-12 11:47:05'),
(113, 66, 'Eugène Becker-Moreno', 'Debitis voluptate quisquam rerum.', '2020-03-12 02:31:25'),
(114, 66, 'Laurent Pires', 'Quisquam quo libero officia fugit est quos.', '2020-03-14 13:27:03'),
(115, 66, 'Sophie Lopes', 'Sint laboriosam eaque ab totam.', '2020-03-31 17:33:52'),
(116, 67, 'Brigitte Thierry-Laine', 'Officiis quae assumenda ut et provident blanditiis.', '2020-01-25 19:32:18'),
(117, 67, 'Margaux Cordier-Fleury', 'Et non a ab aut esse.', '2020-04-01 18:10:19'),
(118, 67, 'Adrienne Bertrand-Thomas', 'Excepturi ex praesentium doloribus qui laboriosam omnis ut.', '2020-01-27 18:04:14'),
(119, 67, 'Thierry-Xavier Berger', 'Nam et quisquam beatae blanditiis voluptatum qui tempora.', '2020-02-27 16:52:50'),
(120, 67, 'Valérie Fernandez', 'Sapiente dicta sint aliquam exercitationem.', '2020-02-19 09:36:30'),
(121, 68, 'Sébastien Pelletier', 'Eveniet ducimus culpa quos laborum nulla fugiat.', '2020-03-26 05:38:10'),
(122, 68, 'Lucas Brun', 'Perspiciatis eum molestiae quisquam.', '2020-03-31 03:24:21'),
(123, 68, 'Tristan Albert', 'Quia provident id placeat voluptas minima temporibus voluptates laboriosam.', '2020-03-31 20:55:20'),
(124, 68, 'Éric Boulay', 'Nihil quis doloribus nemo.', '2020-03-27 04:56:54'),
(125, 68, 'Capucine Blanc', 'Nesciunt quis rerum laboriosam pariatur.', '2020-04-06 11:42:13'),
(126, 68, 'Michelle Besnard', 'Eos quidem vel iusto suscipit iusto dolor.', '2020-04-05 00:18:12'),
(127, 69, 'Émilie Diallo', 'Rerum eveniet sapiente optio qui culpa.', '2020-02-29 02:24:37'),
(128, 69, 'Zoé Gilles', 'Quisquam provident in totam beatae molestias modi non.', '2020-02-13 14:59:02'),
(129, 69, 'Alphonse Reynaud', 'Voluptates perspiciatis sint voluptatem autem ducimus beatae.', '2019-11-01 15:09:05'),
(130, 69, 'Constance Marques', 'Consequatur quia nesciunt dignissimos omnis.', '2019-12-24 17:38:25'),
(131, 69, 'Catherine Normand', 'Magni eos vero placeat qui eius provident.', '2020-01-09 09:38:09'),
(132, 69, 'Monique-Diane David', 'Repudiandae aut esse quia.', '2019-11-11 23:14:28'),
(133, 69, 'Édouard Da Silva', 'Reiciendis dolore voluptatem ut reprehenderit excepturi reprehenderit ducimus ut.', '2020-03-24 06:51:57'),
(134, 70, 'Auguste-François Marchal', 'Nisi omnis velit qui quis.', '2020-03-11 18:38:04'),
(135, 70, 'Alain Dumas', 'Fugit distinctio qui non quam consequatur delectus quia nesciunt.', '2020-03-31 13:15:03'),
(136, 70, 'Adèle David', 'Eos nulla laborum et placeat fuga et incidunt.', '2020-03-12 16:38:15'),
(137, 70, 'Adélaïde Vaillant', 'Sapiente qui atque non doloremque.', '2020-03-12 17:56:01'),
(138, 70, 'Vincent Lopez', 'Porro et quia excepturi repellat.', '2020-03-27 14:16:09'),
(139, 70, 'Christelle Boutin', 'Ea similique magni non autem.', '2020-03-14 14:34:07'),
(140, 70, 'Jean Marchand-Henry', 'Earum quidem temporibus repudiandae vel et velit.', '2020-03-11 08:47:20'),
(141, 71, 'Marine-Alice Moulin', 'Modi dicta aut sit eos ut.', '2019-12-21 12:55:32'),
(142, 71, 'Astrid Gilbert-De Sousa', 'Non dolorem dolor maiores vero.', '2020-02-19 08:05:40'),
(143, 71, 'Andrée de la Begue', 'Et ea explicabo ut aut eum.', '2020-02-10 05:25:42'),
(144, 71, 'Isaac Le Couturier', 'Dolor non a facere voluptas placeat maiores quam.', '2020-01-22 22:02:43'),
(145, 71, 'Louise-Maryse Bourdon', 'Nihil incidunt quia debitis culpa cumque sit sunt ut.', '2020-02-24 22:15:17'),
(146, 71, 'Josette Germain', 'Est aut veritatis ut tempore possimus eum laboriosam.', '2019-12-24 05:08:21'),
(147, 71, 'Louise Pruvost', 'Modi similique magnam itaque voluptates quia.', '2020-01-21 21:40:55'),
(148, 72, 'Anastasie Renaud', 'Itaque facilis totam labore temporibus consequatur.', '2020-03-20 18:45:03'),
(149, 72, 'Victor Allard', 'Enim necessitatibus quas corporis eius.', '2020-03-06 04:14:23'),
(150, 72, 'Jeanne-Margaux Traore', 'Nesciunt id quibusdam fugiat culpa.', '2020-01-23 21:54:14'),
(151, 72, 'Michel Gimenez', 'Animi voluptatem aspernatur error architecto.', '2020-03-17 04:06:14'),
(152, 72, 'Dominique Delannoy', 'Quis officia fugit aliquam et corporis ab assumenda.', '2020-02-13 00:07:14'),
(153, 72, 'Rémy Guillot', 'Voluptate maiores saepe voluptate perferendis dolore et dolorem nostrum.', '2020-01-09 00:43:14'),
(154, 73, 'Emmanuelle-Élise Brunet', 'Illum doloremque exercitationem dolorum numquam veritatis reiciendis.', '2020-02-17 08:29:13'),
(155, 73, 'Marthe Bourdon', 'Aut deleniti deserunt autem ut.', '2020-02-20 04:22:31'),
(156, 73, 'Simone Mary', 'Qui assumenda labore eum enim ut dolorem modi quis.', '2020-03-20 15:41:33'),
(157, 73, 'Marc du Guyot', 'Aut nobis consectetur illum vero optio eos culpa in.', '2020-04-07 07:38:40'),
(158, 74, 'Lucie Lebon', 'Laudantium est mollitia eveniet reiciendis ipsam et.', '2020-03-08 20:55:44'),
(159, 74, 'Sophie Rossi', 'Voluptate fugiat rerum pariatur exercitationem.', '2020-03-02 03:02:43'),
(160, 74, 'Maurice Joubert', 'Tenetur rerum excepturi officiis.', '2020-03-10 14:26:36'),
(161, 74, 'Thérèse Gay', 'Voluptatem nisi mollitia repellat illum eaque.', '2020-03-14 14:31:43'),
(162, 75, 'Emmanuel Benoit', 'Laboriosam perspiciatis veritatis cum consequatur corrupti.', '2020-03-08 05:45:17'),
(163, 75, 'Richard Charpentier', 'Earum eius molestias qui expedita est.', '2020-02-16 07:17:32'),
(164, 75, 'Jacqueline Diallo', 'Quo vitae ab alias aut incidunt incidunt beatae.', '2020-03-07 23:47:03'),
(165, 75, 'Marcelle Pinto', 'Voluptate consequatur et possimus omnis facilis enim laudantium.', '2020-02-17 22:22:56'),
(166, 75, 'Édouard Brunel', 'Quis at beatae molestiae a et qui dignissimos.', '2020-03-18 09:35:28'),
(167, 75, 'André Jacques', 'Tempore illum iure laborum numquam consequatur perspiciatis.', '2020-03-07 16:10:01'),
(168, 75, 'Denis Dupre', 'Magnam beatae et maxime laborum quis earum ea culpa.', '2020-03-14 05:05:32'),
(169, 75, 'Renée Navarro', 'Voluptatibus distinctio perspiciatis voluptatem.', '2020-02-17 17:23:48'),
(170, 75, 'Inès Le Faure', 'Maxime ab eos qui quis quod.', '2020-03-08 23:49:29');

-- --------------------------------------------------------

--
-- Table structure for table `filliere`
--

DROP TABLE IF EXISTS `filliere`;
CREATE TABLE IF NOT EXISTS `filliere` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `filliere`
--

INSERT INTO `filliere` (`id`, `nom`) VALUES
(1, 'Commerce'),
(2, 'Ressource Humaine'),
(3, 'Informatique');

-- --------------------------------------------------------

--
-- Table structure for table `migration_versions`
--

DROP TABLE IF EXISTS `migration_versions`;
CREATE TABLE IF NOT EXISTS `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20200406131331', '2020-04-06 13:15:06'),
('20200406154331', '2020-04-06 15:46:34'),
('20200406160213', '2020-04-06 16:02:23'),
('20200406161420', '2020-04-06 16:16:57'),
('20200406162451', '2020-04-06 16:25:39'),
('20200408152256', '2020-04-08 15:23:24'),
('20200408161314', '2020-04-08 16:13:26'),
('20200414191436', '2020-04-14 19:15:34');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  `adresse` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ville` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cp` int(11) DEFAULT NULL,
  `cv` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `etat` tinyint(1) DEFAULT NULL,
  `login` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mdp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nom`, `prenom`, `tel`, `date_naissance`, `adresse`, `ville`, `cp`, `cv`, `linkedin`, `etat`, `login`, `mdp`, `image`, `email`) VALUES
(21, 'Baudry', 'Paulette', NULL, NULL, '21, rue de Boulay', 'Etienne-les-Bains', NULL, NULL, NULL, 0, 'Charrier', 'voluptatibus', NULL, 'gthomas@example.org'),
(22, 'Chretien', 'Capucine', NULL, NULL, '91, boulevard Lelievre', 'Guillot-sur-Jacob', NULL, NULL, NULL, 0, 'Klein', 'sint', NULL, 'laetitia15@example.org'),
(23, 'Dumont', 'Gabriel', NULL, NULL, '14, chemin Tristan Pruvost', 'Perrot', NULL, NULL, NULL, 0, 'Bourgeois', 'et', NULL, 'pleleu@example.net'),
(24, 'Arnaud', 'Benjamin', NULL, NULL, '8, rue Marques', 'Charrier-sur-Mer', NULL, NULL, NULL, 0, 'Cordier', 'labore', NULL, 'fdaniel@example.com'),
(25, 'Schneider', 'Luc', NULL, NULL, '10, place Margot Martel', 'Sanchez', NULL, NULL, NULL, 0, 'Chevallier', 'qui', NULL, 'margot.antoine@example.net'),
(26, 'Lemonnier', 'Rémy', NULL, NULL, '18, place Delmas', 'FabreBourg', NULL, NULL, NULL, 0, 'Lebon', 'repellat', NULL, 'xmaury@example.net'),
(27, 'Mary', 'Arnaude', NULL, NULL, '88, place de Lefort', 'Navarro-les-Bains', NULL, NULL, NULL, 0, 'Loiseau', 'reiciendis', NULL, 'anais80@example.net'),
(28, 'Rey', 'Roland', NULL, NULL, '548, boulevard de Leconte', 'Bazin', NULL, NULL, NULL, 0, 'Jacques', 'asperiores', NULL, 'ohubert@example.net'),
(29, 'Remy', 'Zacharie', NULL, NULL, '4, rue Éric Schneider', 'Diallo', NULL, NULL, NULL, 0, 'Lemaitre', 'aut', NULL, 'juliette.lejeune@example.org'),
(30, 'Martinez', 'Christine', NULL, NULL, '7, rue Michaud', 'Pages', NULL, NULL, NULL, 0, 'Alves', 'voluptas', NULL, 'mmillet@example.com'),
(31, 'Dubois', 'Alexandria', NULL, NULL, '8, rue Loiseau', 'Gimenez', NULL, NULL, NULL, 0, 'Maurice', 'sapiente', NULL, 'wgaillard@example.net'),
(32, 'Collet', 'Jacqueline', NULL, NULL, 'avenue Jeannine Hubert', 'Neveu', NULL, NULL, NULL, 0, 'Colas', 'molestiae', NULL, 'ilefebvre@example.org'),
(33, 'Picard', 'Julien', NULL, NULL, '4, avenue Aurore Dufour', 'Hamon-les-Bains', NULL, NULL, NULL, 0, 'Teixeira', 'et', NULL, 'brigitte.valette@example.net'),
(34, 'Coste', 'Sébastien', NULL, NULL, '556, rue Chartier', 'Lefebvrenec', NULL, NULL, NULL, 0, 'Boyer', 'rerum', NULL, 'lucas.sabine@example.net'),
(35, 'Perret', 'Madeleine', NULL, NULL, '58, boulevard de Cousin', 'Navarro', NULL, NULL, NULL, 0, 'Daniel', 'soluta', NULL, 'louise.legall@example.com'),
(36, 'Barre', 'Vincent', NULL, NULL, '67, rue de Chevallier', 'Albert-sur-Guillot', NULL, NULL, NULL, 0, 'Giraud', 'facere', NULL, 'ipasquier@example.net'),
(37, 'Chauvet', 'Luce', NULL, NULL, '9, impasse Roger Texier', 'Mercier-sur-Peron', NULL, NULL, NULL, 0, 'Lefevre', 'velit', NULL, 'adrien79@example.org'),
(38, 'Sanchez', 'Franck', NULL, NULL, '45, boulevard Amélie Rodrigues', 'Courtois', NULL, NULL, NULL, 0, 'Arnaud', 'adipisci', NULL, 'obarbier@example.com'),
(39, 'Leveque', 'Vincent', NULL, NULL, '52, rue de Charles', 'SamsonBourg', NULL, NULL, NULL, 0, 'Bonnet', 'autem', NULL, 'mmarin@example.com'),
(40, 'Dupuis', 'Manon', NULL, NULL, '57, rue de Sauvage', 'BousquetBourg', NULL, NULL, NULL, 0, 'Guilbert', 'quia', NULL, 'jacquet.philippine@example.org');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `FK_23A0E66DAE07E97` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`);

--
-- Constraints for table `classe`
--
ALTER TABLE `classe`
  ADD CONSTRAINT `FK_8F87BF9693FA3A0A` FOREIGN KEY (`filliere_id`) REFERENCES `filliere` (`id`);

--
-- Constraints for table `classe_annuaire`
--
ALTER TABLE `classe_annuaire`
  ADD CONSTRAINT `FK_7FA56FA55132B86A` FOREIGN KEY (`annuaire_id`) REFERENCES `annuaire` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_7FA56FA58F5EA509` FOREIGN KEY (`classe_id`) REFERENCES `classe` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `FK_67F068BC7294869C` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
