CREATE TABLE   `PersonalInfo` (
  `personID` int(6) NOT NULL UNIQUE AUTO_INCREMENT,
  `firstName` varchar(15) NOT NULL,
  `secondName` varchar(20) NOT NULL,
  `emailAddress` varchar(30) NOT NULL UNIQUE,
  `phoneNumber` int(15) NOT NULL,
  PRIMARY KEY(`personID`)
 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE  `Employee` (
  `employeeID` int(6) NOT NULL AUTO_INCREMENT,
  `personID` int(6) NOT NULL,
  `workEmail` varchar(30) NOT NULL,
  PRIMARY KEY(`employeeID`),
  FOREIGN KEY(`personID`) REFERENCES PersonalInfo(`personID`)
 ) ENGINE=InnoDB DEFAULT CHARSET=latin1; 


CREATE TABLE `Client` (
  `clientID` int(6) NOT NULL AUTO_INCREMENT,
  `personID` int(6) NOT NULL UNIQUE,
  companyName varchar(20) NOT NULL,
  PRIMARY KEY(`clientID`),
  FOREIGN KEY(personID) REFERENCES PersonalInfo(personID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `Campaign` (
  `campaignID` int(6) NOT NULL AUTO_INCREMENT,
  `clientID` int(6) NOT NULL UNIQUE,
  `startDate` DATE NOT NULL,
  `endDate` DATE NOT NULL,
  PRIMARY KEY(`campaignID`),
  FOREIGN KEY(clientID) REFERENCES Client(clientID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `Advert` (
  `advertID` int(6) NOT NULL AUTO_INCREMENT,
  `campaignID` int(6) NOT NULL UNIQUE,
  `type` varchar(8) NOT NULL,
  PRIMARY KEY (`advertID`),
  FOREIGN KEY (campaignID) REFERENCES Campaign(campaignID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `Invoice` (
  `invoiceID` int(6) NOT NULL AUTO_INCREMENT,
  `campaignID` int(6) NOT NULL UNIQUE,
  `clientID` int(6) NOT NULL UNIQUE,
  `cost` int(16) NOT NULL,
  PRIMARY KEY(`invoiceID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `Magazine` (
  `advertID` int(6) NOT NULL AUTO_INCREMENT,
  `magazine` varchar(32) NOT NULL,
  `size` varchar(16) NOT NULL,
  `position` varchar(16) NOT NULL,
  `frequency` int(4) NOT NULL,
  PRIMARY KEY (`advertID`),
  FOREIGN KEY (advertID) REFERENCES Advert(advertID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `TV&Radio` (
  `advertID` int(6) NOT NULL AUTO_INCREMENT,
  `slot` varchar(32) NOT NULL,
  `length` int(5) NOT NULL,
  `station` varchar(32) NOT NULL,
  `broadcastingNo` int(3) NOT NULL,
  PRIMARY KEY(`advertID`),
  FOREIGN KEY (advertID) REFERENCES Advert(advertID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `Web` (
  `advertID` int(6) NOT NULL AUTO_INCREMENT,
  `company` varchar(64) NOT NULL,
  `demographic` varchar(32) NOT NULL,
  `region` varchar(64) NOT NULL,
  `views` int(8) NOT NULL,
  PRIMARY KEY(`advertID`),
  FOREIGN KEY (advertID) REFERENCES Advert(advertID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `WorkDone` (
  `campaignID` int(6) NOT NULL UNIQUE,
  `employeeID` int(6) NOT NULL UNIQUE,
  `hoursWorked` int(4) NOT NULL,
  PRIMARY KEY(`campaignID`, `employeeID`),
  FOREIGN KEY (campaignID) REFERENCES Campaign(campaignID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


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
