-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 04, 2026 at 11:16 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `gestion_stock_clic`
--

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE IF NOT EXISTS `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_article` varchar(50) NOT NULL,
  `id_categorie` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `prix_unitaire` int(11) NOT NULL,
  `date_fabrication` datetime NOT NULL,
  `date_expiration` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_categorie` (`id_categorie`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`id`, `nom_article`, `id_categorie`, `quantite`, `prix_unitaire`, `date_fabrication`, `date_expiration`) VALUES
(1, 'hp', 1, 6, 200000, '2025-12-27 23:43:00', '2026-08-27 03:44:00'),
(2, 'imprimantescanner', 2, 58, 500000, '2025-12-27 23:43:00', '2026-08-27 12:44:00'),
(3, 'disque dur', 1, 6, 5000, '2025-12-24 02:08:00', '2028-12-13 02:08:00'),
(4, 'hpscanner', 4, 12, 70000, '2026-01-09 11:11:00', '2030-01-23 11:11:00'),
(5, 'imprimantescanner', 7, 45, 50000, '2026-01-08 05:55:00', '2028-01-27 05:55:00');

-- --------------------------------------------------------

--
-- Table structure for table `categorie_article`
--

CREATE TABLE IF NOT EXISTS `categorie_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_categorie` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `categorie_article`
--

INSERT INTO `categorie_article` (`id`, `libelle_categorie`) VALUES
(4, 'ordinateur'),
(5, 'ordinateurs'),
(6, 'accessoir'),
(7, 'imprimante'),
(8, 'CHARGEURS');

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(40) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `adresse` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id`, `nom`, `prenom`, `telephone`, `adresse`) VALUES
(1, 'youre', 'celestin', '+237659547812', 'GUIDIGUIS');

-- --------------------------------------------------------

--
-- Table structure for table `commande`
--

CREATE TABLE IF NOT EXISTS `commande` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_article` int(11) NOT NULL,
  `id_fournisseur` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `prix` int(11) NOT NULL,
  `date_commande` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_article` (`id_article`,`id_fournisseur`),
  KEY `id_fournisseur` (`id_fournisseur`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `commande`
--

INSERT INTO `commande` (`id`, `id_article`, `id_fournisseur`, `quantite`, `prix`, `date_commande`) VALUES
(1, 2, 1, 4, 2000000, '2025-12-31 13:19:58'),
(2, 1, 1, 3, 600000, '2025-12-31 14:16:00');

-- --------------------------------------------------------

--
-- Table structure for table `fournisseur`
--

CREATE TABLE IF NOT EXISTS `fournisseur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `adresse` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `fournisseur`
--

INSERT INTO `fournisseur` (`id`, `nom`, `prenom`, `telephone`, `adresse`) VALUES
(1, 'Amadou', 'jeremie', '655464677', 'MAROUA'),
(2, 'MAMANE', 'HASSANE', '655464678', 'GAROUA-BOULAÃ');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','client') DEFAULT 'client',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `role`, `created_at`) VALUES
(3, 'admin@site.com', '$2y$10$f1gqj3FQrdP07gP7P80MDeYXFP2G39hkITQZ6ccEvnhF9gwboTcKG', 'admin', '2026-01-04 19:51:32'),
(4, 'nenbaappolinaire@gmail.com', '$2y$10$W9t3OeIbLEwYf3gx1sx3meXabvyC6mRLvPn/Iy/81g1iFkLWRkZTS', 'admin', '2026-01-04 20:05:35'),
(5, 'appolinaire@gmail.com', '$2y$10$mO0oRso7xHhFTV00OR4nT.haAyxBSg8BuGFnC.mEAj3qRyp7Vx1/W', 'admin', '2026-01-04 20:06:27');

-- --------------------------------------------------------

--
-- Table structure for table `vente`
--

CREATE TABLE IF NOT EXISTS `vente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_article` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `prix` int(11) NOT NULL,
  `date_vente` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `etat` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_article` (`id_article`,`id_client`),
  KEY `id_client` (`id_client`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `vente`
--

INSERT INTO `vente` (`id`, `id_article`, `id_client`, `quantite`, `prix`, `date_vente`, `etat`) VALUES
(9, 2, 1, 3, 1500000, '2025-12-31 12:20:18', '1'),
(10, 3, 1, 3, 15000, '2025-12-31 14:25:26', '0'),
(11, 1, 1, 4, 800000, '2025-12-31 14:30:25', '1'),
(12, 2, 1, 23, 11500000, '2025-12-31 14:44:59', '1');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`id_article`) REFERENCES `article` (`id`),
  ADD CONSTRAINT `commande_ibfk_2` FOREIGN KEY (`id_fournisseur`) REFERENCES `fournisseur` (`id`);

--
-- Constraints for table `vente`
--
ALTER TABLE `vente`
  ADD CONSTRAINT `vente_ibfk_1` FOREIGN KEY (`id_article`) REFERENCES `article` (`id`),
  ADD CONSTRAINT `vente_ibfk_2` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
