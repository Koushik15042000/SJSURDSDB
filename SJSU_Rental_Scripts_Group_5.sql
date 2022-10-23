-- drop database if exists SJSU_Rental_Database;
-- create database SJSU_Rental_Database;

use sjsu_rental_database;

CREATE TABLE bookings (
    booking_ID INT PRIMARY KEY NOT NULL UNIQUE,
    customer_ID INT NOT NULL,
    customer_Name VARCHAR(50) NOT NULL,
    listing_ID INT NOT NULL,
    Unit_Alloted VARCHAR(50) NOT NULL,
    Price_Incurred DECIMAL(8 , 2 ) NOT NULL,
    Booking_From DATETIME NOT NULL,
    Booking_To DATETIME NOT NULL,
    Booking_Category VARCHAR(50) NOT NULL,
    Payment_ID VARCHAR(30) NOT NULL UNIQUE
);
Create table state (
State_ID int Primary key not null,
Name varchar(45)not null);

Create table Country (
Country_ID int Primary key not null,
Name varchar(45) not null);

Create table verification(
Verification_ID int Primary key not null,
Category varchar(45));
ALTER TABLE verification
modify Category varchar(45) not null;

Create Table customer (
Customer_ID int primary key not null,
First_Name varchar(45) not null,
Last_Name varchar(45) not null,
Gender char(1) not null,
Email_ID varchar(100) not null unique,
Primary_Phone varchar(12) not null unique,
Secondary_Phone varchar(12),
Age int,
Gov_ID varchar(45) not null unique,
Apt_no varchar(10),
Street_Address varchar(50),
City varchar(50),
State_ID int,
Zip_Code varchar(10),
Country_ID int,
Verification_status int not null,
FOREIGN KEY (State_ID) REFERENCES State(State_ID),
FOREIGN KEY (Country_ID) REFERENCES Country(Country_ID),
FOREIGN KEY (Verification_status) REFERENCES Verification(Verification_ID));

Create table `payment`(
`Payment_ID` int,
`Customer_ID` int,
`Booking_ID` int,
`Payment_Mode` varchar(20) not null,
`Comments` varchar(500),
FOREIGN KEY (`Customer_ID`) REFERENCES `Customer`(`Customer_ID`),
FOREIGN KEY (`Booking_ID`) REFERENCES `Bookings`(`Booking_ID`),
constraint `PK_Payment` Primary key (`Payment_ID`,`Customer_ID`,`Booking_ID`)
 );
 
 DROP TABLE Payment;
  
 Create table amenities(
Amenities_ID int Not null primary key unique,
Name varchar(300) Not null);

Create table Host(
Host_ID int Primary key not null unique,
Name varchar(100) not null,
Age int not null,
Gender char(1) not null,
Unit_no varchar(10) not null,
Street_Address varchar(50) not null,
City varchar(50) not null,
Zip_code varchar(10) not null,
State_ID int not null,
Country_ID int not null,
About varchar(500) not null,
Host_since Date not null,
Response_Time varchar(100) not null,
Acceptance_Rate int,
Listings_count int,
License_Number varchar(15) not null unique,
Verification_status int not null,
FOREIGN KEY (State_ID) REFERENCES State(State_ID),
FOREIGN KEY (Country_ID) REFERENCES Country(Country_ID),
FOREIGN KEY (Verification_status) REFERENCES Verification(Verification_ID));


Create table listings(
Listings_ID int Primary key not null unique,
Name varchar(100) not null,
Host_ID int not null,
Neighbourhood varchar(100) not null,
Neighbourhood_Group varchar(100) not null,
City varchar(45) not null,
State_ID int not null,
Country_ID int not null,
Property_Type varchar(50) not null,
Allowed_Occupants int not null,
Min_Booking_Days int not null,
Max_Booking int not null,
1B1B_Units int not null,
1B1B_Price int not null,
2B1B_Units int not null,
2B1B_Price int not null,
`2B1.5B_Units` int not null,
`2B1.5B_Price` int not null,
2B2B_Units int not null,
2B2B_Price int not null,
3B2B_Units int not null,
3B2B_Price int not null,
`3B2.5B_Units` int not null,
`3B2.5B_Price` int not null,
3B3B_Units int not null,
3B3B_Price int not null,
4B3B_Units int not null,
4B3B_Price int not null,
`4B3.5B_Units` int not null,
`4B3.5B_Price` int not null,
4B4B_Units int not null,
4B4B_Price int not null,
Construction_Year Year not null,
Images_URL varchar(300) not null,
Custom_Unit_Desc varchar(200),
Custom_Unit_Available int,
Custom_unit_price decimal(9,2),
FOREIGN KEY (State_ID) REFERENCES State(State_ID),
FOREIGN KEY (Country_ID) REFERENCES Country(Country_ID),
FOREIGN KEY (Host_ID) REFERENCES Host(Host_ID));

