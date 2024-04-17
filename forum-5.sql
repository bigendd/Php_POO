-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : lun. 15 avr. 2024 à 14:46
-- Version du serveur : 5.7.39
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `forum`
--

-- --------------------------------------------------------

--
-- Structure de la table `forum_mp_msg`
--

CREATE TABLE `forum_mp_msg` (
  `id` int(11) NOT NULL,
  `mp_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `sender_ip` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_posted` datetime NOT NULL,
  `msg` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `msg_read` tinyint(4) NOT NULL DEFAULT '0',
  `ratings` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `forum_mp_msg`
--

INSERT INTO `forum_mp_msg` (`id`, `mp_id`, `user_id`, `sender_id`, `sender_ip`, `date_posted`, `msg`, `receiver_id`, `msg_read`, `ratings`) VALUES
(35, 25, 25, 25, '::1', '2024-04-04 23:45:47', 'C\'est le premier message', 26, 0, NULL),
(36, 25, 26, 25, '::1', '2024-04-04 23:45:47', 'C\'est le premier message', 26, 0, NULL),
(37, 26, 25, 25, '::1', '2024-04-04 23:46:10', 'C\'est le second message', 26, 0, NULL),
(38, 26, 26, 25, '::1', '2024-04-04 23:46:10', 'C\'est le second message', 26, 0, NULL),
(39, 28, 25, 25, '::1', '2024-04-04 23:47:15', 'Ceci est le message n°3', 26, 0, NULL),
(40, 28, 26, 25, '::1', '2024-04-04 23:47:15', 'Ceci est le message n°3', 26, 0, NULL),
(41, 28, 25, 25, '::1', '2024-04-05 00:32:14', 'C\'est le numéro 4', 26, 0, NULL),
(42, 28, 26, 25, '::1', '2024-04-05 00:32:14', 'C\'est le numéro 4', 26, 0, NULL),
(43, 28, 25, 25, '::1', '2024-04-05 09:22:14', 'Test 5', 26, 0, NULL),
(44, 28, 26, 25, '::1', '2024-04-05 09:22:14', 'Test 5', 26, 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `forum_mp_subject`
--

CREATE TABLE `forum_mp_subject` (
  `id` int(11) NOT NULL,
  `msg` mediumtext COLLATE utf8mb4_unicode_ci,
  `owner_id` int(11) DEFAULT NULL,
  `owner_ip` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_sent` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `forum_mp_subject`
--

INSERT INTO `forum_mp_subject` (`id`, `msg`, `owner_id`, `owner_ip`, `date_sent`, `date_updated`) VALUES
(25, 'Message n°1', 25, '::1', '2024-04-04 23:45:47', NULL),
(26, 'Message n°2', 25, '::1', '2024-04-04 23:46:10', NULL),
(28, 'Message n°4', 25, '::1', '2024-04-05 00:32:14', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `forum_polls`
--

CREATE TABLE `forum_polls` (
  `id` int(11) NOT NULL,
  `poll_question` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `poll_start` datetime NOT NULL,
  `poll_end` datetime NOT NULL,
  `active` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `forum_polls_options`
--

CREATE TABLE `forum_polls_options` (
  `id` int(11) NOT NULL,
  `poll_id` int(11) NOT NULL,
  `poll_option` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `poll_votes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `forum_post`
--

CREATE TABLE `forum_post` (
  `id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `msg` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_ip` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `edited_by_id` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `post_hide` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `forum_post`
--

INSERT INTO `forum_post` (`id`, `topic_id`, `msg`, `user_id`, `user_ip`, `created_at`, `updated_at`, `edited_by_id`, `rating`, `post_hide`) VALUES
(1, 7, '<p>Mais c\'est rigolo aussi.</p><p>&nbsp;</p><p><i>Bref,</i> <strong>amusez-vous</strong></p>', 25, '::1', '2024-04-05 22:52:29', '2024-04-05 22:52:29', 0, NULL, 0),
(2, 8, '<p>Avec un très bon oreillé</p>', 25, '::1', '2024-04-05 22:55:59', '2024-04-05 22:55:59', 0, NULL, 0),
(4, 10, '<p>ça <i>gagne pas la ligue</i> des lampions.</p>', 25, '::1', '2024-04-05 23:10:43', '2024-04-05 23:10:43', 0, NULL, 0),
(5, 11, '<p>Ah ben ça alors, les jedis font de l\'aikido.</p>', 25, '::1', '2024-04-05 23:18:49', '2024-04-05 23:18:49', 0, NULL, 0),
(7, 13, '<p>Et ce sera le PSG</p>', 25, '::1', '2024-04-06 08:50:59', '2024-04-06 08:50:59', 0, NULL, 0),
(8, 14, '<p>La technique ultime ?</p>', 25, '::1', '2024-04-06 08:58:25', '2024-04-06 08:58:25', 0, NULL, 0),
(9, 15, '<p>Neutraliser son adversaire.</p>', 25, '::1', '2024-04-06 10:01:05', '2024-04-06 10:01:05', 0, NULL, 0),
(10, 16, '<p>Saisie de la main</p>', 25, '::1', '2024-04-06 21:09:31', '2024-04-06 21:09:31', 0, NULL, 0),
(11, 17, '<p>Tralala</p>', 25, '::1', '2024-04-07 23:00:56', '2024-04-07 23:00:56', 0, NULL, 0),
(12, 18, '<p>Pif paf poud</p>', 25, '::1', '2024-04-07 23:06:58', '2024-04-07 23:06:58', 0, NULL, 0),
(13, 19, '<p>Passer par dessous</p>', 25, '::1', '2024-04-08 07:10:51', '2024-04-08 07:10:51', 0, NULL, 0),
(14, 20, '<p>Le ballon est sorti en Tuche</p>', 25, '::1', '2024-04-08 09:36:42', '2024-04-08 09:36:42', 0, NULL, 0),
(17, 20, '<p>Tralala</p>', 25, '::1', '2024-04-08 10:14:44', '2024-04-08 10:14:44', 0, NULL, 0),
(18, 20, '<p>Monaco corico</p>', 25, '::1', '2024-04-08 10:15:40', '2024-04-08 10:15:40', 0, NULL, 0),
(19, 13, '<p>bouh</p>', 25, '::1', '2024-04-08 10:20:14', '2024-04-08 10:20:14', 0, NULL, 0),
(20, 20, '<p>tralalal</p>', 25, '::1', '2024-04-08 13:09:14', '2024-04-08 13:09:14', 0, NULL, 0),
(21, 8, '<p>tralala</p>', 25, '::1', '2024-04-08 13:10:38', '2024-04-08 13:10:38', 0, NULL, 0),
(22, 7, '<p>tralala</p>', 25, '::1', '2024-04-08 13:11:07', '2024-04-08 13:11:07', 0, NULL, 0),
(23, 20, '<p>C\'est tout bon&nbsp;</p>', 25, '::1', '2024-04-08 13:40:02', '2024-04-08 13:40:02', 0, NULL, 0),
(24, 7, '<p>tralala</p>', 25, '::1', '2024-04-08 13:47:43', '2024-04-08 13:47:43', 0, NULL, 0),
(25, 20, '<p>ça marche</p>', 25, '::1', '2024-04-08 13:48:05', '2024-04-08 13:48:05', 0, NULL, 0),
(26, 7, '<p>Merseille la vieiilee</p>', 25, '::1', '2024-04-08 13:50:08', '2024-04-08 13:50:08', 0, NULL, 0),
(27, 11, '<p>qdfqds</p>', 25, '::1', '2024-04-08 13:53:10', '2024-04-08 13:53:10', 0, NULL, 0),
(28, 7, '<p>pouetpouet</p>', 25, '::1', '2024-04-08 13:53:47', '2024-04-08 13:53:47', 0, NULL, 0),
(29, 23, '<p>Aunord c\'était les corons.</p>', 25, '::1', '2024-04-08 13:54:29', '2024-04-08 13:54:29', 0, NULL, 0),
(33, 14, 'bouh', 25, '::1', '2024-04-12 16:32:07', NULL, 25, NULL, 0),
(34, 14, 'sdfsdf', 25, '::1', '2024-04-12 16:32:40', NULL, 25, NULL, 0),
(35, 14, 'sdfsdf', 25, '::1', '2024-04-12 16:32:50', NULL, 25, NULL, 0),
(36, 20, 'Vive l-Saint Etienne', 25, '::1', '2024-04-12 16:34:42', NULL, 25, NULL, 0),
(37, 13, 'C\'est beau', 25, '::1', '2024-04-15 10:54:39', NULL, 25, NULL, 0),
(38, 24, 'Et recule', 25, '::1', '2024-04-15 09:19:17', '2024-04-15 09:19:17', 0, NULL, 0),
(39, 25, 'et paf', 25, '::1', '2024-04-15 09:19:36', '2024-04-15 09:19:36', 0, NULL, 0),
(40, 27, 'Aussi', 25, '::1', '2024-04-15 09:21:53', '2024-04-15 09:21:53', 0, NULL, 0),
(41, 28, 'tralala', 25, '::1', '2024-04-15 09:24:21', '2024-04-15 09:24:21', 0, NULL, 0),
(42, 29, '<p>Les armes</p>', 25, '::1', '2024-04-15 11:43:27', '2024-04-15 11:43:27', 0, NULL, 0),
(43, 17, '<p>Autre réponse</p>', 25, '::1', '2024-04-15 13:45:15', NULL, 25, NULL, 0);

-- --------------------------------------------------------

--
-- Structure de la table `forum_theme`
--

CREATE TABLE `forum_theme` (
  `id` int(11) NOT NULL,
  `nom` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme_position` tinyint(4) NOT NULL DEFAULT '0',
  `theme_img_url` int(11) NOT NULL,
  `forum_hide` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `forum_theme`
--

INSERT INTO `forum_theme` (`id`, `nom`, `theme_position`, `theme_img_url`, `forum_hide`) VALUES
(1, 'Martial Art', 0, 0, 0),
(2, 'Football', 0, 0, 0),
(3, 'Vehicle', 0, 0, 0),
(4, 'La céramiques', 0, 0, 0),
(5, 'Les fleurs', 0, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `forum_topic`
--

CREATE TABLE `forum_topic` (
  `id` int(11) NOT NULL,
  `title` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_ip` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme_id` int(11) NOT NULL DEFAULT '0',
  `poll_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `first_post_id` int(11) NOT NULL DEFAULT '0',
  `first_post_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_post_id` int(11) NOT NULL DEFAULT '0',
  `last_post_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `num_views` int(11) NOT NULL DEFAULT '0',
  `num_replies` int(11) NOT NULL DEFAULT '0',
  `topic_hide` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `forum_topic`
--

INSERT INTO `forum_topic` (`id`, `title`, `user_id`, `user_ip`, `theme_id`, `poll_id`, `created_at`, `updated_at`, `first_post_id`, `first_post_date`, `last_post_id`, `last_post_date`, `num_views`, `num_replies`, `topic_hide`) VALUES
(7, 'Marseille, c\'est pas pareil', 25, '::1', 2, NULL, '2024-04-06 00:52:29', NULL, 1, '2024-04-05 22:52:29', 0, '2024-04-05 22:52:29', 0, 5, 0),
(8, 'L\'aikido, l\'art martial pour faire dodo', 25, '::1', 1, NULL, '2024-04-06 00:55:59', NULL, 0, '2024-04-05 22:55:59', 0, '2024-04-05 22:55:59', 0, 2, 0),
(10, 'Paris, c\'est tout petit', 25, '::1', 2, NULL, '2024-04-06 01:10:43', NULL, 0, '2024-04-05 23:10:43', 0, '2024-04-05 23:10:43', 0, 1, 0),
(11, 'Kote gaeshi dans la série Obi Wan', 25, '::1', 1, NULL, '2024-04-06 01:18:49', NULL, 0, '2024-04-06 01:18:49', 0, NULL, 0, 2, 0),
(13, 'Lyon en finale de la coupe de France', 25, '::1', 2, NULL, '2024-04-06 10:50:59', NULL, 0, '2024-04-06 10:50:59', 0, '2024-04-06 10:50:59', 0, 2, 0),
(14, 'Ikkyo, le premier principe', 25, '::1', 1, NULL, '2024-04-06 10:58:25', NULL, 0, '2024-04-06 10:58:25', 0, '2024-04-06 10:58:25', 0, 1, 0),
(15, 'Nikkyo, la force du poignet', 25, '::1', 1, NULL, '2024-04-06 12:01:05', NULL, 0, '2024-04-06 12:01:05', 0, '2024-04-06 12:01:05', 0, 1, 0),
(16, 'SanKyo, troisième principe', 25, '::1', 1, NULL, '2024-04-06 23:09:31', NULL, 0, '2024-04-06 23:09:31', 0, '2024-04-06 23:09:31', 0, 1, 0),
(17, 'Yonkyo', 25, '::1', 1, NULL, '2024-04-08 01:00:56', NULL, 0, '2024-04-08 01:00:56', 0, '2024-04-08 01:00:56', 0, 1, 0),
(18, 'GoKyo, neutraliser le couteau', 25, '::1', 1, NULL, '2024-04-08 01:06:58', NULL, 0, '2024-04-08 01:06:58', 0, '2024-04-08 01:06:58', 0, 1, 0),
(19, 'Shi Ho nage', 25, '::1', 1, NULL, '2024-04-08 09:10:51', NULL, 0, '2024-04-08 09:10:51', 0, '2024-04-08 09:10:51', 0, 1, 0),
(20, 'Ô Monaco', 25, '::1', 2, NULL, '2024-04-08 11:36:42', NULL, 0, '2024-04-08 11:36:42', 0, '2024-04-08 11:36:42', 0, 6, 0),
(23, 'Lille y lit lee lit li lee', 25, '::1', 2, NULL, '2024-04-08 15:54:29', NULL, 0, '2024-04-08 15:54:29', 0, '2024-04-08 15:54:29', 0, 1, 0),
(24, 'Lyon avance', 25, '::1', 2, NULL, '2024-04-15 11:19:17', NULL, 0, '2024-04-15 11:19:17', 0, '2024-04-15 11:19:17', 0, 1, 0),
(25, 'Marseille recule', 25, '::1', 2, NULL, '2024-04-15 11:19:36', NULL, 0, '2024-04-15 11:19:36', 0, '2024-04-15 11:19:36', 0, 1, 0),
(27, 'Rennes', 25, '::1', 2, NULL, '2024-04-15 11:21:53', NULL, 0, '2024-04-15 11:21:53', 0, '2024-04-15 11:21:53', 0, 1, 0),
(28, 'Montpellier', 25, '::1', 2, NULL, '2024-04-15 11:24:21', NULL, 0, '2024-04-15 11:24:21', 0, '2024-04-15 11:24:21', 0, 1, 0),
(29, 'Le Bokken et le Jo', 25, '::1', 1, NULL, '2024-04-15 13:43:27', NULL, 0, '2024-04-15 13:43:27', 0, '2024-04-15 13:43:27', 0, 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `forum_users_ban`
--

CREATE TABLE `forum_users_ban` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_ip` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_email` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `msg` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `ban_date` datetime NOT NULL,
  `ban_expire` datetime DEFAULT NULL,
  `ban_moderator` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `gender_id` int(11) DEFAULT NULL,
  `level_id` tinyint(4) NOT NULL DEFAULT '0',
  `username` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar_link` mediumtext COLLATE utf8mb4_unicode_ci,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_show` tinyint(4) NOT NULL DEFAULT '0',
  `email_blocked` tinyint(4) NOT NULL DEFAULT '0',
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(180) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipcode` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `registration_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `registration_ip` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_update_date` datetime DEFAULT NULL,
  `number_posts` int(11) DEFAULT NULL,
  `number_pm` int(11) DEFAULT NULL,
  `blocked` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `token` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `gender_id`, `level_id`, `username`, `avatar_link`, `email`, `email_show`, `email_blocked`, `password`, `lastname`, `firstname`, `address`, `country`, `city`, `zipcode`, `birth_date`, `registration_date`, `registration_ip`, `last_update_date`, `number_posts`, `number_pm`, `blocked`, `active`, `token`) VALUES
(25, NULL, 4, 'Zolive', NULL, 'oallegret@gmail.com', 0, 0, '$argon2id$v=19$m=131072,t=4,p=2$TjFncGFXM3lHeVRCTTVBRA$7UnoTgktJLr3LmehArVWtu8XVGovmP0kq/a4lrjrkXo', 'Allegret', 'Bob', '55 route de Limonest', 'France', 'Lissieu', '69380', '1968-04-18', '2024-03-11 13:17:49', '::1', NULL, NULL, NULL, 0, 0, '$2y$10$cKoE2ixoakX5d68BQebNoOWlexfwClBqArZ9LO8c9Yq.gm9GwRkF2'),
(26, NULL, 0, 'Queen of England', NULL, 'camilla@hotmail.com', 0, 1, '$argon2id$v=19$m=131072,t=4,p=2$SXplaTU5T1NLd0NxdXVyQQ$LeNB6ryGDpPuw3wvAk0bhBPqNlQpauwDVxINe0teeRQ', 'Dybbroe', 'Camilla', 'Radersvej', 'Denmark', 'Aarhus', '8000', '1990-03-12', '2024-03-11 15:11:20', '::1', NULL, NULL, NULL, 0, 0, '$2y$10$Qwr0qAulu2oSeABMGD6NJOBaGQDEyHFnJC1wY3zSaR.fUHgfPWTqi');

-- --------------------------------------------------------

--
-- Structure de la table `user_blocked`
--

CREATE TABLE `user_blocked` (
  `id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `requester_id` int(11) NOT NULL,
  `blocked_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user_gender`
--

CREATE TABLE `user_gender` (
  `id` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user_gender`
--

INSERT INTO `user_gender` (`id`, `name`) VALUES
(2, 'Female'),
(1, 'Male'),
(3, 'Non-Binary'),
(6, 'Not Specified'),
(5, 'Queer'),
(4, 'Transgender');

-- --------------------------------------------------------

--
-- Structure de la table `user_level`
--

CREATE TABLE `user_level` (
  `id` int(11) NOT NULL,
  `level` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user_level`
--

INSERT INTO `user_level` (`id`, `level`) VALUES
(1, 'Guest'),
(2, 'Member'),
(3, 'Moderator'),
(4, 'Administrator');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `forum_mp_msg`
--
ALTER TABLE `forum_mp_msg`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `forum_mp_subject`
--
ALTER TABLE `forum_mp_subject`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_ExchangeSenderId_ParticipantUserId` (`owner_id`);

--
-- Index pour la table `forum_polls`
--
ALTER TABLE `forum_polls`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Index pour la table `forum_polls_options`
--
ALTER TABLE `forum_polls_options`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `poll_id` (`poll_id`);

--
-- Index pour la table `forum_post`
--
ALTER TABLE `forum_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_PostUserId_UserID` (`user_id`),
  ADD KEY `FK_PostTopicId_TopicID` (`topic_id`);

--
-- Index pour la table `forum_theme`
--
ALTER TABLE `forum_theme`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `forum_topic`
--
ALTER TABLE `forum_topic`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQ_Title_IdTheme` (`title`,`theme_id`),
  ADD KEY `FK_TopicUserId_UserID` (`user_id`),
  ADD KEY `FK_TopicThemeId_ThemeID` (`theme_id`);

--
-- Index pour la table `forum_users_ban`
--
ALTER TABLE `forum_users_ban`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `FK_UsergenderId_genderId` (`gender_id`);

--
-- Index pour la table `user_blocked`
--
ALTER TABLE `user_blocked`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_BeRequesterId_ParticipantUserId` (`requester_id`),
  ADD KEY `FK_BeBlockedId_ParticipantUserId` (`blocked_id`);

--
-- Index pour la table `user_gender`
--
ALTER TABLE `user_gender`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `user_level`
--
ALTER TABLE `user_level`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `forum_mp_msg`
--
ALTER TABLE `forum_mp_msg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT pour la table `forum_mp_subject`
--
ALTER TABLE `forum_mp_subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT pour la table `forum_polls`
--
ALTER TABLE `forum_polls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `forum_polls_options`
--
ALTER TABLE `forum_polls_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `forum_post`
--
ALTER TABLE `forum_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT pour la table `forum_theme`
--
ALTER TABLE `forum_theme`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `forum_topic`
--
ALTER TABLE `forum_topic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT pour la table `forum_users_ban`
--
ALTER TABLE `forum_users_ban`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT pour la table `user_blocked`
--
ALTER TABLE `user_blocked`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user_gender`
--
ALTER TABLE `user_gender`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `user_level`
--
ALTER TABLE `user_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `forum_polls_options`
--
ALTER TABLE `forum_polls_options`
  ADD CONSTRAINT `forum_polls_options_ibfk_1` FOREIGN KEY (`poll_id`) REFERENCES `forum_polls` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `forum_post`
--
ALTER TABLE `forum_post`
  ADD CONSTRAINT `FK_PostTopicId_TopicID` FOREIGN KEY (`topic_id`) REFERENCES `forum_topic` (`id`),
  ADD CONSTRAINT `FK_PostUserId_UserID` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `forum_topic`
--
ALTER TABLE `forum_topic`
  ADD CONSTRAINT `FK_TopicThemeId_ThemeID` FOREIGN KEY (`theme_id`) REFERENCES `forum_theme` (`id`),
  ADD CONSTRAINT `FK_TopicUserId_UserID` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `forum_users_ban`
--
ALTER TABLE `forum_users_ban`
  ADD CONSTRAINT `forum_users_ban_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_UsergenderId_genderId` FOREIGN KEY (`gender_id`) REFERENCES `user_gender` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
