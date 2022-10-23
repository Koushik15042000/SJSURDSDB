CREATE DATABASE  IF NOT EXISTS `sjsu_rental_database` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sjsu_rental_database`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sjsu_rental_database
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `amenities`
--

DROP TABLE IF EXISTS `amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amenities` (
  `Amenities_ID` int NOT NULL,
  `Name` varchar(300) NOT NULL,
  PRIMARY KEY (`Amenities_ID`),
  UNIQUE KEY `Amenities_ID` (`Amenities_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amenities`
--

LOCK TABLES `amenities` WRITE;
/*!40000 ALTER TABLE `amenities` DISABLE KEYS */;
INSERT INTO `amenities` VALUES (1,'WIFI'),(2,'MINI FRIDGE'),(3,'JACUZZI'),(4,'SWIMMING POOL'),(5,'GYM'),(6,'BARBEQUE'),(7,'BANQUET'),(8,'BUFFET'),(9,'PARKING'),(10,'SPA');
/*!40000 ALTER TABLE `amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amenities_provided`
--

DROP TABLE IF EXISTS `amenities_provided`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amenities_provided` (
  `Listing_ID` int NOT NULL,
  `Amenities_ID` int NOT NULL,
  PRIMARY KEY (`Listing_ID`,`Amenities_ID`),
  KEY `Amenities_ID` (`Amenities_ID`),
  CONSTRAINT `amenities_provided_ibfk_1` FOREIGN KEY (`Amenities_ID`) REFERENCES `amenities` (`Amenities_ID`),
  CONSTRAINT `amenities_provided_ibfk_2` FOREIGN KEY (`Listing_ID`) REFERENCES `listings` (`Listings_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amenities_provided`
--

LOCK TABLES `amenities_provided` WRITE;
/*!40000 ALTER TABLE `amenities_provided` DISABLE KEYS */;
INSERT INTO `amenities_provided` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(7,2),(2,3),(1,4),(3,4),(7,4),(8,4),(10,4),(1,5),(2,5),(3,5),(8,5),(10,5),(1,6),(4,6),(9,6),(1,7),(6,7),(1,8),(1,9),(2,9),(3,9),(5,9),(6,9),(7,9),(8,9),(10,9),(1,10),(4,10),(5,10),(9,10);
/*!40000 ALTER TABLE `amenities_provided` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `Booking_ID` int NOT NULL,
  `Customer_ID` int NOT NULL,
  `Listing_ID` int NOT NULL,
  `Unit_Alloted` varchar(50) NOT NULL,
  `Price_Incurred` decimal(8,2) NOT NULL,
  `Booking_From` datetime NOT NULL,
  `Booking_To` datetime NOT NULL,
  `Booking_Category` varchar(50) NOT NULL,
  `Payment_ID` varchar(30) NOT NULL,
  PRIMARY KEY (`Booking_ID`),
  UNIQUE KEY `Booking_ID` (`Booking_ID`),
  UNIQUE KEY `Payment_ID` (`Payment_ID`),
  KEY `FK_CustomerID` (`Customer_ID`),
  KEY `FK_ListingID` (`Listing_ID`),
  CONSTRAINT `FK_CustomerID` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`),
  CONSTRAINT `FK_ListingID` FOREIGN KEY (`Listing_ID`) REFERENCES `listings` (`Listings_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1,2,4,'Bungalow 504',2640.00,'2022-01-02 00:00:00','2022-01-04 00:00:00','Completed','3'),(2,1,3,'Group House 2',440.00,'2022-02-03 00:00:00','2022-02-05 00:00:00','Cancelled','4'),(3,4,5,'702',2080.00,'2022-03-03 00:00:00','2022-03-07 00:00:00','Completed','2'),(4,5,2,'535',500.00,'2022-04-23 00:00:00','2022-04-25 00:00:00','Completed','1'),(5,3,7,'450',630.00,'2022-05-14 00:00:00','2022-05-16 00:00:00','Completed','5'),(6,6,6,'Group House 4',1258.00,'2022-06-18 00:00:00','2022-06-20 00:00:00','Completed','8'),(7,7,1,'Villa 7',1840.00,'2022-03-13 00:00:00','2022-03-17 00:00:00','Completed','6'),(8,9,7,'677',500.00,'2022-07-13 00:00:00','2022-07-15 00:00:00','Completed','7'),(9,10,6,'Group House 1',3920.00,'2022-01-23 00:00:00','2022-01-27 00:00:00','Cancelled','10'),(10,8,3,'Group House 8',1040.00,'2022-02-13 00:00:00','2022-02-15 00:00:00','Completed','9');
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `Country_ID` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  PRIMARY KEY (`Country_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'USA');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `Customer_ID` int NOT NULL,
  `First_Name` varchar(45) NOT NULL,
  `Last_Name` varchar(45) NOT NULL,
  `Gender` char(1) NOT NULL,
  `Email_ID` varchar(100) NOT NULL,
  `Primary_Phone` varchar(12) NOT NULL,
  `Secondary_Phone` varchar(12) DEFAULT NULL,
  `Age` int DEFAULT NULL,
  `Gov_ID` varchar(45) NOT NULL,
  `Apt_no` varchar(10) DEFAULT NULL,
  `Street_Address` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `State_ID` int DEFAULT NULL,
  `Zip_Code` varchar(10) DEFAULT NULL,
  `Country_ID` int DEFAULT NULL,
  `Verification_status` int NOT NULL,
  PRIMARY KEY (`Customer_ID`),
  UNIQUE KEY `Email_ID` (`Email_ID`),
  UNIQUE KEY `Primary_Phone` (`Primary_Phone`),
  UNIQUE KEY `Gov_ID` (`Gov_ID`),
  KEY `State_ID` (`State_ID`),
  KEY `Country_ID` (`Country_ID`),
  KEY `Verification_status` (`Verification_status`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`State_ID`) REFERENCES `state` (`State_ID`),
  CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`Country_ID`) REFERENCES `country` (`Country_ID`),
  CONSTRAINT `customer_ibfk_3` FOREIGN KEY (`Verification_status`) REFERENCES `verification` (`Verification_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'VRUSHALI','MENTHE','F','vrushalimenthe29@gmail.com','4086909378','6902339845',23,'6549835496','204','171 W JULIAN ST','SAN JOSE',3,'95110',1,2),(2,'ABOLI','WANKHANDE','F','aboli04@gmail.com','9096496849','6696546354',26,'3818987554','315','868 S 5TH ST','SAN JOSE',3,'95112',1,1),(3,'KOUSHIK','MODEKURTI','M','koushikmodekurti@gmail.com','4086496548','6696466546',22,'2665646546','165','182 N JAMES ST','DUBLIN',8,'87676',1,3),(4,'SRUJAN','PUTTA','M','srujanputta@gmail.com','6695498894','4086846654',32,'6459659979','135','624 W 6TH ST','FREMONT',26,'92752',1,2),(5,'SONALI','ARCOT','F','sonaliarcot@rediffmail.com','6692664684','4086549656',27,'2689457626','401','866 N VIRGINIA ST','SANTA CLARA',38,'75765',1,3),(6,'UZAIR','PACHAPURE','M','uzairp@rediffmail.com','4089764569','6690863783',26,'7489037345','765','786 W MARTHA ST','RYLAND PARK',12,'56478',1,2),(7,'SUHANI','KHAIRNAR','F','suhanik@rediffmail.com','40867524369','4089767853',35,'7687890333','555','221 N 6 ST','SPARTAN',44,'87342',1,1),(8,'TEJBHUSHAN','GUTTA','M','tejbhushan@rediffmail.com','6698765463','66956478903',46,'9863564890','977','989 S 8 ST','OAKLAND',22,'96543',1,3),(9,'SRUSHTI','PATIL','F','srushtipatil4@rediffmail.com','66980953456','40876534678',18,'3787890634','645','121 W FOUNTAIN ST','SUNNYVALE',43,'12145',1,2),(10,'DAVID','SMITH','M','davidsmith66@rediffmail.com','66987635356','66908675390',29,'3679367489','504','878 N 7 ST','MOUNTAIN VIEW',12,'67543',1,1);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host`
--

DROP TABLE IF EXISTS `host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `host` (
  `Host_ID` int NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Age` int NOT NULL,
  `Gender` char(1) NOT NULL,
  `Unit_no` varchar(10) NOT NULL,
  `Street_Address` varchar(50) NOT NULL,
  `City` varchar(50) NOT NULL,
  `Zip_code` varchar(10) NOT NULL,
  `State_ID` int NOT NULL,
  `Country_ID` int NOT NULL,
  `About` varchar(500) NOT NULL,
  `Host_since` date NOT NULL,
  `Response_Time` varchar(100) NOT NULL,
  `Acceptance_Rate` int DEFAULT NULL,
  `Listings_count` int DEFAULT NULL,
  `License_Number` varchar(15) NOT NULL,
  `Verification_status` int NOT NULL,
  PRIMARY KEY (`Host_ID`),
  UNIQUE KEY `Host_ID` (`Host_ID`),
  UNIQUE KEY `License_Number` (`License_Number`),
  KEY `State_ID` (`State_ID`),
  KEY `Country_ID` (`Country_ID`),
  KEY `Verification_status` (`Verification_status`),
  CONSTRAINT `host_ibfk_1` FOREIGN KEY (`State_ID`) REFERENCES `state` (`State_ID`),
  CONSTRAINT `host_ibfk_2` FOREIGN KEY (`Country_ID`) REFERENCES `country` (`Country_ID`),
  CONSTRAINT `host_ibfk_3` FOREIGN KEY (`Verification_status`) REFERENCES `verification` (`Verification_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host`
--

LOCK TABLES `host` WRITE;
/*!40000 ALTER TABLE `host` DISABLE KEYS */;
INSERT INTO `host` VALUES (1,'Atharva Khadilkar',24,'M','504 D','360 S Market St','San Jose','95113',3,1,'Gym Freak','2008-11-11','Within an Hour',98,2,'MH36H1385',3),(2,'Naga Pavan Kumar',24,'M','1111 A','360 S Market St','Frankfurt','40601',37,1,'Memes Creator','2015-09-27','Within Half an Hour',80,2,'MH36Q8678',2),(3,'ANJANA PRIYATHAM TATAVARTHI',25,'M','107','FOUNDRY COMMONS N 1st St','Las Vegas','88901',7,1,'Coder by Passion','2000-04-15','Two Hours',99,1,'AP31J1990',3),(4,'SAI MOHITH',56,'M','200','THE JULIAN E SAN SALVADOR','FORT COLLINS','80521',8,1,'Illustrator','1995-07-29','Within an Hour',90,1,'AP24B6669',3),(5,'TEJASREE',20,'F','119','CLEVE W 1 St','DUBLIN','94568',3,1,'Astrophile','2006-12-05','Withing Half an Hour',95,2,'AP36H2973',3),(6,'RITHWIK',50,'M','78','ROSS S 5 St','Seattle','98101',18,1,'Teaching and sharing knowledge','1980-12-20','Withing 12 Hours',99,1,'TS06YF9005',2),(7,'SANTOSH BURADA',76,'M','2012','INCHINS W 2 St','Miami','33101',22,1,'Dev at Amazon','1965-06-14','One Day',99,1,'OD34GS1942',3),(8,'MAYANK SHEKHAR MISHRA',31,'M','67','San Cuzi 4 St','New York','10012',27,1,'Penning Thoughts','1993-09-04','Within 12 Hours',71,1,'BR39B1554',1),(9,'ABINEESH MURAGADOSS',42,'M','33','Boring Road 2 St','Chicago','60606',25,1,'Ambivert','1987-10-14','One Day',83,1,'TN51A0427',3),(10,'GAURAV KUMAR DWAYNE',29,'M','81','Narrow Gauge 8 St','Jersey City','07305',47,1,'Sick of loving people','1999-11-13','Within an Hour',50,1,'BR44H1979',3);
/*!40000 ALTER TABLE `host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listings`
--

DROP TABLE IF EXISTS `listings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `listings` (
  `Listings_ID` int NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Host_ID` int NOT NULL,
  `Neighbourhood` varchar(100) NOT NULL,
  `Neighbourhood_Group` varchar(100) NOT NULL,
  `City` varchar(45) NOT NULL,
  `State_ID` int NOT NULL,
  `Country_ID` int NOT NULL,
  `Property_Type` varchar(50) NOT NULL,
  `Allowed_Occupants` int NOT NULL,
  `Min_Booking_Days` int NOT NULL,
  `Max_Booking` int NOT NULL,
  `1B1B_Units` int NOT NULL,
  `1B1B_Price` int NOT NULL,
  `2B1B_Units` int NOT NULL,
  `2B1B_Price` int NOT NULL,
  `2B1.5B_Units` int NOT NULL,
  `2B1.5B_Price` int NOT NULL,
  `2B2B_Units` int NOT NULL,
  `2B2B_Price` int NOT NULL,
  `3B2B_Units` int NOT NULL,
  `3B2B_Price` int NOT NULL,
  `3B2.5B_Units` int NOT NULL,
  `3B2.5B_Price` int NOT NULL,
  `3B3B_Units` int NOT NULL,
  `3B3B_Price` int NOT NULL,
  `4B3B_Units` int NOT NULL,
  `4B3B_Price` int NOT NULL,
  `4B3.5B_Units` int NOT NULL,
  `4B3.5B_Price` int NOT NULL,
  `4B4B_Units` int NOT NULL,
  `4B4B_Price` int NOT NULL,
  `Construction_Year` year NOT NULL,
  `Images_URL` varchar(300) NOT NULL,
  `Custom_Unit_Desc` varchar(200) DEFAULT NULL,
  `Custom_Unit_Available` int DEFAULT NULL,
  `Custom_unit_price` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`Listings_ID`),
  UNIQUE KEY `Listings_ID` (`Listings_ID`),
  KEY `State_ID` (`State_ID`),
  KEY `Country_ID` (`Country_ID`),
  KEY `Host_ID` (`Host_ID`),
  CONSTRAINT `listings_ibfk_1` FOREIGN KEY (`State_ID`) REFERENCES `state` (`State_ID`),
  CONSTRAINT `listings_ibfk_2` FOREIGN KEY (`Country_ID`) REFERENCES `country` (`Country_ID`),
  CONSTRAINT `listings_ibfk_3` FOREIGN KEY (`Host_ID`) REFERENCES `host` (`Host_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listings`
--

LOCK TABLES `listings` WRITE;
/*!40000 ALTER TABLE `listings` DISABLE KEYS */;
INSERT INTO `listings` VALUES (1,'Maribella Lane',1,'Mcquerie Hall','Williamson','San Jose',3,1,'Villas',5,1,4,0,0,0,0,0,0,0,0,0,0,0,0,7,376,3,460,3,481,4,512,2019,'https://a0.muscache.com/im/pictures/miso/Hosting-17109396/original/fae85a2e-e222-4d79-b1c0-569725d90f14.jpeg?im_w=960','NA',0,0.00),(2,'Boccardo Apt',1,'Boccaro Apt','Warner Bros','San Jose',3,1,'Apartment',3,1,2,0,0,0,0,4,231,4,250,6,270,10,310,7,336,5,420,3,471,4,501,2019,'https://a0.muscache.com/im/pictures/miso/Hosting-21605015/original/e914d980-5585-4fbe-a0ef-21b8d0b1cf8c.jpeg?im_w=960','NA',0,0.00),(3,'Don Comfy Pvt Rooms',2,'Mcquerie Hall','Williamson','San Jose',3,1,'Private Rooms',3,1,2,10,149,10,169,5,190,10,220,0,0,0,0,0,0,0,0,0,0,0,0,2015,'https://a0.muscache.com/im/pictures/miso/Hosting-52862569/original/c1570892-993b-4ba8-89cd-147b148f4150.jpeg?im_w=960','NA',0,0.00),(4,'Malibu Bungalow',2,'Boccardo Apt','Warner Bros','San Jose',3,1,'Bungalow',5,1,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1320,2017,'https://a0.muscache.com/im/pictures/966e49c8-1352-47c3-8418-878fc3883321.jpg?im_w=960','NA',0,0.00),(5,'WhyHotel by Placemakr',3,'Claw','Huges','San Jose',3,1,'Apartment',5,1,4,0,0,0,0,0,0,0,0,0,0,0,0,10,520,10,569,5,599,5,629,2008,'https://a0.muscache.com/im/pictures/6c14f5d0-ac07-4cd3-b6ea-3794611d06e8.jpg?im_w=960','NA',0,0.00),(6,'Studios Inn',4,'Claw','Huges','San Jose',3,1,'Group Houses',8,1,3,0,0,0,0,0,0,0,0,0,0,0,0,20,629,10,649,5,699,5,720,2002,'https://a0.muscache.com/im/pictures/3e2d6280-a5f5-4584-8e03-b7043bd75499.jpg?im_w=960','NA',0,0.00),(7,'Left Con',5,'Robert','Downey Jr.','San Jose',3,1,'Apartment',6,1,2,15,150,0,0,4,315,0,0,0,0,0,0,7,436,5,520,3,571,4,601,2002,'https://a0.muscache.com/im/pictures/51d3a03a-50d6-4075-a1a8-b6a2a48de49e.jpg?im_w=960','NA',0,0.00),(8,'Evolve Central San Jose',5,'Tim','Paine','San Jose',3,1,'Group Houses',5,1,3,0,0,10,329,5,349,10,370,0,0,0,0,10,410,0,0,0,0,0,0,2000,'https://a0.muscache.com/im/pictures/b0c977d9-57ba-4f70-bbb4-8b3cd3ae8dc4.jpg?im_w=960','NA',0,0.00),(9,'Victorian History',6,'David','Warner','San Jose',3,1,'Bungalow',5,1,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,980,2003,'https://a0.muscache.com/im/pictures/ef208e64-f3bf-4fd9-aa64-49b781e233b0.jpg?im_w=960','NA',0,0.00),(10,'Landmart',7,'Adam','Gilchrist','San Jose',3,1,'Apartment',5,1,2,10,140,0,0,8,181,14,230,6,250,10,280,4,316,5,400,3,421,6,480,1967,'https://a0.muscache.com/im/pictures/8c0b486c-f2a1-4cf3-b588-1fbd05a52990.jpg?im_w=960','NA',0,0.00),(11,'Van San Jose Green',8,'Rithviz','Rock','San Jose',3,1,'Apartment',3,1,1,0,0,0,0,8,160,10,200,14,230,6,250,9,300,15,330,2,380,10,420,1985,'https://a0.muscache.com/im/pictures/4ff6a74e-4f29-4f3f-9d15-9926e4ff02fe.jpg?im_w=960','NA',0,0.00),(12,'Mariott',9,'Angelina','D Souza','San Jose',3,1,'Apartment',4,1,2,10,140,0,0,8,181,14,230,6,250,10,280,4,316,5,400,3,421,6,480,2007,'https://a0.muscache.com/im/pictures/miso/Hosting-42889961/original/01d6097f-5490-429b-b106-2b816d93385f.jpeg?im_w=960','NA',0,0.00),(13,'Charlett',10,'Adam','Paul','San Jose',3,1,'Apartment',6,1,2,10,140,0,0,8,181,14,230,6,250,10,280,4,316,5,400,3,421,6,480,2002,'https://a0.muscache.com/im/pictures/prohost-api/Hosting-52406636/original/b173af9d-0695-4cbd-80ae-bf75b589ecaa.jpeg?im_w=960','NA',0,0.00);
/*!40000 ALTER TABLE `listings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `Payment_ID` int NOT NULL,
  `Customer_ID` int NOT NULL,
  `Booking_ID` int NOT NULL,
  `Payment_Mode` varchar(20) NOT NULL,
  `Comments` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`Payment_ID`,`Customer_ID`,`Booking_ID`),
  KEY `Customer_ID` (`Customer_ID`),
  KEY `Booking_ID` (`Booking_ID`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`),
  CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`Booking_ID`) REFERENCES `bookings` (`Booking_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,5,4,'Online-Debit','Booking for Boccardo Apt'),(2,4,3,'Online-Debit','WhyHotel by Placemakr Bookings'),(3,2,1,'Online-Credit','Booking for Malibu Bungalow'),(4,1,2,'Online-Debit','Don Comfy Pvt. Room Bookings'),(5,3,5,'Cash','Left Con Bookings'),(6,7,7,'Online-Credit','Maribella Lane Booking'),(7,9,8,'Cash','Left Con Bookings'),(8,6,6,'Online-Debit','Booking for Studios Inn'),(10,10,9,'Online-Credit','Maribella Lane Booking');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `ID` int NOT NULL,
  `Reviewer_ID` int NOT NULL,
  `Reviewer_Name` varchar(50) NOT NULL,
  `Listing_ID` int NOT NULL,
  `Rating` int DEFAULT NULL,
  `Comments` varchar(500) DEFAULT NULL,
  `Review_Date` date NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`),
  KEY `Reviewer_ID` (`Reviewer_ID`),
  KEY `Listing_ID` (`Listing_ID`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`Reviewer_ID`) REFERENCES `customer` (`Customer_ID`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`Listing_ID`) REFERENCES `listings` (`Listings_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,3,'Koushik Modekurti',7,4,'Was a Good Place to live','2022-05-17'),(2,3,'Koushik Modekurti',7,5,'Excellent Hospitality','2022-05-17'),(3,1,'Vrushali Menthe',3,2,'Food was very bad','2022-02-07'),(4,1,'Vrushali Menthe',3,1,'Unhygienic','2022-02-07'),(5,2,'Aboli Wankhede',4,5,'Excellent','2022-01-05');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `state` (
  `State_ID` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  PRIMARY KEY (`State_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (1,'ALASKA'),(2,'TEXAS'),(3,'CALIFORNIA'),(4,'MONTANA'),(5,'NEW MEXICO'),(6,'ARIZONA'),(7,'NEVADA'),(8,'COLORADO'),(9,'OREGON'),(10,'WYOMING'),(11,'MICHIGAN'),(12,'MINNESOTA'),(13,'UTAH'),(14,'IDAHO'),(15,'KANSAS'),(16,'NEBRASKA'),(17,'SOUTH DAKOTA'),(18,'WASHINGTON'),(19,'NORTH DAKOTA'),(20,'OKLAHOMA'),(21,'MISSOURI'),(22,'FLORIDA'),(23,'WISCONSIN'),(24,'GEORGIA'),(25,'ILLINOIS'),(26,'IOWA'),(27,'NEW YORK'),(28,'NORTH CAROLINA'),(29,'ARKANSAS'),(30,'ALABAMA'),(31,'LOUISIANA'),(32,'MISSISSIPPI'),(33,'PENNSYLVANIA'),(34,'OHIO'),(35,'VIRGINIA'),(36,'TENNESSEE'),(37,'KENTUCKY'),(38,'INDIANA'),(39,'MAINE'),(40,'SOUTH CAROLINA'),(41,'WEST VIRGINIA'),(42,'MARYLAND'),(43,'HAWAII'),(44,'MASSACHUSETTS'),(45,'VERMONT'),(46,'NEW HAMPSHIRE'),(47,'NEW JERSEY'),(48,'CONNECTICUT'),(49,'DELAWARE'),(50,'RHODE ISLAND');
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verification`
--

DROP TABLE IF EXISTS `verification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `verification` (
  `Verification_ID` int NOT NULL,
  `Category` varchar(45) NOT NULL,
  PRIMARY KEY (`Verification_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verification`
--

LOCK TABLES `verification` WRITE;
/*!40000 ALTER TABLE `verification` DISABLE KEYS */;
INSERT INTO `verification` VALUES (1,'Phone'),(2,'Email'),(3,'BOTH');
/*!40000 ALTER TABLE `verification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sjsu_rental_database'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `Fixed_Monthly_Bill` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50106 EVENT `Fixed_Monthly_Bill` ON SCHEDULE EVERY 1 MONTH STARTS '2022-10-16 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
SELECT bookings.Customer_Name, (Price_Incurred + 9.95) AS 'Monthly Bill' FROM sjsu_rental_database.bookings JOIN sjsu_rental_database.customer ON bookings.Customer_ID = customer.Customer_ID;
END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'sjsu_rental_database'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-16 10:46:05