Create table amenities_provided(
Listing_ID int not null,
Amenities_ID int not null,
FOREIGN KEY (Amenities_ID) REFERENCES Amenities(Amenities_ID),
FOREIGN KEY (Listing_ID) REFERENCES Listings(Listings_ID),
constraint PK_Amenities_Prov PRIMARY KEY (Listing_ID,Amenities_ID));

Create table reviews(
ID int Primary key not null unique,
Reviewer_ID int not null,
Reviewer_Name varchar(50) not null,
Listing_ID int not null,
Rating INT,
Comments varchar(500),
Review_Date Date not null,
FOREIGN KEY (Reviewer_ID) REFERENCES Customer(Customer_ID),
FOREIGN KEY (Listing_ID) REFERENCES Listings(Listings_ID));

CREATE TABLE Trigger_Phone_Update(
old_phone VARCHAR(10), 
new_phone VARCHAR(10),
CONSTRAINT PK_Trigger PRIMARY KEY (old_phone, new_phone));

ALTER TABLE bookings
ADD CONSTRAINT FK_CustomerID
FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID);

ALTER TABLE bookings
ADD CONSTRAINT FK_ListingID
FOREIGN KEY (Listing_ID) REFERENCES Listings(Listings_ID);

-- VERIFICATIONS RELATION DATA SCRIPT
INSERT INTO sjsu_rental_database.verification VALUES (1, 'Phone'),(2,'Email');
INSERT INTO sjsu_rental_database.verification values (3,'BOTH');

-- COUNTRY RELATION DATA SCRIPT
insert into sjsu_rental_database.country values (1,'USA');

-- STATES RELATION DATA SCRIPT
INSERT INTO sjsu_rental_database.state VALUES(1,'ALASKA'),(2,'TEXAS'),(3,'CALIFORNIA'),(4,'MONTANA'),(5,'NEW MEXICO'),(6,'ARIZONA'),(7,'NEVADA'),(8,'COLORADO'),(9,'OREGON'),(10,'WYOMING'),(11,'MICHIGAN'),(12,'MINNESOTA'),(13,'UTAH'),(14,'IDAHO'),(15,'KANSAS'),(16,'NEBRASKA'),(17,'SOUTH DAKOTA'),(18,'WASHINGTON'),(19,'NORTH DAKOTA'),(20,'OKLAHOMA'),(21,'MISSOURI'),(22,'FLORIDA'),(23,'WISCONSIN'),(24,'GEORGIA'),(25,'ILLINOIS'),(26,'IOWA'),(27,'NEW YORK'),(28,'NORTH CAROLINA'),(29,'ARKANSAS'),(30,'ALABAMA'),(31,'LOUISIANA'),(32,'MISSISSIPPI'),(33,'PENNSYLVANIA'),(34,'OHIO'),(35,'VIRGINIA'),(36,'TENNESSEE'),(37,'KENTUCKY'),(38,'INDIANA'),(39,'MAINE'),(40,'SOUTH CAROLINA'),(41,'WEST VIRGINIA'),(42,'MARYLAND'),(43,'HAWAII'),(44,'MASSACHUSETTS'),(45,'VERMONT'),(46,'NEW HAMPSHIRE'),(47,'NEW JERSEY'),(48,'CONNECTICUT'),(49,'DELAWARE'),(50,'RHODE ISLAND');

-- AMENITIES RELATION DATA SCRIPT
INSERT INTO sjsu_rental_database.amenities VALUES (1,'WIFI'),
(2,'MINI FRIDGE'),
(3,'JACUZZI'),
(4,'SWIMMING POOL'),
(5,'GYM'),
(6,'BARBEQUE'),
(7,'BANQUET'),
(8,'BUFFET'),
(9,'PARKING'),
(10,'SPA');

