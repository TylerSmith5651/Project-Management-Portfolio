CREATE DATABASE  IF NOT EXISTS `starbucks_stock` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `starbucks_stock`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: starbucks_stock
-- ------------------------------------------------------
-- Server version	5.7.20-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `current_stock`
--

DROP TABLE IF EXISTS `current_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `current_stock` (
  `Item_Volume` int(11) NOT NULL,
  PRIMARY KEY (`Item_Volume`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `current_stock`
--

LOCK TABLES `current_stock` WRITE;
/*!40000 ALTER TABLE `current_stock` DISABLE KEYS */;
INSERT INTO `current_stock` VALUES (0),(13),(14),(22),(23),(25),(34),(46),(48),(65),(68);
/*!40000 ALTER TABLE `current_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_list`
--

DROP TABLE IF EXISTS `inventory_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_list` (
  `Suggested_Volume` int(11) NOT NULL,
  `Item_SKU` int(11) DEFAULT NULL,
  `Item_Name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Suggested_Volume`),
  KEY `Item_SKU_idx` (`Item_SKU`),
  KEY `Item_Name_idx` (`Item_Name`),
  CONSTRAINT `Item_Name` FOREIGN KEY (`Item_Name`) REFERENCES `item_description` (`Item_Name`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `Item_SKU` FOREIGN KEY (`Item_SKU`) REFERENCES `sku_data` (`Item_SKU`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_list`
--

LOCK TABLES `inventory_list` WRITE;
/*!40000 ALTER TABLE `inventory_list` DISABLE KEYS */;
INSERT INTO `inventory_list` VALUES (20,123456,'Steak and Egg Wrap'),(28,123846,'Bacon Gouda Sandwhich'),(30,109123,'Banana Nut Bread'),(35,127894,'Birthday Cake Pop'),(40,165234,'Butter Croissant'),(48,182387,'Cheese Danish'),(52,189234,'Chocolate Cake Pop'),(76,235674,'Chocolate Croissant'),(100,768542,'Cranberry Bliss Bar'),(220,789532,'Morning Bun'),(320,872634,'Peppermint Brownie Cake Pop');
/*!40000 ALTER TABLE `inventory_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_description`
--

DROP TABLE IF EXISTS `item_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_description` (
  `Item_Name` varchar(30) NOT NULL,
  `Item_Description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Item_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_description`
--

LOCK TABLES `item_description` WRITE;
/*!40000 ALTER TABLE `item_description` DISABLE KEYS */;
INSERT INTO `item_description` VALUES ('Bacon Gouda Sandwhich','Bacon Gouda and Cheese'),('Banana Nut Bread','Banana Bread with Walnut Topping'),('Birthday Cake Pop','Vanilla flavored Cake Pop with pink icing'),('Butter Croissant','Plain Crossant made with real french butter'),('Cheese Danish','Puff pastry filled with cream cheese mixture'),('Chocolate Cake Pop','Chocolate Cake Pop with chocolate icing'),('Chocolate Croissant','Flaky Croissant with Dark Chocolate'),('Cranberry Bliss Bar','Cream cheese and cranberry bar'),('Morning Bun','A Flaky ROll filled with cinnamon and sugar'),('Peppermint Brownie Cake Pop','Brownie Cake Pop with peppermint icing'),('Steak and Egg Wrap','Steak, Egg and Tomatillo Wrap');
/*!40000 ALTER TABLE `item_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_creation`
--

DROP TABLE IF EXISTS `order_creation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_creation` (
  `Suggested_Volume` int(11) NOT NULL,
  `Item_Volume` int(11) NOT NULL,
  `Stock_Ordered` int(11) NOT NULL,
  `Item_SKU` int(11) DEFAULT NULL,
  KEY `Suggested_Volume_idx` (`Suggested_Volume`),
  KEY `Item_Volume_idx` (`Item_Volume`),
  KEY `Item_SKU_idx` (`Item_SKU`),
  CONSTRAINT `Item_Volume` FOREIGN KEY (`Item_Volume`) REFERENCES `current_stock` (`Item_Volume`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Suggested_Volume` FOREIGN KEY (`Suggested_Volume`) REFERENCES `inventory_list` (`Suggested_Volume`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_creation`
--

LOCK TABLES `order_creation` WRITE;
/*!40000 ALTER TABLE `order_creation` DISABLE KEYS */;
INSERT INTO `order_creation` VALUES (30,13,18,NULL),(35,14,20,NULL),(40,22,20,NULL),(48,23,25,NULL),(52,25,28,NULL),(76,34,42,NULL),(100,46,54,NULL),(220,48,200,NULL),(320,65,255,NULL),(28,68,0,NULL),(20,0,20,NULL);
/*!40000 ALTER TABLE `order_creation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sku_data`
--

DROP TABLE IF EXISTS `sku_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sku_data` (
  `Item_SKU` int(11) NOT NULL,
  PRIMARY KEY (`Item_SKU`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sku_data`
--

LOCK TABLES `sku_data` WRITE;
/*!40000 ALTER TABLE `sku_data` DISABLE KEYS */;
INSERT INTO `sku_data` VALUES (109123),(123456),(123846),(127894),(165234),(182387),(189234),(235674),(768542),(789532),(872634);
/*!40000 ALTER TABLE `sku_data` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-27 13:48:31
