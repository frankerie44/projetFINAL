-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 23 avr. 2024 à 20:52
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `telephone`
CREATE TABLE IF NOT EXISTS `telephone`;
use `telephone`;

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

CREATE TABLE `adresse` (
  `id_adresse` int(11) NOT NULL,
  `rue` varchar(100) NOT NULL,
  `ville` varchar(100) NOT NULL,
  `code_postal` varchar(10) NOT NULL,
  `province` varchar(100) NOT NULL,
  `defaut` int(11) DEFAULT NULL,
  `id_utilisateur` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `adresse`
--

INSERT INTO `adresse` (`id_adresse`, `rue`, `ville`, `code_postal`, `province`, `defaut`, `id_utilisateur`) VALUES
(1, '17115 rue emile-nelligan', 'Montréal', 'H9J 2V6', 'QC', 1, 1),
(2, '17115 rue emile-nelligan', 'Montréal', 'H9J 2V6', 'QC', 1, 1),
(3, '17115 rue emile-nelligan', 'Montréal', 'H9J 2V6', 'QC', 1, 1),
(4, 'saint laurent', 'Longueuil ', 'H2J 3G4', 'QC', 1, 4),
(5, 'saint laurent', 'Longueuil ', 'H2J 3G4', 'QC', 1, 4),
(6, 'saint laurent', 'Longueil', 'jkhgtfr', '', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `adresseutilisateur`
--

CREATE TABLE `adresseutilisateur` (
  `id_utilisateur` int(11) DEFAULT NULL,
  `id_adresse` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id_commande` int(11) NOT NULL,
  `quantite` int(11) DEFAULT NULL,
  `prix` varchar(10) DEFAULT NULL,
  `statut` varchar(50) DEFAULT NULL,
  `date_creation` date DEFAULT NULL,
  `id_utilisateur` int(11) DEFAULT NULL,
  `mode_paiement` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id_commande`, `quantite`, `prix`, `statut`, `date_creation`, `id_utilisateur`, `mode_paiement`) VALUES
(19, 129, '20285.88', 'En cours', '2024-04-23', 1, 'Paypal'),
(20, 9, '21780.65', 'En cours', '2024-04-23', 1, 'Paypal'),
(21, 20, '40302.8', 'En cours', '2024-04-23', 1, 'Paypal');

-- --------------------------------------------------------

--
-- Structure de la table `image`
--

CREATE TABLE `image` (
  `id_image` int(11) NOT NULL,
  `id_telephone` int(11) DEFAULT NULL,
  `chemin_image` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `image`
--

INSERT INTO `image` (`id_image`, `id_telephone`, `chemin_image`) VALUES
(1, 2, 'assets/images/iPhone15 1To, red.jpg'),
(2, 3, 'assets/images/iPhone_14_Pro_Max_deep_purple_lrg1, 128GB.png'),
(3, 4, 'assets/images/Iphone 12 Pro Max Blue.png'),
(4, 6, 'assets/images/iPad11.webp'),
(5, 7, 'assets/images/Iphone 15 Pro Max 512GB - White Titanium.jpg'),
(6, 8, 'assets/images/iphone13ProMaxG.jpeg'),
(7, 13, 'assets/images/iPhone15Plus.png');

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
  `id_role` int(11) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id_role`, `description`) VALUES
(1, 'admin'),
(2, 'client');

-- --------------------------------------------------------

--
-- Structure de la table `telephone`
--

CREATE TABLE `telephone` (
  `id_telephone` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prix` int(10) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `courte_description` varchar(255) DEFAULT NULL,
  `quantite` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `telephone`
--

INSERT INTO `telephone` (`id_telephone`, `nom`, `prix`, `description`, `courte_description`, `quantite`) VALUES
(2, 'Iphone15', 1800, 'en stock', 'iphone 15,  Capa : 1To , red', 25),
(3, 'iphone14 pro Max ', 1600, 'en Stocl', 'Iphone14 pro Max 128Go', 24),
(4, 'Iphone12 pro Max', 1200, 'en Stock', 'Iphone12 Pro Max , 256Go , Blue', 14),
(6, 'ipad 11', 1766, 'en stock', 'ipad 11 pro, 11e generation', 89),
(7, 'Iphone15 pro Max', 1950, 'en stock', 'Iphone15 pro Max , 512GB , white Titanium', 12),
(8, 'Iphone13 pro Max Green', 1150, 'en stock', 'Iphone 13 Pro Max, Green 512Go ', 54),
(13, 'Iphone15 plus', 1250, 'En stock', 'Iphone 15 plus ', 3);

-- --------------------------------------------------------

--
-- Structure de la table `telephonecommande`
--

CREATE TABLE `telephonecommande` (
  `id_telephone` int(11) DEFAULT NULL,
  `id_commande` int(11) DEFAULT NULL,
  `quantite` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id_utilisateur` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  `id_role` int(11) DEFAULT NULL,
  `mot_de_passe` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id_utilisateur`, `nom`, `prenom`, `email`, `telephone`, `date_naissance`, `id_role`, `mot_de_passe`) VALUES
(1, 'kamgue Pharel', 'luc duplex', 'lucduplex@outlook.com', '514-946-7048', '2023-05-12', 1, '$2y$10$B1rrmJg2TGCjfnurYCrFi.bDyQSZ1JhfQj94EEL0/05o4KCAveBUS'),
(4, 'ezekiel', 'tene', 'ezekiel@yahoo.fr', '4562522582', '2003-12-11', 2, '$2y$10$cH1pB0s2puPujruoBBHFb./NtWG2S71jHMIvlk/xMtT8suEnOS/Zy');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `adresse`
--
ALTER TABLE `adresse`
  ADD PRIMARY KEY (`id_adresse`),
  ADD KEY `fk_utilisateur` (`id_utilisateur`);

--
-- Index pour la table `adresseutilisateur`
--
ALTER TABLE `adresseutilisateur`
  ADD KEY `fk_adresse_utilisateur` (`id_adresse`),
  ADD KEY `fk_utilisateur_adresse` (`id_utilisateur`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id_commande`);

--
-- Index pour la table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id_image`),
  ADD KEY `fk_image_tel` (`id_telephone`);

--
-- Index pour la table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id_role`);

--
-- Index pour la table `telephone`
--
ALTER TABLE `telephone`
  ADD PRIMARY KEY (`id_telephone`);

--
-- Index pour la table `telephonecommande`
--
ALTER TABLE `telephonecommande`
  ADD KEY `fk_tel_commande` (`id_telephone`),
  ADD KEY `fk_commande_tel` (`id_commande`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id_utilisateur`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_role_utilisateur` (`id_role`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `adresse`
--
ALTER TABLE `adresse`
  MODIFY `id_adresse` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id_commande` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pour la table `image`
--
ALTER TABLE `image`
  MODIFY `id_image` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `role`
--
ALTER TABLE `role`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `telephone`
--
ALTER TABLE `telephone`
  MODIFY `id_telephone` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `adresse`
--
ALTER TABLE `adresse`
  ADD CONSTRAINT `fk_utilisateur` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `adresseutilisateur`
--
ALTER TABLE `adresseutilisateur`
  ADD CONSTRAINT `fk_adresse_utilisateur` FOREIGN KEY (`id_adresse`) REFERENCES `adresse` (`id_adresse`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_utilisateur_adresse` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `fk_image_tel` FOREIGN KEY (`id_telephone`) REFERENCES `telephone` (`id_telephone`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `telephonecommande`
--
ALTER TABLE `telephonecommande`
  ADD CONSTRAINT `fk_commande_tel` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id_commande`),
  ADD CONSTRAINT `fk_tel_commande` FOREIGN KEY (`id_telephone`) REFERENCES `telephone` (`id_telephone`);

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `fk_role_utilisateur` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