-- CUSTOMERS RELATION DATA SCRIPT
INSERT INTO sjsu_rental_database.customer VALUES (1,'VRUSHALI','MENTHE','F','vrushalimenthe29@gmail.com','4086909378','6902339845',23,'6549835496','204','171 W JULIAN ST','SAN JOSE',3,'95110',1,2);
INSERT INTO sjsu_rental_database.customer VALUES (2,'ABOLI','WANKHANDE','F','aboli04@gmail.com','9096496849','6696546354',26,'3818987554','315','868 S 5TH ST','SAN JOSE',3,'95112',1,1),
(3,'KOUSHIK','MODEKURTI','M','koushikmodekurti@gmail.com','4086496548','6696466546',22,'2665646546','165','182 N JAMES ST','DUBLIN',8,'87676',1,3 ),
(4, 'SRUJAN','PUTTA', 'M','srujanputta@gmail.com','6695498894','4086846654',32,'6459659979','135','624 W 6TH ST', 'FREMONT',26,'92752',1,2),
(5, 'SONALI','ARCOT','F','sonaliarcot@rediffmail.com','6692664684','4086549656',27,'2689457626','401','866 N VIRGINIA ST','SANTA CLARA',38,'75765',1,3),
(6,'UZAIR','PACHAPURE','M','uzairp@rediffmail.com','4089764569','6690863783',26,'7489037345','765','786 W MARTHA ST','RYLAND PARK',12,'56478',1,2 ),
(7, 'SUHANI','KHAIRNAR','F','suhanik@rediffmail.com','40867524369','4089767853',35,'7687890333','555','221 N 6 ST','SPARTAN',44,'87342',1,1),
(8, 'TEJBHUSHAN','GUTTA','M','tejbhushan@rediffmail.com','6698765463','66956478903',46,'9863564890','977','989 S 8 ST','OAKLAND',22,'96543',1,3),
(9, 'SRUSHTI','PATIL','F','srushtipatil4@rediffmail.com','66980953456','40876534678',18,'3787890634','645','121 W FOUNTAIN ST','SUNNYVALE',43,'12145',1,2),
(10,'DAVID','SMITH','M','davidsmith66@rediffmail.com','66987635356','66908675390',29,'3679367489','504','878 N 7 ST','MOUNTAIN VIEW',12,'67543',1,1 );

-- HOSTS RELATION DATA SCRIPT
INSERT INTO sjsu_rental_database.host VALUES (1,'Atharva Khadilkar',24,'M','504 D','360 S Market St','San Jose', '95113',3,1,'Gym Freak','2008-11-11', 'Within an Hour', 98, 2, 'MH36H1385', 3); 
INSERT INTO sjsu_rental_database.host VALUES (2,'Naga Pavan Kumar',24,'M','1111 A','360 S Market St','Frankfurt', '40601',37,1,'Memes Creator','2015-09-27', 'Within Half an Hour', 80, 3, 'MH36Q8678', 2),
(3, 'ANJANA PRIYATHAM TATAVARTHI',25,'M','107','FOUNDRY COMMONS N 1st St','Las Vegas', '88901',7,1,'Coder by Passion','2000-04-15','Two Hours',99,1,'AP31J1990',3),
(4,'SAI MOHITH',56,'M','200','THE JULIAN E SAN SALVADOR','FORT COLLINS','80521',8,1,'Illustrator','1995-07-29','Within an Hour',90,3,'AP24B6669',3),
(5,'TEJASREE',20,'F','119','CLEVE W 1 St','DUBLIN','94568',3,1,'Astrophile','2006-12-05', 'Withing Half an Hour', 95, 4, 'AP36H2973',3),
(6,'RITHWIK',50,'M','78','ROSS S 5 St','Seattle','98101',18,1,'Teaching and sharing knowledge','1980-12-20','Withing 12 Hours',99,1,'TS06YF9005',2),
(7,'SANTOSH BURADA',76,'M','2012','INCHINS W 2 St', 'Miami','33101',22,1,'Dev at Amazon','1965-06-14','One Day',99,1,'OD34GS1942',3),
(8,'MAYANK SHEKHAR MISHRA',31,'M','67','San Cuzi 4 St','New York','10012',27,1, 'Penning Thoughts','1993-09-04','Within 12 Hours', 71,1,'BR39B1554',1),
(9,'ABINEESH MURAGADOSS',42,'M','33','Boring Road 2 St','Chicago','60606',25,1, 'Ambivert','1987-10-14','One Day',83,1,'TN51A0427',3),
(10,'GAURAV KUMAR DWAYNE',29,'M','81','Narrow Gauge 8 St','Jersey City', '07305',47,1,'Sick of loving people','1999-11-13','Within an Hour',50,1,'BR44H1979',3); 

