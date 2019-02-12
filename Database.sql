CREATE TABLE   `PersonalInfo` (
  `personID` int(6) NOT NULL UNIQUE AUTO_INCREMENT,
  `firstName` varchar(15) NOT NULL,
  `secondName` varchar(20) NOT NULL,
  `emailAddress` varchar(30) NOT NULL UNIQUE,
  `phoneNumber` int(20) NOT NULL,
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
  `campaignID` int(6) NOT NULL,
  `type` varchar(5) NOT NULL,
  PRIMARY KEY (`advertID`),
  FOREIGN KEY (campaignID) REFERENCES Campaign(campaignID),
  CONSTRAINT type CHECK (type IN ('web', 'mag', 'tv', 'radio'))
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


INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (1, 'Jarrett', 'occaecati', 'ebahringer@example.org', 131323);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (2, 'Sterling', 'nisi', 'ffritsch@example.org', 2123);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (3, 'Zack', 'dolorum', 'isadore.ruecker@example.org', 58293);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (4, 'Mossie', 'aut', 'treutel.celestino@example.org', 239385);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (5, 'Nico', 'veritatis', 'mwunsch@example.net', 29386);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (6, 'Micah', 'saepe', 'mohammed.welch@example.com', 98765);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (7, 'Keeley', 'ut', 'wboyer@example.com', 48705);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (8, 'Rebecca', 'quibusdam', 'jaqueline.quigley@example.com', 847665);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (9, 'Jay', 'debitis', 'cquigley@example.org', 23846);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (10, 'Jaquelin', 'et', 'keaton.mcclure@example.com', 7554);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (11, 'Brittany', 'consequatur', 'austyn17@example.com', 10639);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (12, 'Mariela', 'dolor', 'juvenal.wintheiser@example.org', 647930);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (13, 'Rosalia', 'voluptatem', 'noah.turner@example.com', 388704);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (14, 'Hazle', 'praesentium', 'schneider.berneice@example.org', 94960);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (15, 'Edwardo', 'praesentium', 'quentin64@example.org', 92943);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (16, 'Heather', 'sequi', 'okunde@example.net', 238749);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (17, 'Eleanore', 'error', 'vmitchell@example.org', 42942);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (18, 'Dena', 'omnis', 'price12@example.net', 2134);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (19, 'Emmalee', 'odit', 'santiago.bogisich@example.com', 38286);
INSERT INTO `PersonalInfo` (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES (20, 'June', 'qui', 'qwilkinson@example.net', 899687);

INSERT INTO `Employee` (`employeeID`, `personID`, `workEmail`) VALUES (1, 1, 'joccaeti@company.com');
INSERT INTO `Employee` (`employeeID`, `personID`, `workEmail`) VALUES (2, 2, 'snisi@company.com');
INSERT INTO `Employee` (`employeeID`, `personID`, `workEmail`) VALUES (3, 3, 'zdolorum@company.com');
INSERT INTO `Employee` (`employeeID`, `personID`, `workEmail`) VALUES (4, 4, 'maut@company.com');
INSERT INTO `Employee` (`employeeID`, `personID`, `workEmail`) VALUES (5, 5, 'nveritatis@company.com');
INSERT INTO `Employee` (`employeeID`, `personID`, `workEmail`) VALUES (6, 6, 'msaepe@company.com');
INSERT INTO `Employee` (`employeeID`, `personID`, `workEmail`) VALUES (7, 7, 'kut@company.com');
INSERT INTO `Employee` (`employeeID`, `personID`, `workEmail`) VALUES (8, 8, 'rquibusdam@company.com');
INSERT INTO `Employee` (`employeeID`, `personID`, `workEmail`) VALUES (9, 9, 'jdebitis@company.com');
INSERT INTO `Employee` (`employeeID`, `personID`, `workEmail`) VALUES (10, 10, 'jet@company.com');

INSERT INTO `Client` (`clientID`, `personID`, `companyName`) VALUES (1, 11, 'company');
INSERT INTO `Client` (`clientID`, `personID`, `companyName`) VALUES (2, 12, 'company');
INSERT INTO `Client` (`clientID`, `personID`, `companyName`) VALUES (3, 13, 'company');
INSERT INTO `Client` (`clientID`, `personID`, `companyName`) VALUES (4, 14, 'company');
INSERT INTO `Client` (`clientID`, `personID`, `companyName`) VALUES (5, 15, 'company');
INSERT INTO `Client` (`clientID`, `personID`, `companyName`) VALUES (6, 16, 'company');
INSERT INTO `Client` (`clientID`, `personID`, `companyName`) VALUES (7, 17, 'company');
INSERT INTO `Client` (`clientID`, `personID`, `companyName`) VALUES (8, 18, 'company');
INSERT INTO `Client` (`clientID`, `personID`, `companyName`) VALUES (9, 19, 'company');
INSERT INTO `Client` (`clientID`, `personID`, `companyName`) VALUES (10, 20, 'company');

INSERT INTO `Campaign` (`campaignID`, `clientID`, `startDate`, `endDate`) VALUES (1, 1, '2018.08.15', '2018.02.15');
INSERT INTO `Campaign` (`campaignID`, `clientID`, `startDate`, `endDate`) VALUES (2, 2, '2018.12.24', '2018.06.24');
INSERT INTO `Campaign` (`campaignID`, `clientID`, `startDate`, `endDate`) VALUES (3, 3, '2018.04.29', '2018.10.29');
INSERT INTO `Campaign` (`campaignID`, `clientID`, `startDate`, `endDate`) VALUES (4, 4, '2018.03.07', '2018.09.07');
INSERT INTO `Campaign` (`campaignID`, `clientID`, `startDate`, `endDate`) VALUES (5, 5, '2018.01.17', '2018.07.17');
INSERT INTO `Campaign` (`campaignID`, `clientID`, `startDate`, `endDate`) VALUES (6, 6, '2018.01.30', '2019.07.30');
INSERT INTO `Campaign` (`campaignID`, `clientID`, `startDate`, `endDate`) VALUES (7, 7, '2018.07.22', '2019.01.22');
INSERT INTO `Campaign` (`campaignID`, `clientID`, `startDate`, `endDate`) VALUES (8, 8, '2018.10.14', '2019.04.14');
INSERT INTO `Campaign` (`campaignID`, `clientID`, `startDate`, `endDate`) VALUES (9, 9, '2018.05.03', '2018.11.03');
INSERT INTO `Campaign` (`campaignID`, `clientID`, `startDate`, `endDate`) VALUES (10, 10, '2018.08.11', '2019.02.11');

INSERT INTO `Advert` (`advertID`, `campaignID`, `type`) VALUES (1, 1, 'mag');
INSERT INTO `Advert` (`advertID`, `campaignID`, `type`) VALUES (2, 2, 'tv');
INSERT INTO `Advert` (`advertID`, `campaignID`, `type`) VALUES (3, 3, 'web');
INSERT INTO `Advert` (`advertID`, `campaignID`, `type`) VALUES (4, 4, 'web');
INSERT INTO `Advert` (`advertID`, `campaignID`, `type`) VALUES (5, 5, 'radio');
INSERT INTO `Advert` (`advertID`, `campaignID`, `type`) VALUES (6, 6, 'mag');
INSERT INTO `Advert` (`advertID`, `campaignID`, `type`) VALUES (7, 7, 'tv');
INSERT INTO `Advert` (`advertID`, `campaignID`, `type`) VALUES (8, 8, 'mag');
INSERT INTO `Advert` (`advertID`, `campaignID`, `type`) VALUES (9, 9, 'web');
INSERT INTO `Advert` (`advertID`, `campaignID`, `type`) VALUES (10, 10, 'radio');

INSERT INTO Invoice (`invoiceID`, `campaignID`, `clientID`, `cost`) VALUES ( 1, 1, 1, 61);
INSERT INTO Invoice (`invoiceID`, `campaignID`, `clientID`, `cost`) VALUES ( 2, 2, 2, 81);
INSERT INTO Invoice (`invoiceID`, `campaignID`, `clientID`, `cost`) VALUES ( 3, 3, 3, 34);
INSERT INTO Invoice (`invoiceID`, `campaignID`, `clientID`, `cost`) VALUES ( 4, 4, 4, 49);
INSERT INTO Invoice (`invoiceID`, `campaignID`, `clientID`, `cost`) VALUES ( 5, 5, 5, 76);
INSERT INTO Invoice (`invoiceID`, `campaignID`, `clientID`, `cost`) VALUES ( 6, 6, 6, 91);
INSERT INTO Invoice (`invoiceID`, `campaignID`, `clientID`, `cost`) VALUES ( 7, 7, 7, 75);
INSERT INTO Invoice (`invoiceID`, `campaignID`, `clientID`, `cost`) VALUES ( 8, 8, 8, 16);
INSERT INTO Invoice (`invoiceID`, `campaignID`, `clientID`, `cost`) VALUES ( 9, 9, 9, 64);
INSERT INTO Invoice (`invoiceID`, `campaignID`, `clientID`, `cost`) VALUES ( 10, 10, 10, 48);

INSERT INTO Magazine (`advertID`, `magazineID`, `size`, `position`, `frequency`) VALUES (1, 1, 'large', 'Top Right', 80);
INSERT INTO Magazine (`advertID`, `magazineID`, `size`, `position`, `frequency`) VALUES (6, 2, 'small', 'Middle Centre', 150);
INSERT INTO Magazine (`advertID`, `magazineID`, `size`, `position`, `frequency`) VALUES (8, 3, 'medium', 'Bottomm Right', 110);

INSERT INTO TV&Radio (`advertID`, `slot`, `length`, `station`, `broadcastingNo`) VALUES (2, '18:00', '120', 'BBC1', 25);
INSERT INTO TV&Radio (`advertID`, `slot`, `length`, `station`, `broadcastingNo`) VALUES (5, '10:00', '120', 'ITV', 15);
INSERT INTO TV&Radio (`advertID`, `slot`, `length`, `station`, `broadcastingNo`) VALUES (7, '13:00', '120', 'BBC Radio4', 35);
INSERT INTO TV&Radio (`advertID`, `slot`, `length`, `station`, `broadcastingNo`) VALUES (10, '07:00', '120', 'BBC Radio1', 50);

INSERT INTO Web (`advertID`, `company`, `demographic`, `region`, `views`) VALUES (3, 'company', 'demo', 'region', 'views');
INSERT INTO Web (`advertID`, `company`, `demographic`, `region`, `views`) VALUES (4, 'company', 'demo', 'region', 'views');
INSERT INTO Web (`advertID`, `company`, `demographic`, `region`, `views`) VALUES (9, 'company', 'demo', 'region', 'views');

INSERT INTO WorkDone (`campaignID`, `employeeID`, `hoursWorked`) VALUES (1, 1, 12);
INSERT INTO WorkDone (`campaignID`, `employeeID`, `hoursWorked`) VALUES (1, 1, 12);
INSERT INTO WorkDone (`campaignID`, `employeeID`, `hoursWorked`) VALUES (1, 1, 12);
INSERT INTO WorkDone (`campaignID`, `employeeID`, `hoursWorked`) VALUES (1, 1, 12);
INSERT INTO WorkDone (`campaignID`, `employeeID`, `hoursWorked`) VALUES (1, 1, 12);
INSERT INTO WorkDone (`campaignID`, `employeeID`, `hoursWorked`) VALUES (1, 1, 12);
INSERT INTO WorkDone (`campaignID`, `employeeID`, `hoursWorked`) VALUES (1, 1, 12);
INSERT INTO WorkDone (`campaignID`, `employeeID`, `hoursWorked`) VALUES (1, 1, 12);
INSERT INTO WorkDone (`campaignID`, `employeeID`, `hoursWorked`) VALUES (1, 1, 12);
INSERT INTO WorkDone (`campaignID`, `employeeID`, `hoursWorked`) VALUES (1, 1, 12);
INSERT INTO WorkDone (`campaignID`, `employeeID`, `hoursWorked`) VALUES (1, 1, 12);
INSERT INTO WorkDone (`campaignID`, `employeeID`, `hoursWorked`) VALUES (1, 1, 12);
INSERT INTO WorkDone (`campaignID`, `employeeID`, `hoursWorked`) VALUES (1, 1, 12);
INSERT INTO WorkDone (`campaignID`, `employeeID`, `hoursWorked`) VALUES (1, 1, 12);
INSERT INTO WorkDone (`campaignID`, `employeeID`, `hoursWorked`) VALUES (1, 1, 12);
