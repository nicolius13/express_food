-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 10 mars 2020 à 03:38
-- Version du serveur :  10.4.11-MariaDB
-- Version de PHP : 7.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `express_food`
--

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

CREATE TABLE `adresse` (
  `id` int(11) NOT NULL,
  `rue` varchar(100) NOT NULL,
  `numero` int(11) NOT NULL,
  `ville` varchar(100) NOT NULL,
  `code_postal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `adresse`
--

INSERT INTO `adresse` (`id`, `rue`, `numero`, `ville`, `code_postal`) VALUES
(1, '116  rue Nationale', 116, 'PARIS', 75006),
(2, 'Place de la Madeleine', 126, 'PARIS', 75010),
(3, 'Faubourg Saint Honoré', 77, 'PARIS', 75116),
(4, 'rue La Boétie', 35, 'PARIS', 75014);

-- --------------------------------------------------------

--
-- Structure de la table `allergene`
--

CREATE TABLE `allergene` (
  `id` int(11) NOT NULL,
  `allergene` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `allergene`
--

INSERT INTO `allergene` (`id`, `allergene`) VALUES
(1, 'gluten'),
(2, 'Crustacés'),
(3, 'Oeufs'),
(4, 'Arachides'),
(5, 'Soja'),
(6, 'Lait'),
(7, 'Fruits à coques'),
(8, 'Moutarde'),
(9, 'Céleri');

-- --------------------------------------------------------

--
-- Structure de la table `allergene_contenu`
--

CREATE TABLE `allergene_contenu` (
  `id_plat` int(11) NOT NULL,
  `id_allergene` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `allergene_contenu`
--

INSERT INTO `allergene_contenu` (`id_plat`, `id_allergene`) VALUES
(1, 2),
(2, 2),
(5, 2),
(4, 3),
(5, 4),
(4, 6);

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id` int(11) NOT NULL,
  `categorie` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `categorie`) VALUES
