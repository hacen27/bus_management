-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : lun. 27 juin 2022 à 16:27
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bus_app`
--

-- --------------------------------------------------------

--
-- Structure de la table `bus`
--

CREATE TABLE `bus` (
  `idbus` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `bus`
--

INSERT INTO `bus` (`idbus`, `nom`) VALUES
(1, 'Bus1'),
(2, 'Bus2'),
(3, 'Bus3'),
(4, 'Bus4');

-- --------------------------------------------------------

--
-- Structure de la table `chaffeur`
--

CREATE TABLE `chaffeur` (
  `idchouff` int(11) NOT NULL,
  `nomchfr` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `idbus` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `chaffeur`
--

INSERT INTO `chaffeur` (`idchouff`, `nomchfr`, `email`, `idbus`) VALUES
(1, 'Ahmed', 'dfh@gmail.com', 1),
(2, 'Sidi', 'Sidi@gmail.com', 2),
(3, 'Medlemin', 'dfh@gmail.com', 3);

-- --------------------------------------------------------

--
-- Structure de la table `doit_etre`
--

CREATE TABLE `doit_etre` (
  `idville` int(11) NOT NULL,
  `idvoy` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `garre`
--

CREATE TABLE `garre` (
  `idgarre` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `garre`
--

INSERT INTO `garre` (`idgarre`, `nom`) VALUES
(1, 'Seaada'),
(2, 'Erra7lla');

-- --------------------------------------------------------

--
-- Structure de la table `passager`
--

CREATE TABLE `passager` (
  `idpass` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `tel` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `passager`
--

INSERT INTO `passager` (`idpass`, `nom`, `tel`) VALUES
(1, 'sidiAmed', 49134502);

-- --------------------------------------------------------

--
-- Structure de la table `reserver`
--

CREATE TABLE `reserver` (
  `idpass` int(11) NOT NULL,
  `idvoy` int(11) NOT NULL,
  `date_reservation` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `reserver`
--

INSERT INTO `reserver` (`idpass`, `idvoy`, `date_reservation`) VALUES
(0, 3, '2022-06-26 00:13:23'),
(0, 2, '2022-06-26 00:13:23');

-- --------------------------------------------------------

--
-- Structure de la table `ville`
--

CREATE TABLE `ville` (
  `idville` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `idgarre` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `ville`
--

INSERT INTO `ville` (`idville`, `nom`, `idgarre`) VALUES
(1, 'Nouachott', 1),
(2, 'kiffa', 2);

-- --------------------------------------------------------

--
-- Structure de la table `voyage`
--

CREATE TABLE `voyage` (
  `idvoy` int(11) NOT NULL,
  `garre_dep` varchar(50) NOT NULL,
  `garre_arrive` varchar(50) NOT NULL,
  `date_dep` date NOT NULL,
  `nombre_palce` int(11) NOT NULL,
  `idbus` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `voyage`
--

INSERT INTO `voyage` (`idvoy`, `garre_dep`, `garre_arrive`, `date_dep`, `nombre_palce`, `idbus`) VALUES
(1, 'Nouakchoutt', 'Nouadhibou', '2022-06-30', 12, 1),
(2, 'Nouadhidou', 'Nouachoutt', '2022-06-29', 15, 2),
(3, 'Kiffa', 'Nouakchoutt', '2022-06-26', 17, 0),
(4, 'Nouakchoutt', 'Kiffa', '2022-06-26', 20, 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`idbus`);

--
-- Index pour la table `chaffeur`
--
ALTER TABLE `chaffeur`
  ADD PRIMARY KEY (`idchouff`),
  ADD KEY `idbus` (`idbus`);

--
-- Index pour la table `doit_etre`
--
ALTER TABLE `doit_etre`
  ADD KEY `idville` (`idville`),
  ADD KEY `idvoy` (`idvoy`),
  ADD KEY `idville_2` (`idville`),
  ADD KEY `idvoy_2` (`idvoy`);

--
-- Index pour la table `garre`
--
ALTER TABLE `garre`
  ADD PRIMARY KEY (`idgarre`);

--
-- Index pour la table `passager`
--
ALTER TABLE `passager`
  ADD PRIMARY KEY (`idpass`);

--
-- Index pour la table `reserver`
--
ALTER TABLE `reserver`
  ADD KEY `idpass` (`idpass`),
  ADD KEY `idvoy` (`idvoy`),
  ADD KEY `idpass_2` (`idpass`),
  ADD KEY `idvoy_2` (`idvoy`);

--
-- Index pour la table `ville`
--
ALTER TABLE `ville`
  ADD PRIMARY KEY (`idville`),
  ADD KEY `idgarre` (`idgarre`);

--
-- Index pour la table `voyage`
--
ALTER TABLE `voyage`
  ADD PRIMARY KEY (`idvoy`),
  ADD KEY `idbus` (`idbus`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `bus`
--
ALTER TABLE `bus`
  MODIFY `idbus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `chaffeur`
--
ALTER TABLE `chaffeur`
  MODIFY `idchouff` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `garre`
--
ALTER TABLE `garre`
  MODIFY `idgarre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `passager`
--
ALTER TABLE `passager`
  MODIFY `idpass` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `ville`
--
ALTER TABLE `ville`
  MODIFY `idville` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `voyage`
--
ALTER TABLE `voyage`
  MODIFY `idvoy` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