-- LISTINGS RELATION DATA SCRIPT
INSERT INTO sjsu_rental_database.listings VALUES (1,'Maribella Lane',1,'Mcquerie Hall','Williamson','San Jose',3,1,'Villas',5,1,4,0,0,0,0,0,0,0,0,0,0,0,0,7,376,3,460,3,481,4,512,2019,'https://a0.muscache.com/im/pictures/miso/Hosting-17109396/original/fae85a2e-e222-4d79-b1c0-569725d90f14.jpeg?im_w=960','NA',0,0);
INSERT INTO sjsu_rental_database.listings VALUES (2,'Willow Glen',1,'Boccardo Apt','Warner Bros','San Jose',3,1,'Apartment',3,1,2,0,0,0,0,4,231,4,250,6,270,10,310,7,336,5,420,3,471,4,501,2019,'https://a0.muscache.com/im/pictures/miso/Hosting-21605015/original/e914d980-5585-4fbe-a0ef-21b8d0b1cf8c.jpeg?im_w=960','NA',0,0);
INSERT INTO sjsu_rental_database.listings VALUES (3,'Don Comfy Pvt Rooms',2,'Mcquerie Hall','Warner Bros','San Jose',3,1,'Private Rooms',3,1,2,10,149,10,169,5,190,10,220,0,0,0,0,0,0,0,0,0,0,0,0,2015,'https://a0.muscache.com/im/pictures/miso/Hosting-52862569/original/c1570892-993b-4ba8-89cd-147b148f4150.jpeg?im_w=960','NA',0,0);
INSERT INTO sjsu_rental_database.listings VALUES (4,'Malibu Bungalow',2,'Boccardo Apt','Warner Bros','San Jose',3,1,'Bungalow',5,1,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1320,2017,'https://a0.muscache.com/im/pictures/966e49c8-1352-47c3-8418-878fc3883321.jpg?im_w=960','NA',0,0);
INSERT INTO sjsu_rental_database.listings VALUES (5,'WhyHotel by Placemakr',3,'Claw','Huges','San Jose',3,1,'Apartment',5,1,4,0,0,0,0,0,0,0,0,0,0,0,0,10,520,10,569,5,599,5,629,2008,'https://a0.muscache.com/im/pictures/6c14f5d0-ac07-4cd3-b6ea-3794611d06e8.jpg?im_w=960','NA',0,0);
INSERT INTO sjsu_rental_database.listings VALUES (6,'Studios Inn',4,'Claw','Huges','San Jose',3,1,'Group Houses',8,1,3,0,0,0,0,0,0,0,0,0,0,0,0,20,629,10,649,5,699,5,720,2002,'https://a0.muscache.com/im/pictures/3e2d6280-a5f5-4584-8e03-b7043bd75499.jpg?im_w=960','NA',0,0);
INSERT INTO sjsu_rental_database.listings VALUES (7,'Left Con',5,'Robert','Downey Jr.','San Jose',3,1,'Apartment',6,1,2,15,150,0,0,4,315,0,0,0,0,0,0,7,436,5,520,3,571,4,601,2002,'https://a0.muscache.com/im/pictures/51d3a03a-50d6-4075-a1a8-b6a2a48de49e.jpg?im_w=960','NA',0,0);
INSERT INTO sjsu_rental_database.listings VALUES (8,'Evolve Central San Jose',5,'Tim','Paine','San Jose',3,1,'Group Houses',5,1,3,0,0,10,329,5,349,10,370,0,0,0,0,10,410,0,0,0,0,0,0,2000,'https://a0.muscache.com/im/pictures/b0c977d9-57ba-4f70-bbb4-8b3cd3ae8dc4.jpg?im_w=960','NA',0,0);
INSERT INTO sjsu_rental_database.listings VALUES (9,'Victorian History',6,'David','Warner','San Jose',3,1,'Bungalow',5,1,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,980,2003,'https://a0.muscache.com/im/pictures/ef208e64-f3bf-4fd9-aa64-49b781e233b0.jpg?im_w=960','NA',0,0);
INSERT INTO sjsu_rental_database.listings VALUES (10,'Landmart',7,'Adam','Gilchrist','San Jose',3,1,'Apartment',5,1,2,10,140,0,0,8,181,14,230,6,250,10,280,4,316,5,400,3,421,6,480,1967,'https://a0.muscache.com/im/pictures/8c0b486c-f2a1-4cf3-b588-1fbd05a52990.jpg?im_w=960','NA',0,0);
INSERT INTO sjsu_rental_database.listings VALUES (11,'Van San Jose Green',8,'Rithviz','Rock','San Jose',3,1,'Apartment',3,1,1,0,0,0,0,8,160,10,200,14,230,6,250,9,300,15,330,2,380,10,420,1985,'https://a0.muscache.com/im/pictures/4ff6a74e-4f29-4f3f-9d15-9926e4ff02fe.jpg?im_w=960','NA',0,0);
INSERT INTO sjsu_rental_database.listings VALUES (12,'Mariott',9,'Angelina','D Souza','San Jose',3,1,'Apartment',4,1,2,10,140,0,0,8,181,14,230,6,250,10,280,4,316,5,400,3,421,6,480,2007,'https://a0.muscache.com/im/pictures/miso/Hosting-42889961/original/01d6097f-5490-429b-b106-2b816d93385f.jpeg?im_w=960','NA',0,0);
INSERT INTO sjsu_rental_database.listings VALUES (13,'Charlett',10,'Adam','Paul','San Jose',3,1,'Apartment',6,1,2,10,140,0,0,8,181,14,230,6,250,10,280,4,316,5,400,3,421,6,480,2002,'https://a0.muscache.com/im/pictures/prohost-api/Hosting-52406636/original/b173af9d-0695-4cbd-80ae-bf75b589ecaa.jpeg?im_w=960','NA',0,0);

