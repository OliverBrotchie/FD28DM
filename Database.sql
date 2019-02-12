CREATE TABLE   `PersonalInfo` (
  `personID` int(6) NOT NULL UNIQUE AUTO_INCREMENT,
  `firstName` varchar(15) NOT NULL,
  `secondName` varchar(20) NOT NULL,
  `emailAddress` varchar(30) NOT NULL UNIQUE,
  `phoneNumber` int(20) NOT NULL,
  PRIMARY KEY(`personID`)
 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE   `Company` (
  `companyID` int(6) NOT NULL UNIQUE AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY(`companyID`)
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
  `companyID` int(6) NOT NULL,
  PRIMARY KEY(`clientID`),
  FOREIGN KEY(personID) REFERENCES PersonalInfo(personID),
  FOREIGN KEY(companyID) REFERENCES Company(companyID)
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
  `companyID` int(6) NOT NULL,
  `size` varchar(16) NOT NULL,
  `position` varchar(16) NOT NULL,
  `number` int(4) NOT NULL,
  PRIMARY KEY (`advertID`),
  FOREIGN KEY (advertID) REFERENCES Advert(advertID),
  FOREIGN KEY(companyID) REFERENCES Company(companyID),
  CONSTRAINT size CHECK (size IN('small','medium','large')),
  CONSTRAINT position CHECK (position IN ('top-right', 'top-center', 'top-left','middle-right', 'middle-center', 'middle-left','bottom-right', 'bottom-center', 'bottom-left', 'custom'))                                      
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `TV&Radio` (
  `advertID` int(6) NOT NULL AUTO_INCREMENT,
  `slot` time() NOT NULL,
  `length` int(5) NOT NULL,
  `companyID` int(6) NOT NULL,
  `broadcastingNo` int(3) NOT NULL,
  `type` varchar(5) NOT NULL,
  PRIMARY KEY(`advertID`),
  FOREIGN KEY (advertID) REFERENCES Advert(advertID),
  FOREIGN KEY(companyID) REFERENCES Company(companyID),
  CONSTRAINT type CHECK (type IN('tv','radio'))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `Web` (
  `advertID` int(6) NOT NULL AUTO_INCREMENT,
  `companyID` int(6) NOT NULL,
  `demographic` varchar(32) NOT NULL,
  `region` varchar(64) NOT NULL,
  `views` int(8) NOT NULL,
  PRIMARY KEY(`advertID`),
  FOREIGN KEY (advertID) REFERENCES Advert(advertID),
  FOREIGN KEY(companyID) REFERENCES Company(companyID)
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

INSERT INTO `Company` (`companyID`, `name`) VALUES (1, 'Vouge');
INSERT INTO `Company` (`companyID`, `name`) VALUES (2, 'Radio 4');
INSERT INTO `Company` (`companyID`, `name`) VALUES (3, 'E4');
INSERT INTO `Company` (`companyID`, `name`) VALUES (4, 'Google');
INSERT INTO `Company` (`companyID`, `name`) VALUES (5, 'Facebook');
INSERT INTO `Company` (`companyID`, `name`) VALUES (6, 'Bobs Builders');
INSERT INTO `Company` (`companyID`, `name`) VALUES (7, 'Asda');                             
INSERT INTO `Company` (`companyID`, `name`) VALUES (8, 'Tesla');                             
INSERT INTO `Company` (`companyID`, `name`) VALUES (9, 'Times');                             
INSERT INTO `Company` (`companyID`, `name`) VALUES (10, 'Programmer Weekly');
                             
INSERT INTO `Client` (`clientID`, `personID`, `companyID`) VALUES (1, 11, '6');
INSERT INTO `Client` (`clientID`, `personID`, `companyID`) VALUES (2, 12, '7');
INSERT INTO `Client` (`clientID`, `personID`, `companyID`) VALUES (3, 13, '8');
                  
INSERT INTO `Campaign` (`campaignID`, `clientID`, `startDate`, `endDate`) VALUES (1, 1, '2018.08.15', '2018.02.15');
INSERT INTO `Campaign` (`campaignID`, `clientID`, `startDate`, `endDate`) VALUES (2, 2, '2018.12.24', '2018.06.24');
INSERT INTO `Campaign` (`campaignID`, `clientID`, `startDate`, `endDate`) VALUES (3, 3, '2018.04.29', '2018.10.29');

INSERT INTO `Advert` (`advertID`, `campaignID`, `type`) VALUES (1, 1, 'mag');
INSERT INTO `Advert` (`advertID`, `campaignID`, `type`) VALUES (2, 2, 'tv');
INSERT INTO `Advert` (`advertID`, `campaignID`, `type`) VALUES (3, 3, 'web');
INSERT INTO `Advert` (`advertID`, `campaignID`, `type`) VALUES (4, 1, 'web');
INSERT INTO `Advert` (`advertID`, `campaignID`, `type`) VALUES (5, 2, 'radio');
INSERT INTO `Advert` (`advertID`, `campaignID`, `type`) VALUES (6, 3, 'mag');
INSERT INTO `Advert` (`advertID`, `campaignID`, `type`) VALUES (7, 1, 'tv');
INSERT INTO `Advert` (`advertID`, `campaignID`, `type`) VALUES (8, 2, 'mag');
INSERT INTO `Advert` (`advertID`, `campaignID`, `type`) VALUES (9, 3, 'web');
INSERT INTO `Advert` (`advertID`, `campaignID`, `type`) VALUES (10, 1, 'radio');

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
                             
INSERT INTO Magazine (`advertID`, `companyID`, `size`, `position`, `number`) VALUES (1, 1, 'large', 'top-right', 6);
INSERT INTO Magazine (`advertID`, `companyID`, `size`, `position`, `number`) VALUES (6, 9, 'small', 'middle-center', 3);
INSERT INTO Magazine (`advertID`, `companyID`, `size`, `position`, `number`) VALUES (8, 10, 'medium', 'bottom-left', 1);

                                  /*working untill here*/
                        /* ----------------------------------------*/
                         
                         
INSERT INTO TV&Radio (`advertID`, `slot`, `length`, `companyID`, `broadcastingNo`, `type`) VALUES (2, '18:00', '120', '2', 25,'radio');
INSERT INTO TV&Radio (`advertID`, `slot`, `length`, `companyID`, `broadcastingNo`, `type`) VALUES (5, '10:00:00', '120', '3', 15,'tv');
INSERT INTO TV&Radio (`advertID`, `slot`, `length`, `companyID`, `broadcastingNo`, `type`) VALUES (7, '13:00:00', '120', '2', 35,'radio');
INSERT INTO TV&Radio (`advertID`, `slot`, `length`, `companyID`, `broadcastingNo`, `type`) VALUES (10, '07:00:00', '120', '3', 50,'tv');

                         
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