(1, 'Plat'),
(2, 'Dessert');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `identifiant` varchar(100) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `id_adresse` int(11) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `identifiant`, `nom`, `id_adresse`, `mail`, `password`) VALUES
(1, 'HughA', 'Hugh', 2, '37ypux60cyd@powerencry.com', 'Dergh45'),
(2, 'FerlandC', 'Clothilde', 1, '8ee3tnztk35@fakemailgenerator.net', 'DFMLggfdg12'),
(3, 'Aymon', 'Aymon', 4, 'b3tm1l01szw@classesmail.com', 'Plae64DFDG'),
(4, 'Cantin', 'Cantin', 3, 'clznrbxv3qm@meantinc.com', '45dgdfA6');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `numero_commande` int(11) NOT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`numero_commande`, `date`) VALUES
(1, '2020-03-05 08:53:42'),
(2, '2020-03-05 08:23:42'),
(3, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `inventaire_general`
--

CREATE TABLE `inventaire_general` (
  `id_plat` int(11) NOT NULL,
  `nombre_plat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `inventaire_general`
--

INSERT INTO `inventaire_general` (`id_plat`, `nombre_plat`) VALUES
(1, 10),
(2, 16),
(3, 15),
(4, 20);

-- --------------------------------------------------------

--
-- Structure de la table `inventaire_livreur`
--

CREATE TABLE `inventaire_livreur` (
  `id_livreur` int(11) NOT NULL,
  `id_plat` int(11) NOT NULL,
  `nombre_plat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `inventaire_livreur`
--

INSERT INTO `inventaire_livreur` (`id_livreur`, `id_plat`, `nombre_plat`) VALUES
(1, 1, 3),
(1, 2, 3),
(1, 3, 3),
(1, 4, 3),
(2, 1, 5),
(2, 2, 5),
(2, 3, 5),
(2, 4, 5),
(3, 1, 2),
(3, 2, 4),
(3, 3, 3),
(3, 4, 4),
(4, 1, 4),
(4, 2, 2),
(4, 3, 3),
(4, 4, 5);

-- --------------------------------------------------------

--
-- Structure de la table `livraison`
--

CREATE TABLE `livraison` (
  `numero_commande` int(11) NOT NULL,
  `id_livreur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `livraison`
--

INSERT INTO `livraison` (`numero_commande`, `id_livreur`) VALUES
(1, 1),
(2, 4);

-- --------------------------------------------------------

--
-- Structure de la table `livreur`
--

CREATE TABLE `livreur` (
  `id` int(11) NOT NULL,
  `id_localisation` int(11) DEFAULT NULL,
  `nom` varchar(100) NOT NULL,
  `statut` varchar(30) NOT NULL,
  `identifiant` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `livreur`
--

INSERT INTO `livreur` (`id`, `id_localisation`, `nom`, `statut`, `identifiant`, `password`) VALUES
(1, 1, 'Thomas', 'livraison', 'Thomas', 'DJerxcv52v'),
(2, 2, 'Brice', 'libre', 'BriceNice', 'A45rdg2s'),
(3, 3, 'Fabian', 'libre', 'Fab16', 'dfGR64646sfg'),
(4, 4, 'Laurie', 'livraison', 'Laurie', 'LoDf452');

-- --------------------------------------------------------

--
-- Structure de la table `panier`
--

CREATE TABLE `panier` (
  `id` int(11) NOT NULL,
  `numero_commande` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `id_plat` int(11) NOT NULL,
  `nombre_plat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `panier`
--

INSERT INTO `panier` (`id`, `numero_commande`, `id_client`, `id_plat`, `nombre_plat`) VALUES
(1, 1, 1, 1, 1),
(2, 1, 1, 2, 1),
(3, 2, 3, 3, 2),
(4, 2, 3, 4, 1),
(5, 2, 3, 2, 1),
(6, 3, 4, 4, 3),
(7, 3, 4, 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `plat`
--

CREATE TABLE `plat` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `description` varchar(300) NOT NULL,
  `id_categorie` int(11) NOT NULL,
  `prix` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `plat`
--

INSERT INTO `plat` (`id`, `nom`, `description`, `id_categorie`, `prix`) VALUES
(1, 'laab', 'Le laab est un plat traditionnel du Laos et de l\'Isan. Il s\'agit d\'un hachis, généralement fortement pimenté, qu\'on consomme avec du riz gluant.', 1, 10.99),
(2, 'Salade de papaye verte', 'La salade de papaye verte est une salade épicée à base de papaye verte râpée. D\'origine lao, elle est couramment consommée à travers l\'Asie du Sud-Est.', 1, 8.99),
(3, 'Riz gluant à la mangue', 'Le riz gluant à la mangue est un dessert thaï traditionnel à base de riz gluant, de mangue fraîche et de lait de coco.', 2, 5.99),
(4, 'Mousse au chocolat', 'Découvrez cette recette de mousse au chocolat onctueuse et légère qui ravira tout les passionnés de chocolat, des enfants aux plus grands gourmands.', 2, 6.99),
(5, 'Khao piak', 'Le Khao piak est une soupe de nouilles de riz qui fait partie de la cuisine traditionnelle laotienne. Il se traduit littéralement par des brins de riz humides. C\'est un aliment réconfortant commun, idéal pour une journée froide.', 1, 10.99);

-- --------------------------------------------------------

--
-- Structure de la table `position_livreur`
--

CREATE TABLE `position_livreur` (
  `id` int(11) NOT NULL,
  `longitude` varchar(20) NOT NULL,
  `latitude` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `position_livreur`
--

INSERT INTO `position_livreur` (`id`, `longitude`, `latitude`) VALUES
(1, '48°50\'22.5\"N', '2°20\'01.9\"E'),
(2, '48°52\'24.3\"N', '2°21\'29.3\"E'),
(3, '48°52\'35.3\"N', '2°18\'46.0\"E'),
(4, '48°50\'51.8\"N', '2°23\'24.9\"E');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `adresse`
--
ALTER TABLE `adresse`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `allergene`
--
ALTER TABLE `allergene`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `allergene_contenu`
--
ALTER TABLE `allergene_contenu`
  ADD PRIMARY KEY (`id_allergene`,`id_plat`),
  ADD KEY `plat_allergene_contenu_fk` (`id_plat`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adresse_client_fk` (`id_adresse`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`numero_commande`);

--
-- Index pour la table `inventaire_general`
--
ALTER TABLE `inventaire_general`
  ADD PRIMARY KEY (`id_plat`);

--
-- Index pour la table `inventaire_livreur`
--
ALTER TABLE `inventaire_livreur`
  ADD PRIMARY KEY (`id_livreur`,`id_plat`),
  ADD KEY `inventaire_general_inventaire_livreur_fk` (`id_plat`);

--
-- Index pour la table `livraison`
--
ALTER TABLE `livraison`
  ADD PRIMARY KEY (`numero_commande`),
  ADD KEY `livreur_livraison_fk` (`id_livreur`);

--
-- Index pour la table `livreur`
--
ALTER TABLE `livreur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `position_livreur_livreur_fk` (`id_localisation`);

--
-- Index pour la table `panier`
--
ALTER TABLE `panier`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_panier_fk` (`id_client`),
  ADD KEY `id` (`id`),
  ADD KEY `numero_commande` (`numero_commande`);

--
-- Index pour la table `plat`
--
ALTER TABLE `plat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categorie_plat_fk` (`id_categorie`);

--
-- Index pour la table `position_livreur`
--
ALTER TABLE `position_livreur`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `adresse`
--
ALTER TABLE `adresse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `allergene`
--
ALTER TABLE `allergene`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `numero_commande` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `livreur`
--
ALTER TABLE `livreur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `panier`
--
ALTER TABLE `panier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `plat`
--
ALTER TABLE `plat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `position_livreur`
--
ALTER TABLE `position_livreur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `allergene_contenu`
--
ALTER TABLE `allergene_contenu`
  ADD CONSTRAINT `allergene_allergene_contenu_fk` FOREIGN KEY (`id_allergene`) REFERENCES `allergene` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `plat_allergene_contenu_fk` FOREIGN KEY (`id_plat`) REFERENCES `plat` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `adresse_client_fk` FOREIGN KEY (`id_adresse`) REFERENCES `adresse` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `inventaire_general`
--
ALTER TABLE `inventaire_general`
  ADD CONSTRAINT `plat_inventaire_general_fk` FOREIGN KEY (`id_plat`) REFERENCES `plat` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `plat_inventaire_general_fk1` FOREIGN KEY (`id_plat`) REFERENCES `plat` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `plat_inventaire_general_fk2` FOREIGN KEY (`id_plat`) REFERENCES `plat` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `inventaire_livreur`
--
ALTER TABLE `inventaire_livreur`
  ADD CONSTRAINT `inventaire_general_inventaire_livreur_fk` FOREIGN KEY (`id_plat`) REFERENCES `inventaire_general` (`id_plat`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `inventaire_livreur_fk` FOREIGN KEY (`id_livreur`) REFERENCES `livreur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `livreur_inventaire_livreur_fk` FOREIGN KEY (`id_livreur`) REFERENCES `livreur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `livreur_inventaire_livreur_fk1` FOREIGN KEY (`id_livreur`) REFERENCES `livreur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `livraison`
--
ALTER TABLE `livraison`
  ADD CONSTRAINT `livraison_ibfk_1` FOREIGN KEY (`numero_commande`) REFERENCES `commande` (`numero_commande`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `livreur_livraison_fk` FOREIGN KEY (`id_livreur`) REFERENCES `livreur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `livreur`
--
ALTER TABLE `livreur`
  ADD CONSTRAINT `position_livreur_livreur_fk` FOREIGN KEY (`id_localisation`) REFERENCES `position_livreur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `panier`
--
ALTER TABLE `panier`
  ADD CONSTRAINT `client_panier_fk` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `panier_ibfk_1` FOREIGN KEY (`numero_commande`) REFERENCES `commande` (`numero_commande`);

--
-- Contraintes pour la table `plat`
--
ALTER TABLE `plat`
  ADD CONSTRAINT `categorie_plat_fk` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