-- Bookings Relation Data Script
INSERT INTO sjsu_rental_database.bookings VALUES(1,2,'ABOLI WANKHANDE',4,'Bungalow 504',2640,'2022-01-02','2022-01-04','Completed',3);
INSERT INTO sjsu_rental_database.bookings VALUES(2,1,'VRUSHALI MENTHE',3,'Group House 2',440,'2022-02-03','2022-02-05','Cancelled',4);
INSERT INTO sjsu_rental_database.bookings VALUES(3,4,'SRUJAN PUTTA',5,'702',2080,'2022-03-03','2022-03-07','Completed',2);
INSERT INTO sjsu_rental_database.bookings VALUES(4,5,'SONALI ARCOT',2,'535',500,'2022-04-23','2022-04-25','Completed',1);
INSERT INTO sjsu_rental_database.bookings VALUES(5,3,'KOUSHIK MODEKURTI',7,'450',630,'2022-05-14','2022-05-16','Completed',5);
INSERT INTO sjsu_rental_database.bookings VALUES(6,6,'UZAIR PACHAPURE',6,'Group House 4',1258,'2022-06-18','2022-06-20','Completed',8);
INSERT INTO sjsu_rental_database.bookings VALUES(7,7,'SUHANI KHAIRNAR',1,'Villa 7',1840,'2022-03-13','2022-03-17','Completed',6);
INSERT INTO sjsu_rental_database.bookings VALUES(8,9,'SRUSHTI PATIL',7,'677',500,'2022-07-13','2022-07-15','Completed',7);
INSERT INTO sjsu_rental_database.bookings VALUES(9,10,'DAVID SMITH',6,'Group House 1',3920,'2022-01-23','2022-01-27','Cancelled',10);
INSERT INTO sjsu_rental_database.bookings VALUES(10,8,'TEJBHUSHAN GUTTA',3,'Group House 8',1040,'2022-02-13','2022-02-15','Completed',9);

