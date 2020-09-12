-- MySQL dump 10.17  Distrib 10.3.13-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: hospital
-- ------------------------------------------------------
-- Server version	10.3.13-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `consult`
--

DROP TABLE IF EXISTS `consult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consult` (
  `Room_NO` int(11) DEFAULT NULL,
  `D_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consult`
--

LOCK TABLES `consult` WRITE;
/*!40000 ALTER TABLE `consult` DISABLE KEYS */;
INSERT INTO `consult` VALUES (515,3689),(516,3690),(517,3691),(518,3692),(519,3693);
/*!40000 ALTER TABLE `consult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctor` (
  `E_ID` varchar(50) DEFAULT NULL,
  `D_ID` int(11) DEFAULT NULL,
  `Specialization` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES ('DR101',3689,'Eye Specialist'),('DR102',3690,'Cardiologist'),('DR103',3691,'Gynacologist');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employes`
--

DROP TABLE IF EXISTS `employes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employes` (
  `E_ID` char(50) DEFAULT NULL,
  `E_Name` varchar(50) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Salary` bigint(20) DEFAULT NULL,
  `Contact` bigint(20) DEFAULT NULL,
  `Username` varchar(50) DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employes`
--

LOCK TABLES `employes` WRITE;
/*!40000 ALTER TABLE `employes` DISABLE KEYS */;
INSERT INTO `employes` VALUES ('DR101','John Schmidth',20,20000,9481602345,'john','1234'),('DR102','Ralphal Singh',32,25000,999844578,'ralph','1234'),('DR103','Ram Gopal',23,20000,8756928564,'ram','2345'),('RMP104','Shyam Sundar',34,23000,9874658232,'shyam','3456'),('RMP105','Jay Shetty',33,29000,7874351627,'jay','4567'),('RMP106','Pichai Sundar',40,33000,9874560967,'pichai','5678'),('S107','Hopkins',27,24000,9850683743,'hopkins','6789'),('S108','Anush Sharma',40,30000,183746255,'anush','7890'),('S108','Teddy Sharma',30,34000,3241578243,'ted','890'),('MED201','Sharma Singh',21,30000,9877631257,'ari','dam'),('D108','David Johnson',54,25000,2347659875,'apple','123456');
/*!40000 ALTER TABLE `employes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipd`
--

DROP TABLE IF EXISTS `ipd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipd` (
  `D_ID` int(11) DEFAULT NULL,
  `P_ID` int(11) DEFAULT NULL,
  `Disease` varchar(50) DEFAULT NULL,
  `Medicine` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipd`
--

LOCK TABLES `ipd` WRITE;
/*!40000 ALTER TABLE `ipd` DISABLE KEYS */;
INSERT INTO `ipd` VALUES (3689,215,'Acne ','Antacids '),(3690,216,'Aging','Dehydroepiandrosterone '),(3691,217,'Alopecia','\r\nMinoxidil\r\n'),(3692,218,'Angina','Nitrates');
/*!40000 ALTER TABLE `ipd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicine`
--

DROP TABLE IF EXISTS `medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicine` (
  `Med_ID` int(11) DEFAULT NULL,
  `Med_Name` varchar(50) DEFAULT NULL,
  `Batch_No` int(11) DEFAULT NULL,
  `Purchase_Date` date DEFAULT NULL,
  `Expirey_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine`
--

LOCK TABLES `medicine` WRITE;
/*!40000 ALTER TABLE `medicine` DISABLE KEYS */;
INSERT INTO `medicine` VALUES (1,'Asprin',12,'2018-01-01','2019-02-10'),(2,'Paracetamol',10,'2018-02-01','2019-03-10'),(3,'Cough Syrup',10,'2018-02-01','2019-01-11'),(4,'Ventolin',10,'2018-02-01','2019-03-16'),(5,'Nexium',12,'2018-01-01','2019-02-17'),(6,'Lantus Solostar',12,'2018-01-01','2019-03-10'),(7,'Lyrica',12,'2018-01-01','2019-03-19'),(8,'Januvia',13,'2018-03-01','2019-01-18'),(9,'Vyvanse',13,'2018-03-01','2019-06-11'),(10,'Spiriva',13,'2018-03-01','2019-01-21');
/*!40000 ALTER TABLE `medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opd`
--

DROP TABLE IF EXISTS `opd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opd` (
  `P_ID` int(11) DEFAULT NULL,
  `D_ID` int(11) DEFAULT NULL,
  `Disease` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opd`
--

LOCK TABLES `opd` WRITE;
/*!40000 ALTER TABLE `opd` DISABLE KEYS */;
INSERT INTO `opd` VALUES (215,3689,'Achne '),(216,3690,'Aging '),(217,3691,'Alopecia '),(218,3692,'Angina ');
/*!40000 ALTER TABLE `opd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient` (
  `P_ID` int(11) DEFAULT NULL,
  `P_Name` varchar(25) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `Contact` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (216,'Messi','Male','54 Shane Lane  ,LA, 770-322-6089'),(217,'Bold','Male','46 Rammo Lane  ,Cape City, 770-452-6089'),(218,'Randy','Male',' Few Lane  , California, 770-452-6269'),(219,'Marry','Female','2877 Snider Street,Englewood,Colorado,720-250-1849'),(220,'Arita','Female','27 Carri Street,Englewood,Colorado,720-251-1459'),(221,'Helen','Female','52 James Street,Staplin,San Fransisco,620-351-1219'),(215,'Optimas Prime','Male','34 IIITDM 9823482736984');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_for_admittance`
--

DROP TABLE IF EXISTS `room_for_admittance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room_for_admittance` (
  `Room_ID` int(11) DEFAULT NULL,
  `P_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_for_admittance`
--

LOCK TABLES `room_for_admittance` WRITE;
/*!40000 ALTER TABLE `room_for_admittance` DISABLE KEYS */;
INSERT INTO `room_for_admittance` VALUES (515,215),(516,216),(517,217),(518,218),(519,219);
/*!40000 ALTER TABLE `room_for_admittance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `E_ID` varchar(50) DEFAULT NULL,
  `Chategory` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES ('S101','Maintainance'),('S102','Maintainance'),('S103',NULL),('S104',NULL),('S105',NULL);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-14 14:03:20
