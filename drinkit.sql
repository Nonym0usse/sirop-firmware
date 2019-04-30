-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  mar. 30 avr. 2019 à 21:14
-- Version du serveur :  8.0.15
-- Version de PHP :  7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `drinkit`
--

-- --------------------------------------------------------

--
-- Structure de la table `bank`
--

CREATE TABLE `bank` (
  `id` int(11) NOT NULL,
  `iban` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rib` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cryptogram` int(11) DEFAULT NULL,
  `expiration_date` datetime DEFAULT NULL,
  `fk_customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `beverage`
--

CREATE TABLE `beverage` (
  `id` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `beverage_settings`
--

CREATE TABLE `beverage_settings` (
  `id` int(11) NOT NULL,
  `fk_customer_id` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `dosage` int(11) DEFAULT NULL,
  `litrage` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `fk_machine_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip_code` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `social_reason` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `manager_name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `manager_phone` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nb_machine_drinkit` int(11) DEFAULT NULL,
  `turnover` double DEFAULT NULL,
  `email` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `event_stats`
--

CREATE TABLE `event_stats` (
  `id` int(11) NOT NULL,
  `fk_machine_id` int(11) DEFAULT NULL,
  `turnover` double DEFAULT NULL,
  `nb_beverage_served` int(11) DEFAULT NULL,
  `top_beverage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `machine`
--

CREATE TABLE `machine` (
  `id` int(11) NOT NULL,
  `fk_customer_id` int(11) NOT NULL,
  `no_pompe` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `machine_user`
--

CREATE TABLE `machine_user` (
  `machine_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20190407163632', '2019-04-07 16:38:55'),
('20190407164503', '2019-04-07 16:46:25'),
('20190407164729', '2019-04-07 16:47:44'),
('20190408123911', '2019-04-08 12:40:13'),
('20190408142751', '2019-04-08 14:28:14'),
('20190408143314', '2019-04-08 14:33:31'),
('20190408144229', '2019-04-08 14:42:45'),
('20190408144709', '2019-04-08 14:48:14'),
('20190408145257', '2019-04-08 14:53:34'),
('20190408145603', '2019-04-08 14:56:20'),
('20190408151930', '2019-04-08 15:19:46'),
('20190408152312', '2019-04-08 15:23:34'),
('20190408153541', '2019-04-08 15:36:04'),
('20190408154233', '2019-04-08 15:43:00');

-- --------------------------------------------------------

--
-- Structure de la table `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `message` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `firstname` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` datetime NOT NULL,
  `mail` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `psc` int(11) DEFAULT NULL,
  `user_picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `localisation` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `last_connexion_date` datetime NOT NULL,
  `nb_beverage_served` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `gender` int(11) NOT NULL,
  `login` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:guid)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `firstname`, `lastname`, `birthday`, `mail`, `password`, `phone`, `country`, `is_admin`, `psc`, `user_picture`, `localisation`, `created_at`, `last_connexion_date`, `nb_beverage_served`, `is_active`, `gender`, `login`) VALUES
(9, 'Cyril', 'Vella', '1997-02-14 00:00:00', 'cyril.vella@yahoo.com', '$2y$13$PKYCe22UbKetlnuJy4cEIePSDdKkIZNUTeephNVuBhKoLTb/yyAyq', NULL, NULL, 0, NULL, NULL, NULL, '2019-04-09 12:45:56', '2019-04-09 12:45:56', NULL, 1, 0, '5cac9404d077c'),
(10, 'Florent', 'Congiusti', '1997-02-14 00:00:00', 'cyril.vella@yahoo.com', '$2y$13$PKYCe22UbKetlnuJy4cEIePSDdKkIZNUTeephNVuBhKoLTb/yyAyq', NULL, NULL, 0, NULL, NULL, NULL, '2019-04-09 12:45:56', '2019-04-09 12:45:56', NULL, 1, 0, '5cac9404d077c');

-- --------------------------------------------------------

--
-- Structure de la table `user_preferences`
--

CREATE TABLE `user_preferences` (
  `id` int(11) NOT NULL,
  `fk_user_id` int(11) DEFAULT NULL,
  `type_of_event` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `favorites_beverages` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D860BF7AFA636FC7` (`fk_customer_id`);

--
-- Index pour la table `beverage`
--
ALTER TABLE `beverage`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `beverage_settings`
--
ALTER TABLE `beverage_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B04DDD3FA636FC7` (`fk_customer_id`),
  ADD KEY `IDX_B04DDD36D991B5` (`fk_machine_id`);

--
-- Index pour la table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `event_stats`
--
ALTER TABLE `event_stats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_165CD6866D991B5` (`fk_machine_id`),
  ADD KEY `IDX_165CD686FA636FC7` (`fk_customer_id`);

--
-- Index pour la table `machine`
--
ALTER TABLE `machine`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_1505DF84FA636FC7` (`fk_customer_id`);

--
-- Index pour la table `machine_user`
--
ALTER TABLE `machine_user`
  ADD PRIMARY KEY (`machine_id`,`user_id`),
  ADD KEY `IDX_DB993D30F6B75B26` (`machine_id`),
  ADD KEY `IDX_DB993D30A76ED395` (`user_id`);

--
-- Index pour la table `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user_preferences`
--
ALTER TABLE `user_preferences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_402A6F605741EEB9` (`fk_user_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `bank`
--
ALTER TABLE `bank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `beverage`
--
ALTER TABLE `beverage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `beverage_settings`
--
ALTER TABLE `beverage_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `event_stats`
--
ALTER TABLE `event_stats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `machine`
--
ALTER TABLE `machine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `user_preferences`
--
ALTER TABLE `user_preferences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `bank`
--
ALTER TABLE `bank`
  ADD CONSTRAINT `FK_D860BF7AFA636FC7` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`id`);

--
-- Contraintes pour la table `beverage_settings`
--
ALTER TABLE `beverage_settings`
  ADD CONSTRAINT `FK_B04DDD36D991B5` FOREIGN KEY (`fk_machine_id`) REFERENCES `machine` (`id`),
  ADD CONSTRAINT `FK_B04DDD3FA636FC7` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`id`);

--
-- Contraintes pour la table `event_stats`
--
ALTER TABLE `event_stats`
  ADD CONSTRAINT `FK_165CD6866D991B5` FOREIGN KEY (`fk_machine_id`) REFERENCES `machine` (`id`),
  ADD CONSTRAINT `FK_165CD686FA636FC7` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`id`);

--
-- Contraintes pour la table `machine`
--
ALTER TABLE `machine`
  ADD CONSTRAINT `FK_1505DF84FA636FC7` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`id`);

--
-- Contraintes pour la table `machine_user`
--
ALTER TABLE `machine_user`
  ADD CONSTRAINT `FK_DB993D30A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_DB993D30F6B75B26` FOREIGN KEY (`machine_id`) REFERENCES `machine` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `user_preferences`
--
ALTER TABLE `user_preferences`
  ADD CONSTRAINT `FK_402A6F605741EEB9` FOREIGN KEY (`fk_user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