alter TABLE bookings DROP COLUMN Customer_Name;

-- Payments Relation Data Script
insert into payment values(1,5,4,'Online-Debit','Booking for Boccardo Apt');
insert into payment values(2,4,3,'Online-Debit','WhyHotel by Placemakr Bookings');
insert into payment values(3,2,1,'Online-Credit','Booking for Malibu Bungalow');
insert into payment values(4,1,2,'Online-Debit','Don Comfy Pvt. Room Bookings');
insert into payment values(5,3,5,'Cash','Left Con Bookings');
insert into payment values(6,7,7,'Online-Credit','Maribella Lane Booking');
insert into payment values(7,9,8,'Cash','Left Con Bookings');
insert into payment values(8,6,6,'Online-Debit','Booking for Studios Inn');
insert into payment values(9,8,10,'Cash','Don Comfy Pvt. Room Bookings');
insert into payment values(10,10,9,'Online-Credit','Maribella Lane Booking');

-- Amenities Provided Relation Data Script
INSERT INTO sjsu_rental_database.amenities_provided VALUES (1,1),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10); 
INSERT INTO sjsu_rental_database.amenities_provided VALUES (2,1),(2,3),(2,5),(2,9); 
INSERT INTO sjsu_rental_database.amenities_provided VALUES (3,1),(3,4),(3,5),(3,9); 
INSERT INTO sjsu_rental_database.amenities_provided VALUES (4,1),(4,6),(4,10); 
INSERT INTO sjsu_rental_database.amenities_provided VALUES (5,1),(5,9),(5,10);
INSERT INTO sjsu_rental_database.amenities_provided VALUES (6,1),(6,7),(6,9);
INSERT INTO sjsu_rental_database.amenities_provided VALUES (7,1),(7,2),(7,4),(7,9);
INSERT INTO sjsu_rental_database.amenities_provided VALUES (8,1),(8,4),(8,5),(8,9);
INSERT INTO sjsu_rental_database.amenities_provided VALUES (9,1),(9,6),(9,10);
INSERT INTO sjsu_rental_database.amenities_provided VALUES (10,1),(10,4),(10,5),(10,9);

-- Reviews Relation Data Script
INSERT INTO sjsu_rental_database.reviews VALUES (1,3,'Koushik Modekurti',7,4,'Was a Good Place to live','2022-05-17');
INSERT INTO sjsu_rental_database.reviews VALUES (2,3,'Koushik Modekurti',7,5,'Excellent Hospitality','2022-05-17');
INSERT INTO sjsu_rental_database.reviews VALUES (3,1,'Vrushali Menthe',3,2,'Food was very bad','2022-02-07');
INSERT INTO sjsu_rental_database.reviews VALUES (4,1,'Vrushali Menthe',3,1,'Unhygienic','2022-02-07');
INSERT INTO sjsu_rental_database.reviews VALUES (5,2,'Aboli Wankhede',4,5,'Excellent','2022-01-05');

-- CHECKING THE PROCESS LIST
SHOW processlist;
-- SET GLOBAL event_scheduler = ON, use this if you can't see more than 2 rows returned when you
-- execute the above command

-- CREATING A SCHEDULED EVENT
DELIMITER $$
CREATE EVENT Fixed_Monthly_Bill
ON SCHEDULE EVERY 1 MONTH STARTS '2022-10-16 00:00:00'
DO BEGIN
SELECT b.Customer_Name, 
(b.Price_Incurred + 9.95) AS 'Monthly Bill' 
FROM 
sjsu_rental_database.bookings b JOIN sjsu_rental_database.customer c 
ON b.Customer_ID = c.Customer_ID;
END $$
DELIMITER //
 
-- PRIMARY PHONE UPDATION TRIGGER FOR CUSTOMERS
DELIMITER $$
CREATE TRIGGER CUSTOMER_PRIMARY_PHONE_UPDATE
AFTER UPDATE ON  sjsu_rental_database.customer
FOR EACH ROW
BEGIN
INSERT INTO Trigger_Phone_Update VALUES(
OLD.Primary_Phone,
NEW.Primary_Phone);
END$$

