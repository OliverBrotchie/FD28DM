#
# TABLE STRUCTURE FOR: Advert
#

DROP TABLE IF EXISTS `Advert`;

CREATE TABLE `Advert` (
  `advertID` int(6) NOT NULL AUTO_INCREMENT,
  `campaignID` int(6) NOT NULL,
  `type` varchar(8) NOT NULL,
  PRIMARY KEY (`advertID`),
  UNIQUE KEY `campaignID` (`campaignID`),
  CONSTRAINT `Advert_ibfk_1` FOREIGN KEY (`campaignID`) REFERENCES `Campaign` (`campaignID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# TABLE STRUCTURE FOR: Campaign
#

DROP TABLE IF EXISTS `Campaign`;

CREATE TABLE `Campaign` (
  `campaignID` int(6) NOT NULL AUTO_INCREMENT,
  `clientID` int(6) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  PRIMARY KEY (`campaignID`),
  UNIQUE KEY `clientID` (`clientID`),
  CONSTRAINT `Campaign_ibfk_1` FOREIGN KEY (`clientID`) REFERENCES `Client` (`clientID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# TABLE STRUCTURE FOR: Client
#

DROP TABLE IF EXISTS `Client`;

CREATE TABLE `Client` (
  `clientID` int(6) NOT NULL AUTO_INCREMENT,
  `personID` int(6) NOT NULL,
  `companyName` varchar(20) NOT NULL,
  PRIMARY KEY (`clientID`),
  UNIQUE KEY `personID` (`personID`),
  CONSTRAINT `Client_ibfk_1` FOREIGN KEY (`personID`) REFERENCES `PersonalInfo` (`personID`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=latin1;

#
# TABLE STRUCTURE FOR: Employee
#

DROP TABLE IF EXISTS `Employee`;

CREATE TABLE `Employee` (
  `employeeID` int(6) NOT NULL AUTO_INCREMENT,
  `personID` int(6) NOT NULL,
  `workEmail` varchar(30) NOT NULL,
  PRIMARY KEY (`employeeID`),
  KEY `personID` (`personID`),
  CONSTRAINT `Employee_ibfk_1` FOREIGN KEY (`personID`) REFERENCES `PersonalInfo` (`personID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# TABLE STRUCTURE FOR: Invoice
#

DROP TABLE IF EXISTS `Invoice`;

CREATE TABLE `Invoice` (
  `invoiceID` int(6) NOT NULL AUTO_INCREMENT,
  `campaignID` int(6) NOT NULL,
  `clientID` int(6) NOT NULL,
  `cost` int(16) NOT NULL,
  PRIMARY KEY (`invoiceID`),
  UNIQUE KEY `campaignID` (`campaignID`),
  UNIQUE KEY `clientID` (`clientID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# TABLE STRUCTURE FOR: Magazine
#

DROP TABLE IF EXISTS `Magazine`;

CREATE TABLE `Magazine` (
  `advertID` int(6) NOT NULL AUTO_INCREMENT,
  `magazine` varchar(32) NOT NULL,
  `size` varchar(16) NOT NULL,
  `position` varchar(16) NOT NULL,
  `frequency` int(4) NOT NULL,
  PRIMARY KEY (`advertID`),
  CONSTRAINT `Magazine_ibfk_1` FOREIGN KEY (`advertID`) REFERENCES `Advert` (`advertID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# TABLE STRUCTURE FOR: PersonalInfo
#

DROP TABLE IF EXISTS `PersonalInfo`;

CREATE TABLE `PersonalInfo` (
  `personID` int(6) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(15) NOT NULL,
  `secondName` varchar(20) NOT NULL,
  `emailAddress` varchar(30) NOT NULL,
  `phoneNumber` int(15) NOT NULL,
  PRIMARY KEY (`personID`),
  UNIQUE KEY `personID` (`personID`),
  UNIQUE KEY `emailAddress` (`emailAddress`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (1, 'Jarrett', 'occaecati', 'ebahringer@example.org', 29);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (2, 'Sterling', 'nisi', 'ffritsch@example.org', 2147483647);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (3, 'Zack', 'dolorum', 'isadore.ruecker@example.org', 1);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (4, 'Mossie', 'aut', 'treutel.celestino@example.org', 927785);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (5, 'Nico', 'veritatis', 'mwunsch@example.net', 0);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (6, 'Micah', 'saepe', 'mohammed.welch@example.com', 1);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (7, 'Keeley', 'ut', 'wboyer@example.com', 86);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (8, 'Rebecca', 'quibusdam', 'jaqueline.quigley@example.com', 1);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (9, 'Jay', 'debitis', 'cquigley@example.org', 157);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (10, 'Jaquelin', 'et', 'keaton.mcclure@example.com', 1);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (11, 'Brittany', 'consequatur', 'austyn17@example.com', 1);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (12, 'Mariela', 'dolor', 'juvenal.wintheiser@example.org', 0);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (13, 'Rosalia', 'voluptatem', 'noah.turner@example.com', 117);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (14, 'Hazle', 'praesentium', 'schneider.berneice@example.org', 1);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (15, 'Edwardo', 'praesentium', 'quentin64@example.org', 1);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (16, 'Heather', 'sequi', 'okunde@example.net', 8);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (17, 'Eleanore', 'error', 'vmitchell@example.org', 605552);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (18, 'Dena', 'omnis', 'price12@example.net', 212334);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (19, 'Emmalee', 'odit', 'santiago.bogisich@example.com', 1074852915);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (20, 'June', 'qui', 'qwilkinson@example.net', 963596);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (21, 'Okey', 'sint', 'fermin75@example.org', 51);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (22, 'Jarret', 'eum', 'yherzog@example.net', 0);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (23, 'Josiane', 'sit', 'melyna.schuster@example.org', 92);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (24, 'Mathew', 'dolor', 'novella76@example.org', 453998);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (25, 'Arnulfo', 'molestiae', 'mavis.paucek@example.net', 542);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (26, 'Samantha', 'minus', 'reilly.jamaal@example.net', 0);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (27, 'Bruce', 'dolores', 'carolanne53@example.org', 527744);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (28, 'Torrance', 'ut', 'stiedemann.dayton@example.com', 52);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (29, 'Earl', 'iusto', 'walsh.brody@example.net', 0);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (30, 'Bryce', 'ut', 'torp.sheldon@example.com', 711204);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (31, 'Cecilia', 'unde', 'effertz.sharon@example.com', 1);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (32, 'Loyal', 'eum', 'alexandro.koepp@example.com', 1);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (33, 'Margaretta', 'soluta', 'canderson@example.net', 0);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (34, 'Enrique', 'distinctio', 'lydia.mante@example.net', 728338);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (35, 'Olaf', 'minima', 'ramona80@example.org', 0);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (36, 'Susana', 'aut', 'klein.deangelo@example.net', 858);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (37, 'Gloria', 'ea', 'elna95@example.org', 1);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (38, 'Kiera', 'blanditiis', 'tgleason@example.net', 1039204410);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (39, 'Coralie', 'impedit', 'reinger.bennie@example.net', 1);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (40, 'Elouise', 'fugit', 'hilario98@example.org', 0);


#
# TABLE STRUCTURE FOR: TV&Radio
#

DROP TABLE IF EXISTS `TV&Radio`;

CREATE TABLE `TV&Radio` (
  `advertID` int(6) NOT NULL AUTO_INCREMENT,
  `slot` varchar(32) NOT NULL,
  `length` int(5) NOT NULL,
  `station` varchar(32) NOT NULL,
  `broadcastingNo` int(3) NOT NULL,
  PRIMARY KEY (`advertID`),
  CONSTRAINT `TV&Radio_ibfk_1` FOREIGN KEY (`advertID`) REFERENCES `Advert` (`advertID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# TABLE STRUCTURE FOR: Web
#

DROP TABLE IF EXISTS `Web`;

CREATE TABLE `Web` (
  `advertID` int(6) NOT NULL AUTO_INCREMENT,
  `company` varchar(64) NOT NULL,
  `demographic` varchar(32) NOT NULL,
  `region` varchar(64) NOT NULL,
  `views` int(8) NOT NULL,
  PRIMARY KEY (`advertID`),
  CONSTRAINT `Web_ibfk_1` FOREIGN KEY (`advertID`) REFERENCES `Advert` (`advertID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# TABLE STRUCTURE FOR: WorkDone
#

DROP TABLE IF EXISTS `WorkDone`;

CREATE TABLE `WorkDone` (
  `campaignID` int(6) NOT NULL,
  `employeeID` int(6) NOT NULL,
  `hoursWorked` int(4) NOT NULL,
  PRIMARY KEY (`campaignID`,`employeeID`),
  UNIQUE KEY `campaignID` (`campaignID`),
  UNIQUE KEY `employeeID` (`employeeID`),
  CONSTRAINT `WorkDone_ibfk_1` FOREIGN KEY (`campaignID`) REFERENCES `Campaign` (`campaignID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

