-- MySQL dump 10.13  Distrib 8.4.3, for Win64 (x86_64)
--
-- Host: localhost    Database: acore_world
-- ------------------------------------------------------
-- Server version	8.4.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `spell_loot_template`
--

DROP TABLE IF EXISTS `spell_loot_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spell_loot_template` (
  `Entry` int unsigned NOT NULL DEFAULT '0',
  `Item` int unsigned NOT NULL DEFAULT '0',
  `Reference` int NOT NULL DEFAULT '0',
  `Chance` float NOT NULL DEFAULT '100',
  `QuestRequired` tinyint NOT NULL DEFAULT '0',
  `LootMode` smallint unsigned NOT NULL DEFAULT '1',
  `GroupId` tinyint unsigned NOT NULL DEFAULT '0',
  `MinCount` tinyint unsigned NOT NULL DEFAULT '1',
  `MaxCount` tinyint unsigned NOT NULL DEFAULT '1',
  `Comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Entry`,`Item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Loot System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spell_loot_template`
--

LOCK TABLES `spell_loot_template` WRITE;
/*!40000 ALTER TABLE `spell_loot_template` DISABLE KEYS */;
INSERT INTO `spell_loot_template` VALUES
(48247,37168,0,100,0,1,0,1,1,'Mysterious Tarot'),
(57844,36782,0,89,0,1,1,1,3,'Succulent Clam Meat'),
(57844,36783,0,10,0,1,1,1,1,'Northsea Pearl'),
(57844,36784,0,1,0,1,1,1,1,'Siren\'s Tear'),
(58160,24477,0,100,0,1,0,1,1,'Jaggal Clam Meat'),
(58160,24478,0,15,0,1,1,1,1,'Jaggal Pearl'),
(58160,24479,0,1,0,1,1,1,1,'Shadow Pearl'),
(58165,5498,0,3,0,1,1,1,1,'Small Lustrous Pearl'),
(58165,5500,0,1,0,1,1,1,1,'Iridescent Pearl'),
(58165,7971,0,4,0,1,1,1,1,'Black Pearl'),
(58165,7974,0,100,0,1,0,1,1,'Zesty Clam Meat'),
(58165,13926,0,0.5,0,1,1,1,1,'Golden Pearl'),
(58168,5498,0,5,0,1,1,1,1,'Small Lustrous Pearl'),
(58168,5500,0,2.5,0,1,1,1,1,'Iridescent Pearl'),
(58168,5504,0,100,0,1,0,1,1,'Tangy Clam Meat'),
(58172,5498,0,5,0,1,1,1,1,'Small Lustrous Pearl'),
(58172,5503,0,100,0,1,0,1,1,'Clam Meat'),
(59480,44142,0,100,0,1,0,1,1,'Strange Tarot'),
(59487,44161,0,100,0,1,0,1,1,'Arcane Tarot'),
(59491,44163,0,100,0,1,0,1,1,'Shadowy Tarot'),
(59502,19227,0,0,0,1,1,1,1,'Ace of Beasts'),
(59502,19230,0,0,0,1,1,1,1,'Two of Beasts'),
(59502,19231,0,0,0,1,1,1,1,'Three of Beasts'),
(59502,19232,0,0,0,1,1,1,1,'Four of Beasts'),
(59502,19233,0,0,0,1,1,1,1,'Five of Beasts'),
(59502,19234,0,0,0,1,1,1,1,'Six of Beasts'),
(59502,19235,0,0,0,1,1,1,1,'Seven of Beasts'),
(59502,19236,0,0,0,1,1,1,1,'Eight of Beasts'),
(59502,19258,0,0,0,1,1,1,1,'Ace of Warlords'),
(59502,19259,0,0,0,1,1,1,1,'Two of Warlords'),
(59502,19260,0,0,0,1,1,1,1,'Three of Warlords'),
(59502,19261,0,0,0,1,1,1,1,'Four of Warlords'),
(59502,19262,0,0,0,1,1,1,1,'Five of Warlords'),
(59502,19263,0,0,0,1,1,1,1,'Six of Warlords'),
(59502,19264,0,0,0,1,1,1,1,'Seven of Warlords'),
(59502,19265,0,0,0,1,1,1,1,'Eight of Warlords'),
(59502,19268,0,0,0,1,1,1,1,'Ace of Elementals'),
(59502,19269,0,0,0,1,1,1,1,'Two of Elementals'),
(59502,19270,0,0,0,1,1,1,1,'Three of Elementals'),
(59502,19271,0,0,0,1,1,1,1,'Four of Elementals'),
(59502,19272,0,0,0,1,1,1,1,'Five of Elementals'),
(59502,19273,0,0,0,1,1,1,1,'Six of Elementals'),
(59502,19274,0,0,0,1,1,1,1,'Seven of Elementals'),
(59502,19275,0,0,0,1,1,1,1,'Eight of Elementals'),
(59502,19276,0,0,0,1,1,1,1,'Ace of Portals'),
(59502,19278,0,0,0,1,1,1,1,'Two of Portals'),
(59502,19279,0,0,0,1,1,1,1,'Three of Portals'),
(59502,19280,0,0,0,1,1,1,1,'Four of Portals'),
(59502,19281,0,0,0,1,1,1,1,'Five of Portals'),
(59502,19282,0,0,0,1,1,1,1,'Six of Portals'),
(59502,19283,0,0,0,1,1,1,1,'Seven of Portals'),
(59502,19284,0,0,0,1,1,1,1,'Eight of Portals'),
(59503,31882,0,0,0,1,1,1,1,'Ace of Blessings'),
(59503,31883,0,0,0,1,1,1,1,'Eight of Blessings'),
(59503,31884,0,0,0,1,1,1,1,'Five of Blessings'),
(59503,31885,0,0,0,1,1,1,1,'Four of Blessings'),
(59503,31886,0,0,0,1,1,1,1,'Seven of Blessings'),
(59503,31887,0,0,0,1,1,1,1,'Six of Blessings'),
(59503,31888,0,0,0,1,1,1,1,'Three of Blessings'),
(59503,31889,0,0,0,1,1,1,1,'Two of Blessings'),
(59503,31892,0,0,0,1,1,1,1,'Ace of Storms'),
(59503,31893,0,0,0,1,1,1,1,'Eight of Storms'),
(59503,31894,0,0,0,1,1,1,1,'Five of Storms'),
(59503,31895,0,0,0,1,1,1,1,'Four of Storms'),
(59503,31896,0,0,0,1,1,1,1,'Seven of Storms'),
(59503,31898,0,0,0,1,1,1,1,'Six of Storms'),
(59503,31899,0,0,0,1,1,1,1,'Three of Storms'),
(59503,31900,0,0,0,1,1,1,1,'Two of Storms'),
(59503,31901,0,0,0,1,1,1,1,'Ace of Furies'),
(59503,31902,0,0,0,1,1,1,1,'Eight of Furies'),
(59503,31903,0,0,0,1,1,1,1,'Five of Furies'),
(59503,31904,0,0,0,1,1,1,1,'Four of Furies'),
(59503,31905,0,0,0,1,1,1,1,'Seven of Furies'),
(59503,31906,0,0,0,1,1,1,1,'Six of Furies'),
(59503,31908,0,0,0,1,1,1,1,'Three of Furies'),
(59503,31909,0,0,0,1,1,1,1,'Two of Furies'),
(59503,31910,0,0,0,1,1,1,1,'Ace of Lunacy'),
(59503,31911,0,0,0,1,1,1,1,'Eight of Lunacy'),
(59503,31912,0,0,0,1,1,1,1,'Five of Lunacy'),
(59503,31913,0,0,0,1,1,1,1,'Four of Lunacy'),
(59503,31915,0,0,0,1,1,1,1,'Seven of Lunacy'),
(59503,31916,0,0,0,1,1,1,1,'Six of Lunacy'),
(59503,31917,0,0,0,1,1,1,1,'Three of Lunacy'),
(59503,31918,0,0,0,1,1,1,1,'Two of Lunacy'),
(59504,44260,0,0,0,1,1,1,1,'Ace of Prisms'),
(59504,44261,0,0,0,1,1,1,1,'Two of Prisms'),
(59504,44262,0,0,0,1,1,1,1,'Three of Prisms'),
(59504,44263,0,0,0,1,1,1,1,'Four of Prisms'),
(59504,44264,0,0,0,1,1,1,1,'Five of Prisms'),
(59504,44265,0,0,0,1,1,1,1,'Six of Prisms'),
(59504,44266,0,0,0,1,1,1,1,'Seven of Prisms'),
(59504,44267,0,0,0,1,1,1,1,'Eight of Prisms'),
(59504,44268,0,0,0,1,1,1,1,'Ace of Nobles'),
(59504,44269,0,0,0,1,1,1,1,'Two of Nobles'),
(59504,44270,0,0,0,1,1,1,1,'Three of Nobles'),
(59504,44271,0,0,0,1,1,1,1,'Four of Nobles'),
(59504,44272,0,0,0,1,1,1,1,'Five of Nobles'),
(59504,44273,0,0,0,1,1,1,1,'Six of Nobles'),
(59504,44274,0,0,0,1,1,1,1,'Seven of Nobles'),
(59504,44275,0,0,0,1,1,1,1,'Eight of Nobles'),
(59504,44277,0,0,0,1,1,1,1,'Ace of Chaos'),
(59504,44278,0,0,0,1,1,1,1,'Two of Chaos'),
(59504,44279,0,0,0,1,1,1,1,'Three of Chaos'),
(59504,44280,0,0,0,1,1,1,1,'Four of Chaos'),
(59504,44281,0,0,0,1,1,1,1,'Five of Chaos'),
(59504,44282,0,0,0,1,1,1,1,'Six of Chaos'),
(59504,44284,0,0,0,1,1,1,1,'Seven of Chaos'),
(59504,44285,0,0,0,1,1,1,1,'Eight of Chaos'),
(59504,44286,0,0,0,1,1,1,1,'Ace of Undeath'),
(59504,44287,0,0,0,1,1,1,1,'Two of Undeath'),
(59504,44288,0,0,0,1,1,1,1,'Three of Undeath'),
(59504,44289,0,0,0,1,1,1,1,'Four of Undeath'),
(59504,44290,0,0,0,1,1,1,1,'Five of Undeath'),
(59504,44291,0,0,0,1,1,1,1,'Six of Undeath'),
(59504,44292,0,0,0,1,1,1,1,'Seven of Undeath'),
(59504,44293,0,0,0,1,1,1,1,'Eight of Undeath'),
(60445,11025,11025,100,0,1,1,1,1,'(ReferenceTable)'),
(60893,40077,0,0,0,1,1,1,3,'Crazy Alchemist\'s Potion'),
(60893,40087,0,0,0,1,1,1,3,'Powerful Rejuvenation Potion'),
(60893,40097,0,0,0,1,1,1,3,'Elixir of Protection'),
(60893,40109,0,0,0,1,1,1,3,'Elixir of Mighty Mageblood'),
(60893,40211,0,0,0,1,1,1,3,'Potion of Speed'),
(60893,40212,0,0,0,1,1,1,3,'Potion of Wild Magic'),
(60893,44325,0,0,0,1,1,1,3,'Elixir of Accuracy'),
(60893,44327,0,0,0,1,1,1,3,'Elixir of Deadly Strikes'),
(60893,44328,0,0,0,1,1,1,3,'Elixir of Mighty Defense'),
(60893,44329,0,0,0,1,1,1,3,'Elixir of Expertise'),
(60893,44330,0,0,0,1,1,1,3,'Elixir of Armor Piercing'),
(60893,44331,0,0,0,1,1,1,3,'Elixir of Lightning Speed'),
(61177,37092,0,0,0,1,1,1,3,'Scroll of Intellect VIII'),
(61177,37094,0,0,0,1,1,1,3,'Scroll of Stamina VIII'),
(61177,37098,0,0,0,1,1,1,3,'Scroll of Spirit VIII'),
(61177,43145,0,0,0,1,1,1,1,'Armor Vellum III'),
(61177,43146,0,0,0,1,1,1,1,'Weapon Vellum III'),
(61177,43464,0,0,0,1,1,1,3,'Scroll of Agility VIII'),
(61177,43466,0,0,0,1,1,1,3,'Scroll of Strength VIII'),
(61177,44315,0,0,0,1,1,1,1,'Scroll of Recall III'),
(61288,1477,0,0,0,1,1,1,3,'Scroll of Agility II'),
(61288,1478,0,0,0,1,1,1,3,'Scroll of Protection II'),
(61288,1711,0,0,0,1,1,1,3,'Scroll of Stamina II'),
(61288,1712,0,0,0,1,1,1,3,'Scroll of Spirit II'),
(61288,2289,0,0,0,1,1,1,3,'Scroll of Strength II'),
(61288,2290,0,0,0,1,1,1,3,'Scroll of Intellect II'),
(61288,37118,0,0,0,1,1,1,1,'Scroll of Recall'),
(61288,38682,0,0,0,1,1,1,1,'Armor Vellum'),
(61288,39349,0,0,0,1,1,1,1,'Weapon Vellum'),
(61500,36909,0,0,0,1,1,1,1,'Cobalt Ore'),
(61898,15924,0,100,0,1,0,1,1,'Soft-shelled Clam Meat'),
(62941,23094,0,0,0,1,1,1,1,'Teardrop Blood Garnet'),
(62941,23095,0,0,0,1,1,1,1,'Bold Blood Garnet'),
(62941,23114,0,0,0,1,1,1,1,'Gleaming Golden Draenite'),
(62941,23115,0,0,0,1,1,1,1,'Thick Golden Draenite'),
(62941,23116,0,0,0,1,1,1,1,'Rigid Golden Draenite'),
(62941,23118,0,0,0,1,1,1,1,'Solid Azure Moonstone'),
(62941,23119,0,0,0,1,1,1,1,'Sparkling Azure Moonstone'),
(62941,23120,0,0,0,1,1,1,1,'Stormy Azure Moonstone'),
(62941,28595,0,0,0,1,1,1,1,'Bright Blood Garnet'),
(64051,45854,0,100,0,1,0,1,1,'Rituals of the New Moon'),
(64202,36782,0,100,0,1,0,3,5,'Succulent Clam Meat'),
(64202,36783,0,50,0,1,1,1,1,'Northsea Pearl'),
(64202,36784,0,5,0,1,1,1,1,'Siren\'s Tear'),
(69412,34054,0,0,0,1,1,7,17,'Infinite Dust'),
(69412,34055,0,0,0,1,1,2,6,'Greater Cosmic Essence');
/*!40000 ALTER TABLE `spell_loot_template` ENABLE KEYS */;
UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-19 12:09:41