DROP TRIGGER CUSTOMER_PRIMARY_PHONE_UPDATE;

use sjsu_rental_database;
drop trigger if exists after_insert_payment;
delimiter //
create trigger after_insert_payment
after insert on payment for each row
begin
	declare message varchar(100);
    set message = 'The customer'+new.customer_id+'did the payment via'+new.Payment_Mode;
end //
delimiter ;

-- Average Rating of Listing based on Reviews
DELIMITER $$
CREATE PROCEDURE average_of_reviews()
BEGIN
SELECT Listing_ID, ROUND(AVG(Rating),1) 
FROM reviews GROUP BY Listing_ID;
END $$

CALL average_of_reviews();

-- Extract Customer Details and their given Rating
DELIMITER //
CREATE PROCEDURE Customer_Rating(IN Customer_ID INT)
BEGIN
SELECT C.Customer_ID, C.First_Name, C.Last_Name, C.Gender, C.Email_ID, C.Age, C.City, R.Rating FROM 
customer C 
JOIN
reviews R ON C.Customer_ID = R.Reviewer_ID
WHERE C.Customer_ID = Customer_ID;
END //
DELIMITER 

CALL Customer_Rating(3);

-- Get relation between Amenities_Provided and Listings
SELECT 
    L.Listings_ID,
    L.Name,
    L.Neighbourhood,
    L.Neighbourhood_Group,
    L.City,
    L.Property_Type,
    L.Allowed_Occupants
FROM
    amenities_provided AP
        INNER JOIN
    listings L ON AP.Listing_ID = L.Listings_ID
GROUP BY L.Listings_ID , L.Name , L.Neighbourhood , L.Neighbourhood_Group , L.City , L.Property_Type , L.Allowed_Occupants;

-- Get Relation between Host and Listings
SELECT 
    H.Host_ID,
    H.Age,
    H.Gender,
    H.Unit_no,
    H.Street_Address,
    H.City,
    H.Zip_code,
    H.About,
    H.Host_Since
FROM
    host H
        INNER JOIN
    listings L ON L.Host_ID = H.Host_ID
GROUP BY H.Host_Id , H.Age , H.Gender , H.Unit_no , H.Street_Address , H.City , H.Zip_code , H.About , H.Host_Since , H.Response_Time;

-- Get relation between Payment and Bookings
SELECT 
    B.Booking_ID,
    B.Customer_Id,
    B.Listing_Id,
    B.Payment_Id,
    B.Unit_Alloted,
    B.Price_Incurred,
    B.Booking_From,
    B.Booking_To,
    P.Payment_mode
FROM
    bookings B
        INNER JOIN
    payment P ON B.Booking_ID = P.Booking_ID
GROUP BY B.Booking_ID , B.Customer_Id , B.Listing_Id , B.Payment_Id , B.Unit_Alloted , B.Price_Incurred , B.Booking_From , B.Booking_To , P.Payment_mode;

-- Get the relation between the host(Describes the hosts 
-- intital responses and the frequency that the host responds after recieving a 
-- booking request)and verification.
SELECT 
    Host_ID,
    Response_Time,
    Acceptance_Rate,
    License_Number,
    Verification_Status,
    Category
FROM
    host
        INNER JOIN
    verification ON Verification_Status = Verification_Id
ORDER BY Host_Id;

-- Gets the relation between Customer and the verification process.
SELECT 
    C.Customer_ID,
    C.First_Name,
    C.Last_Name,
    C.Gender,
    C.Email_ID,
    V.Category
FROM
    customer C
        INNER JOIN
    verification V ON C.Verification_status = V.Verification_ID
ORDER BY Customer_Id

-- List out grouped listings and amenities for property type apartments.
SELECT 
    AP.Amenities_ID,
    AP.Listing_ID,
    A.Name,
    L.Name,
    L.City,
    L.Allowed_Occupants,
    L.Property_Type
FROM
    listings L
        INNER JOIN
    amenities_provided AP ON AP.Listing_ID = L.Listings_ID
        INNER JOIN
    amenities A ON A.Amenities_ID = AP.Amenities_ID
        INNER JOIN
    host H ON L.Host_ID = H.Host_ID
WHERE
    L.Property_Type = 'Apartment'
