CREATE DATABASE  IF NOT EXISTS `gunsdb` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `gunsdb`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: gunsdb
-- ------------------------------------------------------
-- Server version	5.5.57-MariaDB

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
-- Table structure for table `arm`
--

DROP TABLE IF EXISTS `arm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arm` (
  `product_ID` int(9) NOT NULL,
  `range` decimal(6,2) DEFAULT NULL,
  `category` enum('pistol','machine_gun','automatic_rifle') DEFAULT NULL,
  `weight` decimal(2,2) DEFAULT NULL,
  PRIMARY KEY (`product_ID`),
  CONSTRAINT `product_ID` FOREIGN KEY (`product_ID`) REFERENCES `product` (`product_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arm`
--

LOCK TABLES `arm` WRITE;
/*!40000 ALTER TABLE `arm` DISABLE KEYS */;
INSERT INTO `arm` VALUES (254698215,1254.25,'pistol',0.10),(457868838,8562.14,'pistol',0.75),(459738654,8562.14,'automatic_rifle',0.26),(548752169,4562.36,'automatic_rifle',0.63),(549762235,1452.36,'pistol',0.50),(556798421,5214.56,'machine_gun',0.60),(857649114,2015.40,'machine_gun',0.20);
/*!40000 ALTER TABLE `arm` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `gunsdb`.`arm_AFTER_INSERT` AFTER INSERT ON `arm` FOR EACH ROW
BEGIN
	
    IF (NEW.weight<=0.0) THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Warning: Weight must be a positive number! Please check again';
	END IF;


END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `gunsdb`.`arm_AFTER_UPDATE` AFTER UPDATE ON `arm` FOR EACH ROW
BEGIN
	
    IF (NEW.weight<=0.0) THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Warning: Weight must be a positive number! Please check again';
	END IF;
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `client_ID` int(9) NOT NULL,
  `is_legal` tinyint(1) DEFAULT NULL,
  `name` varchar(25) DEFAULT NULL,
  `country` varchar(25) DEFAULT NULL,
  `address` varchar(35) DEFAULT NULL,
  `zip` int(5) DEFAULT NULL,
  `phone_number` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`client_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (154842131,0,'Daher','France','43 Rue d\'Armor Maroué',22402,'330781654279'),(257154239,1,'Heym AG','United States','Dallas, TX, United States',59321,'201564721394'),(343594204,0,'Drass Srl','Italy','Piazza del Popolo 18',52369,'396874512369'),(481256931,0,'CEFA','France','42 Rue d\'Armor Maroué',22400,'330781562785'),(514812569,1,'ThyssenKrupp','Germany','Mads-Clausen-Straße 7',24939,'495687124596'),(547682136,1,'Zlin aircraft a.s.','Czech Republic','Letiště 1887',76502,'424104563555'),(598912345,0,'OCEA','France','Les Sables d\'Olonne',85100,'330785423697'),(678901234,1,'STARKINDUSTRIES','USA','5th Avenue',10012,'018912345678');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factory`
--

DROP TABLE IF EXISTS `factory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory` (
  `factory_ID` int(9) NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `city` varchar(25) DEFAULT NULL,
  `location` varchar(25) DEFAULT NULL,
  `address` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`factory_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factory`
--

LOCK TABLES `factory` WRITE;
/*!40000 ALTER TABLE `factory` DISABLE KEYS */;
INSERT INTO `factory` VALUES (255699123,'ΑΤΕΣΕ','Γρεβενά','ΓΡΕΒΕΝΑ','9ο Χλμ. ΓΡΕΒΕΝΩΝ - ΚΗΠΟΥΡΙΟΥ'),(458629317,'ΑΤΛ ΑΕΒΒΕ','Αθήνα','ΤΑΥΡΟΣ','Λ. ΕΙΡΗΝΗΣ 23'),(555236497,'VALPAK','Λάρισα','ΛΑΡΙΣΑ','9ο Χλμ ΕΘΝΙΚΗΣ ΟΔΟΥ ΛΑΡΙΣΑΣ - ΘΕΣΣ'),(582149355,'ΠΑΠΑΔΟΠΟΥΛΟΣ','Αθήνα','ΓΛΥΦΑΔΑ','ΙΚΑΡΙΑΣ 30-32'),(586913744,'CONTRA','Βόλος','Α΄ ΒΙ.ΠΕ.','5η ΟΔΟΣ, Α΄ ΒΙ.ΠΕ ΒΟΛΟΥ'),(648931753,'ΕΟΣ','Βόλος','Ν. ΙΩΝΙΑ','ΜΥΤΙΛΗΝΗΣ 15 & ΕΘΝΙΚΩΝ ΑΓΩΝΩΝ'),(856245487,'VIPPON','Θεσσαλονίκη','ΣΙΝΔΟΣ','ΒΙ.ΠΕ. ΘΕΣΣΑΛΟΝΙΚΗΣ'),(908761257,'MANTAS','Καλαμίτσι','ΓΡΕΒΕΝΑ','Γ.ΠΑΠΑΝΔΡΕΟΥ 13');
/*!40000 ALTER TABLE `factory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factory_has_project`
--

DROP TABLE IF EXISTS `factory_has_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_has_project` (
  `factorycode` int(9) NOT NULL,
  `projectcode` int(9) NOT NULL,
  PRIMARY KEY (`factorycode`,`projectcode`),
  KEY `pjid_idx` (`projectcode`),
  CONSTRAINT `factory_ID_fhp` FOREIGN KEY (`factorycode`) REFERENCES `factory` (`factory_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `project_ID_fhp` FOREIGN KEY (`projectcode`) REFERENCES `project` (`project_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factory_has_project`
--

LOCK TABLES `factory_has_project` WRITE;
/*!40000 ALTER TABLE `factory_has_project` DISABLE KEYS */;
INSERT INTO `factory_has_project` VALUES (255699123,485579135),(458629317,186426846),(555236497,481236485),(582149355,512610564),(586913744,586213842),(648931753,186426846),(648931753,596821136),(856245487,751335458),(908761257,186426846);
/*!40000 ALTER TABLE `factory_has_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factory_has_supplier`
--

DROP TABLE IF EXISTS `factory_has_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_has_supplier` (
  `factorycode` int(9) NOT NULL,
  `suppliercode` int(9) NOT NULL,
  PRIMARY KEY (`factorycode`,`suppliercode`),
  KEY `sid_idx` (`suppliercode`),
  CONSTRAINT `factory_ID_fhs` FOREIGN KEY (`factorycode`) REFERENCES `factory` (`factory_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `supplier_ID_fhs` FOREIGN KEY (`suppliercode`) REFERENCES `supplier` (`supplier_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factory_has_supplier`
--

LOCK TABLES `factory_has_supplier` WRITE;
/*!40000 ALTER TABLE `factory_has_supplier` DISABLE KEYS */;
INSERT INTO `factory_has_supplier` VALUES (255699123,584216931),(458629317,154821364),(555236497,851247691),(582149355,365217589),(586913744,134521675),(586913744,154821364),(648931753,264236890),(856245487,264236890),(856245487,584691359);
/*!40000 ALTER TABLE `factory_has_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `machine`
--

DROP TABLE IF EXISTS `machine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `machine` (
  `machine_ID` int(9) NOT NULL,
  `age` int(3) DEFAULT NULL,
  `automated` tinyint(1) DEFAULT NULL,
  `recycle` tinyint(1) DEFAULT NULL,
  `energy_class` varchar(5) DEFAULT NULL,
  `faccode` int(9) NOT NULL,
  PRIMARY KEY (`machine_ID`,`faccode`),
  KEY `factoryID_idx` (`faccode`),
  CONSTRAINT `fid` FOREIGN KEY (`faccode`) REFERENCES `factory` (`factory_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `machine`
--

LOCK TABLES `machine` WRITE;
/*!40000 ALTER TABLE `machine` DISABLE KEYS */;
INSERT INTO `machine` VALUES (178256988,2,1,1,'B',555236497),(256984268,46,0,1,'A+++',586913744),(258746135,12,1,0,'A+++',255699123),(485265253,50,1,0,'A',255699123),(487215698,4,0,0,'A',856245487),(487522943,9,0,1,'E',648931753),(586923225,5,1,0,'A+',856245487);
/*!40000 ALTER TABLE `machine` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `gunsdb`.`machine_AFTER_INSERT` AFTER INSERT ON `machine` FOR EACH ROW
BEGIN

	IF (NEW.age<=0.0) THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Warning: Age must be a positive number! Please check again';
	ELSEIF (NEW.age>50) THEN
		SIGNAL SQLSTATE '03000' SET MESSAGE_TEXT = 'Warning: A machine age cannot be that old! Please check again';
	END IF;


END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `gunsdb`.`machine_AFTER_UPDATE` AFTER UPDATE ON `machine` FOR EACH ROW
BEGIN

	IF (NEW.age<=0.0) THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Warning: Age must be a positive number! Please check again';
	ELSEIF (NEW.age>50) THEN
		SIGNAL SQLSTATE '03000' SET MESSAGE_TEXT = 'Warning: A machine age cannot be that old! Please check again';
	END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `maintenance`
--

DROP TABLE IF EXISTS `maintenance`;
/*!50001 DROP VIEW IF EXISTS `maintenance`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `maintenance` AS SELECT 
 1 AS `factory_ID`,
 1 AS `name`,
 1 AS `city`,
 1 AS `project_ID`,
 1 AS `field`,
 1 AS `date_started`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `monitoring`
--

DROP TABLE IF EXISTS `monitoring`;
/*!50001 DROP VIEW IF EXISTS `monitoring`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `monitoring` AS SELECT 
 1 AS `client_ID`,
 1 AS `clientname`,
 1 AS `country`,
 1 AS `phone_number`,
 1 AS `product_ID`,
 1 AS `hazard_category`,
 1 AS `core_material`,
 1 AS `WMSname`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `munition`
--

DROP TABLE IF EXISTS `munition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `munition` (
  `product_ID` int(9) NOT NULL,
  `material` enum('polymer','lead','steel') DEFAULT NULL,
  `bullet_diameter` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`product_ID`),
  CONSTRAINT `product_ID_mun` FOREIGN KEY (`product_ID`) REFERENCES `product` (`product_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `munition`
--

LOCK TABLES `munition` WRITE;
/*!40000 ALTER TABLE `munition` DISABLE KEYS */;
INSERT INTO `munition` VALUES (254698215,'polymer','1.5x25mm'),(457868838,'polymer','7.5x36mm'),(459738654,'polymer','2.5x15mm'),(548752169,'steel','1.1x12mm'),(549762235,'steel','7.3x55mm'),(556798421,'polymer','6x56mm'),(857649114,'lead','5x33mm');
/*!40000 ALTER TABLE `munition` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `gunsdb`.`munition_AFTER_INSERT` AFTER INSERT ON `munition` FOR EACH ROW
BEGIN

	IF ((NEW.bullet_diameter NOT REGEXP 'mm$') OR (NEW.bullet_diameter NOT REGEXP 'x')) THEN
		SIGNAL SQLSTATE '05000' SET MESSAGE_TEXT = 'Warning: Wrong dimensions of the bullet diameter! Please check again';
	END IF;


END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `gunsdb`.`munition_AFTER_UPDATE` AFTER UPDATE ON `munition` FOR EACH ROW
BEGIN

	IF ((NEW.bullet_diameter NOT REGEXP 'mm$') OR (NEW.bullet_diameter NOT REGEXP 'x')) THEN
		SIGNAL SQLSTATE '05000' SET MESSAGE_TEXT = 'Warning: Wrong dimensions of the bullet diameter! Please check again';
	END IF;


END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `clientcode` int(9) NOT NULL,
  `productcode` int(9) NOT NULL,
  `amount` int(7) DEFAULT NULL,
  PRIMARY KEY (`clientcode`,`productcode`),
  KEY `pid_idx` (`productcode`),
  CONSTRAINT `client_ID_order` FOREIGN KEY (`clientcode`) REFERENCES `client` (`client_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `product_ID_order` FOREIGN KEY (`productcode`) REFERENCES `product` (`product_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (154842131,254698215,150),(257154239,549762235,200),(343594204,459738654,200000),(481256931,857649114,5000),(514812569,556798421,60000),(547682136,457868838,560000),(598912345,548752169,1000000),(678901234,457868838,60000),(678901234,548752169,560000),(678901234,556798421,1000000);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `gunsdb`.`order_AFTER_INSERT` AFTER INSERT ON `order` FOR EACH ROW
BEGIN
		
	IF (NEW.amount<=0.0) THEN
			SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Warning: There cannot be a vacant order! Please check again';
	END IF;


END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `gunsdb`.`order_AFTER_UPDATE` AFTER UPDATE ON `order` FOR EACH ROW
BEGIN
	
    IF (NEW.amount<=0.0) THEN
			SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Warning: There cannot be a vacant order! Please check again';
	END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `produce`
--

DROP TABLE IF EXISTS `produce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produce` (
  `productcode` int(9) NOT NULL,
  `factorycode` int(9) NOT NULL,
  `amount` int(7) DEFAULT NULL,
  PRIMARY KEY (`productcode`,`factorycode`),
  KEY `fid_idx` (`factorycode`),
  KEY `fid_idx1` (`factorycode`),
  CONSTRAINT `fid_produce` FOREIGN KEY (`factorycode`) REFERENCES `factory` (`factory_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pid` FOREIGN KEY (`productcode`) REFERENCES `product` (`product_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produce`
--

LOCK TABLES `produce` WRITE;
/*!40000 ALTER TABLE `produce` DISABLE KEYS */;
INSERT INTO `produce` VALUES (254698215,458629317,1500),(457868838,582149355,525000),(459738654,255699123,458000),(548752169,255699123,1500000),(549762235,856245487,500000),(556798421,255699123,2000500),(857649114,582149355,1000000);
/*!40000 ALTER TABLE `produce` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `gunsdb`.`produce_AFTER_INSERT` AFTER INSERT ON `produce` FOR EACH ROW
BEGIN
	
    IF (NEW.amount<=0.0) THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Warning: There cannot be zero/negative production values! Please check again';
	END IF;


END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `gunsdb`.`produce_AFTER_UPDATE` AFTER UPDATE ON `produce` FOR EACH ROW
BEGIN

	IF (NEW.amount<=0.0) THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Warning: There cannot be zero/negative production values! Please check again';
	END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `product_ID` int(9) NOT NULL,
  `price` decimal(6,2) DEFAULT NULL,
  `manufacturing_date` date DEFAULT NULL,
  PRIMARY KEY (`product_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (254698215,2560.00,'1992-02-12'),(457868838,6000.00,'1967-09-09'),(459738654,4800.00,'1957-12-08'),(548752169,8560.00,'2011-02-08'),(549762235,5000.00,'2001-06-06'),(556798421,5000.00,'2006-08-08'),(857649114,2550.00,'2010-09-04');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `gunsdb`.`product_AFTER_INSERT` AFTER INSERT ON `product` FOR EACH ROW
BEGIN
	
    IF (NEW.price<=0.0) THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Warning: Price of a product cannot be a negative/zero number! Please check again';
	END IF;
	IF (NEW.manufacturing_date<="1879-01-01") THEN
		SIGNAL SQLSTATE '04000' SET MESSAGE_TEXT = 'Warning: A product cannot have been produced when the company did not exist! Please check again';
	END IF;


END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `gunsdb`.`product_AFTER_UPDATE` AFTER UPDATE ON `product` FOR EACH ROW
BEGIN
	
    IF (NEW.price<=0.0) THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Warning: Price of a product cannot be a negative/zero number! Please check again';
	END IF;
	IF (NEW.manufacturing_date<="1879-01-01") THEN
		SIGNAL SQLSTATE '04000' SET MESSAGE_TEXT = 'Warning: A product cannot have been produced when the company did not exist! Please check again';
	END IF;


END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `project_ID` int(9) NOT NULL,
  `field` varchar(25) DEFAULT NULL,
  `date_started` date DEFAULT NULL,
  PRIMARY KEY (`project_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (186426846,'BULLETS','2016-12-06'),(481236485,'TANK','1995-05-09'),(485579135,'GUNS','2018-09-25'),(512610564,'PCBs','2014-05-04'),(586213842,'intercommunication','2019-05-09'),(596821136,'Batteries','2019-06-05'),(751335458,'cameras','2017-08-08');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `gunsdb`.`project_AFTER_INSERT` AFTER INSERT ON `project` FOR EACH ROW
BEGIN

	IF (NEW.date_started<="1879-01-01") THEN
		SIGNAL SQLSTATE '04000' SET MESSAGE_TEXT = 'Warning: A project cannot have had started before the company! Please check again';
	END IF;


END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `gunsdb`.`project_AFTER_UPDATE` AFTER UPDATE ON `project` FOR EACH ROW
BEGIN

	IF (NEW.date_started<="1879-01-01") THEN
		SIGNAL SQLSTATE '04000' SET MESSAGE_TEXT = 'Warning: A project cannot have had started before the company! Please check again';
	END IF;


END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `supplier_ID` int(9) NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `phone_number` varchar(12) DEFAULT NULL,
  `location` varchar(25) DEFAULT NULL,
  `address` varchar(35) DEFAULT NULL,
  `zip` int(5) DEFAULT NULL,
  `is_legal` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`supplier_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (134521675,'IMT Corporation','585197450848','Canada','530 Manitou Drive',56482,1),(154821364,'Aspar Arms','374102988895','Αρμενία','60/1 Mamikoniants St',51,1),(264236890,'Viking Air','395197480848','Canada','50 Manitou Drive',56452,1),(365217589,'CamPro','456022988700','Canada','2715 West Grovers Avenue',85053,0),(584216931,'Bersa S.A. (Bersa)','541140034100','Argentina','Magallanes 775',1704,1),(584691359,'Union Ind. Militar. (UIM)','302106728535','Greece','7 Stratigi Street Neo Psychico',15451,1),(851247691,'Austal Limited','618941011114','Australia','100 Clarence Beach Road',6166,1);
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weapon_and_missile_system`
--

DROP TABLE IF EXISTS `weapon_and_missile_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weapon_and_missile_system` (
  `product_ID` int(9) NOT NULL,
  `range` decimal(6,2) DEFAULT NULL,
  `hazard_category` enum('1','2','3','4','5') DEFAULT NULL,
  `core_material` enum('explosive','chemical','biological') DEFAULT NULL,
  `type` enum('air-to-air','air-to-surface','surface-to-air','antiship','antitank') DEFAULT NULL,
  `name` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`product_ID`),
  CONSTRAINT `product_ID_wps` FOREIGN KEY (`product_ID`) REFERENCES `product` (`product_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weapon_and_missile_system`
--

LOCK TABLES `weapon_and_missile_system` WRITE;
/*!40000 ALTER TABLE `weapon_and_missile_system` DISABLE KEYS */;
INSERT INTO `weapon_and_missile_system` VALUES (254698215,5698.45,'1','explosive','air-to-air','A45KLX'),(457868838,1548.14,'5','explosive','air-to-air','K25LTXS'),(459738654,9543.25,'2','biological','air-to-air','KD66TXD'),(548752169,8631.75,'4','chemical','surface-to-air','DLO56'),(549762235,6841.13,'3','chemical','antitank','OKL998'),(556798421,2358.25,'2','chemical','antiship','YUTAL5'),(857649114,5485.25,'2','biological','air-to-air','TZI96KT');
/*!40000 ALTER TABLE `weapon_and_missile_system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'gunsdb'
--

--
-- Dumping routines for database 'gunsdb'
--

--
-- Final view structure for view `maintenance`
--

/*!50001 DROP VIEW IF EXISTS `maintenance`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `maintenance` AS select `factory`.`factory_ID` AS `factory_ID`,`factory`.`name` AS `name`,`factory`.`city` AS `city`,`project`.`project_ID` AS `project_ID`,`project`.`field` AS `field`,`project`.`date_started` AS `date_started` from (((`factory_has_project` join `project` on((`factory_has_project`.`projectcode` = `project`.`project_ID`))) join `factory` on((`factory_has_project`.`factorycode` = `factory`.`factory_ID`))) join `machine` on((`factory`.`factory_ID` = `machine`.`faccode`))) where (`machine`.`age` > 20) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `monitoring`
--

/*!50001 DROP VIEW IF EXISTS `monitoring`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `monitoring` AS select `client`.`client_ID` AS `client_ID`,`client`.`name` AS `clientname`,`client`.`country` AS `country`,`client`.`phone_number` AS `phone_number`,`weapon_and_missile_system`.`product_ID` AS `product_ID`,`weapon_and_missile_system`.`hazard_category` AS `hazard_category`,`weapon_and_missile_system`.`core_material` AS `core_material`,`weapon_and_missile_system`.`name` AS `WMSname` from ((`client` join `order` on((`client`.`client_ID` = `order`.`clientcode`))) join `weapon_and_missile_system` on((`order`.`productcode` = `weapon_and_missile_system`.`product_ID`))) where ((`client`.`is_legal` = 0) and (`weapon_and_missile_system`.`hazard_category` < 3)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-23  0:06:11
