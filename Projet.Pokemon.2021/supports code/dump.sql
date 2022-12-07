-- --------------------------------------------------------
-- Hôte :                        127.0.0.1
-- Version du serveur:           5.7.28 - MySQL Community Server (GPL)
-- SE du serveur:                Win32
-- HeidiSQL Version:             10.3.0.5771
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Listage de la structure de la base pour pokemon2019
CREATE DATABASE IF NOT EXISTS `pokemon2019` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `pokemon2019`;

-- Listage de la structure de la table pokemon2019. dresseurs
CREATE TABLE IF NOT EXISTS `dresseurs` (
  `NomDresseur` varchar(255) NOT NULL,
  `NomMeteo` varchar(255) DEFAULT NULL,
  `NomTerrain` varchar(255) DEFAULT NULL,
  `PrenomDresseur` varchar(255) DEFAULT NULL,
  `ImageDresseur` mediumblob,
  PRIMARY KEY (`NomDresseur`),
  KEY `ConnaitMeteo_FK` (`NomMeteo`),
  KEY `ConnaitTerrain_FK` (`NomTerrain`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Listage des données de la table pokemon2019.dresseurs : 0 rows
/*!40000 ALTER TABLE `dresseurs` DISABLE KEYS */;
INSERT INTO `dresseurs` (`NomDresseur`, `NomMeteo`, `NomTerrain`, `PrenomDresseur`, `ImageDresseur`) VALUES
	('Azuria', 'Pluie', 'AreneEau', 'Ondine', NULL),
	('Argenta', 'Nuage', 'AreneRoche', 'Pierre', NULL),
	('Carmin-sur-mer', 'Orage', 'AreneElectrik', 'Major Bob', NULL),
	('Celadopole', 'Soleil', 'ArenePlante', 'Erika', NULL),
	('Parmanie', 'Nuage', 'ArenePoison', 'Koga', NULL),
	('Safrania', 'Brouillard', 'ArenePsy', 'Morgane', NULL),
	('Cramois\'Ile', 'Secheresse', 'AreneFeu', 'Auguste', NULL),
	('Jadielle', 'TempeteDeSable', 'AreneSol', 'Giovanni', NULL);
/*!40000 ALTER TABLE `dresseurs` ENABLE KEYS */;

-- Listage de la structure de la table pokemon2019. meteos
CREATE TABLE IF NOT EXISTS `meteos` (
  `NomMeteo` varchar(255) NOT NULL,
  `NomSpecificite` varchar(255) DEFAULT NULL,
  `NomType` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`NomMeteo`),
  KEY `MeteoA_FK` (`NomSpecificite`),
  KEY `MeteoAffecte_FK` (`NomType`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Listage des données de la table pokemon2019.meteos : 0 rows
/*!40000 ALTER TABLE `meteos` DISABLE KEYS */;
INSERT INTO `meteos` (`NomMeteo`, `NomSpecificite`, `NomType`) VALUES
	('Soleil', 'AugmentationAttSpe', 'Plante'),
	('Nuage', NULL, NULL),
	('TempeteDeSable', 'AugmentationAttSpe', 'Sol'),
	('Secheresse', 'AugmentationAttSpe', 'Feu'),
	('Brouillard', 'DiminutionVitesse', NULL),
	('Pluie', 'AugmentationAttSpe', 'Eau'),
	('Orage', 'AugmentationAttSpe', 'Ã‰lectrik'),
	('Neige', 'AugmentationAttSpe', 'Glace');
/*!40000 ALTER TABLE `meteos` ENABLE KEYS */;

-- Listage de la structure de la table pokemon2019. objets
CREATE TABLE IF NOT EXISTS `objets` (
  `NomObjet` varchar(255) NOT NULL,
  `NomSpecificite` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`NomObjet`),
  KEY `ObjetA_FK` (`NomSpecificite`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Listage des données de la table pokemon2019.objets : 5 rows
/*!40000 ALTER TABLE `objets` DISABLE KEYS */;
INSERT INTO `objets` (`NomObjet`, `NomSpecificite`) VALUES
	('DÃ©f. SpÃ©. +', 'AugmentationAttSpe'),
	('DÃ©fense +', 'AugmentationDef'),
	('Attaque +', 'AugmentationAtt'),
	('Att. SpÃ©. +', 'AugmentationAttSpe'),
	('Vitesse +', 'AugmentationVitesse');
/*!40000 ALTER TABLE `objets` ENABLE KEYS */;

-- Listage de la structure de la table pokemon2019. pokemons
CREATE TABLE IF NOT EXISTS `pokemons` (
  `Numero` int(11) NOT NULL,
  `NomType` varchar(255) DEFAULT NULL,
  `NomObjet` varchar(255) DEFAULT NULL,
  `NomPokemon` varchar(255) DEFAULT NULL,
  `AttaqueSpe` int(11) DEFAULT NULL,
  `DefenseSpe` int(11) DEFAULT NULL,
  `Attaque` int(11) DEFAULT NULL,
  `Defense` int(11) DEFAULT NULL,
  `Vitesse` int(11) DEFAULT NULL,
  `ImagePokemon` mediumblob,
  PRIMARY KEY (`Numero`),
  KEY `Contient_FK` (`NomType`),
  KEY `PokemonPossede_FK` (`NomObjet`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Listage des données de la table pokemon2019.pokemons : 28 rows
/*!40000 ALTER TABLE `pokemons` DISABLE KEYS */;
INSERT INTO `pokemons` (`Numero`, `NomType`, `NomObjet`, `NomPokemon`, `AttaqueSpe`, `DefenseSpe`, `Attaque`, `Defense`, `Vitesse`, `ImagePokemon`) VALUES
	(4, 'Feu', '', 'SalamÃ¨che', 52, 50, 60, 43, 65, NULL),
	(3, 'Plante', '', 'Florizzare', 82, 100, 100, 83, 80, NULL),
	(2, 'Plante', '', 'Herbizzare', 62, 80, 80, 63, 60, NULL),
	(1, 'Plante', '', 'Bulbisarre', 49, 65, 65, 49, 45, NULL),
	(5, 'Feu', '', 'Reptincel', 64, 65, 80, 58, 80, NULL),
	(6, 'Feu', '', 'Dracaufeu', 84, 85, 109, 78, 100, NULL),
	(7, 'Eau', '', 'Carapuce', 48, 64, 50, 68, 43, NULL),
	(8, 'Eau', '', 'Carabaffe', 63, 80, 65, 80, 58, NULL),
	(9, 'Eau', '', 'Tortank', 83, 105, 85, 100, 78, NULL),
	(10, 'Insecte', '', 'Chenipan', 30, 20, 20, 35, 45, NULL),
	(11, 'Insecte', '', 'Chrysacier', 20, 25, 25, 55, 30, NULL),
	(12, 'Insecte', '', 'Papilusion', 45, 80, 90, 50, 70, NULL),
	(13, 'Poison', '', 'Aspicot', 35, 20, 20, 30, 50, NULL),
	(14, 'Poison', '', 'Coconfort', 25, 25, 25, 50, 35, NULL),
	(15, 'Poison', '', 'Dardargnan', 90, 80, 45, 40, 75, NULL),
	(16, 'Vol', '', 'Roucool', 45, 35, 35, 40, 56, NULL),
	(17, 'Vol', '', 'Roucoups', 60, 50, 50, 55, 71, NULL),
	(18, 'Vol', '', 'Roucarnage', 80, 70, 70, 75, 101, NULL),
	(19, 'Normal', '', 'Rattata', 56, 35, 25, 35, 72, NULL),
	(20, 'Normal', '', 'Rattatac', 81, 70, 50, 60, 97, NULL),
	(21, 'Vol', '', 'Piafabec', 60, 31, 31, 30, 70, NULL),
	(22, 'Vol', '', 'Rapasdepic', 90, 61, 61, 65, 100, NULL),
	(23, 'Poison', '', 'Abo', 60, 54, 40, 44, 55, NULL),
	(24, 'Poison', '', 'Arbok', 95, 79, 65, 69, 80, NULL),
	(25, 'Ã‰lectrik', '', 'Pikachu', 55, 50, 50, 40, 90, NULL),
	(26, 'Ã‰lectrik', '', 'Raichu', 90, 80, 90, 55, 110, NULL),
	(28, 'Sol', '', 'Sablaireau', 45, 55, 100, 110, 65, NULL),
	(27, 'Sol', '', 'Sabelette', 20, 30, 75, 85, 40, NULL);
/*!40000 ALTER TABLE `pokemons` ENABLE KEYS */;

-- Listage de la structure de la table pokemon2019. possedeequipe
CREATE TABLE IF NOT EXISTS `possedeequipe` (
  `NomDresseur` varchar(255) NOT NULL,
  `Numero` int(11) NOT NULL,
  PRIMARY KEY (`NomDresseur`,`Numero`),
  KEY `DresseurEquipe_FK` (`NomDresseur`),
  KEY `NumeroEquipe_FK` (`Numero`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Listage des données de la table pokemon2019.possedeequipe : 0 rows
/*!40000 ALTER TABLE `possedeequipe` DISABLE KEYS */;
INSERT INTO `possedeequipe` (`NomDresseur`, `Numero`) VALUES
	('Azuria', 7),
	('Azuria', 8),
	('Azuria', 9),
	('Celadopole', 1),
	('Celadopole', 2),
	('Celadopole', 3),
	('Celadopole', 6),
	('Cramois\'Ile', 4),
	('Cramois\'Ile', 5),
	('Cramois\'Ile', 6),
	('Parmanie', 3),
	('Parmanie', 10);
/*!40000 ALTER TABLE `possedeequipe` ENABLE KEYS */;

-- Listage de la structure de la table pokemon2019. specificites
CREATE TABLE IF NOT EXISTS `specificites` (
  `NomSpecificite` varchar(255) NOT NULL,
  `GainAttaqueSpe` int(11) DEFAULT NULL,
  `GainAttaque` int(11) DEFAULT NULL,
  `GainDefenseSpe` int(11) DEFAULT NULL,
  `GainDefense` int(11) DEFAULT NULL,
  `GainVitesse` int(11) DEFAULT NULL,
  PRIMARY KEY (`NomSpecificite`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Listage des données de la table pokemon2019.specificites : 2 rows
/*!40000 ALTER TABLE `specificites` DISABLE KEYS */;
INSERT INTO `specificites` (`NomSpecificite`, `GainAttaqueSpe`, `GainAttaque`, `GainDefenseSpe`, `GainDefense`, `GainVitesse`) VALUES
	('AugmentationAttSpe', 10, 0, 0, 0, 0),
	('DiminutionAttSpe', -10, 0, 0, 0, 0),
	('AugmentationAtt', 0, 10, 0, 0, 0),
	('DiminutionDef', 0, 0, 0, -10, 0),
	('AugmentationDef', 0, 0, 0, 10, 0),
	('DiminutionAtt', 0, -10, 0, 0, 0),
	('AugmentationDefSpe', 0, 0, 10, 0, 0),
	('DiminutionDefSpe', 0, 0, -10, 0, 0),
	('DiminutionVitesse', 0, 0, 0, 0, -10),
	('AugmentationVitesse', 0, 0, 0, 0, 10);
/*!40000 ALTER TABLE `specificites` ENABLE KEYS */;

-- Listage de la structure de la table pokemon2019. terrains
CREATE TABLE IF NOT EXISTS `terrains` (
  `NomTerrain` varchar(255) NOT NULL,
  `NomSpecificite` varchar(255) DEFAULT NULL,
  `NomType` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`NomTerrain`),
  KEY `TerrainA_FK` (`NomSpecificite`),
  KEY `TerrainAffecte_FK` (`NomType`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Listage des données de la table pokemon2019.terrains : 0 rows
/*!40000 ALTER TABLE `terrains` DISABLE KEYS */;
INSERT INTO `terrains` (`NomTerrain`, `NomSpecificite`, `NomType`) VALUES
	('AreneFeu', 'AugmentationAttSpe', 'Feu'),
	('AreneEau', 'AugmentationAttSpe', 'Eau'),
	('ArenePlante', 'AugmentationDefSpe', 'Plante'),
	('AreneVol', 'AugmentationAtt', 'Vol'),
	('ArenePoison', 'AugmentationAtt', 'Poison'),
	('AreneNormal', 'AugmentationDef', 'Normal'),
	('AreneElectric', 'AugmentationVitesse', 'Ã‰lectrik'),
	('AreneSol', 'AugmentationDef', 'Sol'),
	('AreneInsecte', 'AugmentationVitesse', 'Insecte'),
	('AreneGlace', 'AugmentationDefSpe', 'Glace'),
	('AreneDragon', 'AugmentationDefSpe', 'Dragon'),
	('ArenePsy', 'AugmentationAttSpe', 'Psy'),
	('AreneSpectre', 'AugmentationAtt', 'Spectre'),
	('AreneCombat', 'AugmentationVitesse', 'Combat'),
	('AreneRoche', 'AugmentationDef', 'Roche');
/*!40000 ALTER TABLE `terrains` ENABLE KEYS */;

-- Listage de la structure de la table pokemon2019. types
CREATE TABLE IF NOT EXISTS `types` (
  `NomType` varchar(255) NOT NULL,
  `ImageType` mediumblob,
  PRIMARY KEY (`NomType`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Listage des données de la table pokemon2019.types : 15 rows
/*!40000 ALTER TABLE `types` DISABLE KEYS */;
INSERT INTO `types` (`NomType`, `ImageType`) VALUES
	('Eau', NULL),
	('Feu', NULL),
	('Normal', NULL),
	('Plante', NULL),
	('Ã‰lectrik', NULL),
	('Glace', NULL),
	('Combat', NULL),
	('Poison', NULL),
	('Sol', NULL),
	('Vol', NULL),
	('Psy', NULL),
	('Insecte', NULL),
	('Roche', NULL),
	('Spectre', NULL),
	('Dragon', NULL);
/*!40000 ALTER TABLE `types` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