GROUP BY AP.Amenities_ID , AP.Listing_ID , A.Name , L.City , L.Allowed_Occupants , L.Property_Type;

-- Returns host with the biggest number of listings.
SELECT 
    H.Host_ID,
    H.Name,
    L.Neighbourhood,
    L.Neighbourhood_Group,
    H.City,
    L.Property_Type
FROM
    listings L
        INNER JOIN
    host H ON H.Host_ID = L.Host_ID
GROUP BY H.Host_ID , H.Name , L.Neighbourhood , L.Neighbourhood_Group , H.City , L.Property_Type
HAVING MAX(H.Listings_Count);

-- Get the average of prices per neighbourhood_group and room types.
SELECT 
    L.Neighbourhood_Group,
    L.Property_Type,
    ROUND(AVG(1B1B_Price), 1) 1Bed,
    ROUND(AVG(2B1B_Price), 1) 2and1Bed,
    ROUND(AVG(2B2B_Price), 1) 2and2Bed,
    ROUND(AVG(3B2B_Price), 1) 3and2Bed,
    ROUND(AVG(3B3B_Price), 1) 3and3Bed,
    ROUND(AVG(4B3B_Price), 1) 4and3Bed,
    ROUND(AVG(4B4B_Price), 1) 4and4Bed
FROM
    listings L
GROUP BY L.Neighbourhood_Group , L.Property_Type , 1B1B_Price , 2B1B_Price , 2B2B_Price , 3B2B_Price , 3B3B_Price , 4B3B_Price , 4B4B_Price
ORDER BY L.Neighbourhood_Group;

-- Get the relationships between prices and minimum_nights
SELECT 
    L.Min_Booking_Days,
    L.Property_Type,
    ROUND(AVG(L.1B1B_Price), 1) 1Bed,
    ROUND(AVG(L.2B1B_Price), 1) 2and1Bed,
    ROUND(AVG(L.2B2B_Price), 1) 2and2Bed,
    ROUND(AVG(L.3B2B_Price), 1) 3and2Bed,
    ROUND(AVG(L.3B3B_Price), 1) 3and3Bed,
    ROUND(AVG(L.4B3B_Price), 1) 4and3Bed,
    ROUND(AVG(L.4B4B_Price), 1) 4and4Bed
FROM
    listings L
        INNER JOIN
    reviews R ON L.Listings_ID = R.Listing_ID
GROUP BY L.Min_Booking_Days , L.Property_Type , L.1B1B_Price , L.2B1B_Price , L.2B2B_Price , L.3B2B_Price , L.3B3B_Price , L.4B3B_Price , L.4B4B_Price;

-- Get the relationships between prices and number_of_reviews
SELECT 
    L.Name,
    R.Reviewer_Name,
    R.Rating,
    R.Review_Date,
    ROUND(AVG(L. 1B1B_Price), 1) 1Bed,
    ROUND(AVG(L. 2B1B_Price), 1) 2and1Bed,
    ROUND(AVG(L. 2B2B_Price), 1) 2and2Bed,
    ROUND(AVG(L. 3B2B_Price), 1) 3and2Bed,
    ROUND(AVG(L. 3B3B_Price), 1) 3and3Bed,
    ROUND(AVG(L. 4B3B_Price), 1) 4and3Bed,
    ROUND(AVG(L. 4B4B_Price), 1) 4and4Bed,
    L.Images_Url
FROM
    listings L
        INNER JOIN
    reviews R ON L.Listings_ID = R.Listing_ID
GROUP BY L.Name , L. 1B1B_Price , L. 2B1B_Price , L. 2B2B_Price , L. 3B2B_Price , L. 3B3B_Price , L. 4B3B_Price , L. 4B4B_Price , L.Images_Url , R.Reviewer_Name , R.Rating , R.Review_Date;

-- USER CREATIONS FOR ACCESS PRIVILEGES
SELECT Host,User FROM mysql.user;

CREATE USER 'kruthi@DBADMIN' IDENTIFIED BY 'kruthi123';
CREATE USER 'latha@DBADMIN' IDENTIFIED BY 'latha123';

GRANT ALL PRIVILEGES ON sjsu_rental_database.* TO 'kruthi@DBADMIN'@'localhost' WITH GRANT OPTION;