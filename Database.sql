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
  `personID` int(6) NOT NULL UNIQUE,
  `workEmail` varchar(30) NOT NULL UNIQUE,
  `managerID` int(6),
  PRIMARY KEY(`employeeID`),
  FOREIGN KEY(`personID`) REFERENCES PersonalInfo(`personID`),
  FOREIGN KEY(`managerID`) REFERENCES Employee(`employeeID`)
 ) ENGINE=InnoDB DEFAULT CHARSET=latin1; 

CREATE TABLE `Client` (
  `clientID` int(6) NOT NULL AUTO_INCREMENT,
  `personID` int(6) NOT NULL UNIQUE,
  `companyID` int(6) NOT NULL,
  PRIMARY KEY(`clientID`),
  FOREIGN KEY(`personID`) REFERENCES PersonalInfo(`personID`),
  FOREIGN KEY(`companyID`) REFERENCES Company(`companyID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `Campaign` (
  `campaignID` int(6) NOT NULL AUTO_INCREMENT,
  `clientID` int(6) NOT NULL UNIQUE,
  `startDate` DATE NOT NULL,
  `endDate` DATE NOT NULL,
  PRIMARY KEY(`campaignID`),
  FOREIGN KEY(`clientID`) REFERENCES Client(`clientID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `Advert` (
  `advertID` int(6) NOT NULL AUTO_INCREMENT,
  `campaignID` int(6) NOT NULL,
  `form` varchar(5) NOT NULL,
  PRIMARY KEY (`advertID`),
  FOREIGN KEY (`campaignID`) REFERENCES Campaign(`campaignID`),
  CONSTRAINT form CHECK (form IN ('web', 'mag', 'tv', 'radio'))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `Invoice` (
  `invoiceID` int(6) NOT NULL AUTO_INCREMENT,
  `campaignID` int(6) NOT NULL UNIQUE,
  `clientID` int(6) NOT NULL UNIQUE,
  `cost` int(16),
  PRIMARY KEY(`invoiceID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `Magazine` (
  `advertID` int(6) NOT NULL AUTO_INCREMENT,
  `companyID` int(6) NOT NULL,
  `textSize` varchar(16) NOT NULL,
  `position` varchar(16) NOT NULL,
  `issues` int(4) NOT NULL,
  PRIMARY KEY (`advertID`),
  FOREIGN KEY (`advertID`) REFERENCES Advert(`advertID`),
  FOREIGN KEY(`companyID`) REFERENCES Company(`companyID`),
  CONSTRAINT textSize CHECK (textSize IN('small','medium','large')),
  CONSTRAINT position CHECK (position IN ('top-right', 'top-center', 'top-left','middle-right', 'middle-center', 'middle-left','bottom-right', 'bottom-center', 'bottom-left', 'custom'))                                      
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `TVRadio` (
  `advertID` int(6) NOT NULL AUTO_INCREMENT,
  `slot` time NOT NULL,
  `runTime` int(5) NOT NULL,
  `companyID` int(6) NOT NULL,
  `broadcastingNo` int(4) NOT NULL,
  PRIMARY KEY(`advertID`),
  FOREIGN KEY (`advertID`) REFERENCES Advert(`advertID`),
  FOREIGN KEY(`companyID`) REFERENCES Company(`companyID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `Web` (
  `advertID` int(6) NOT NULL AUTO_INCREMENT,
  `companyID` int(6) NOT NULL,
  `demographic` varchar(32) NOT NULL,
  `region` varchar(64) NOT NULL,
  `views` int(8) NOT NULL,
  PRIMARY KEY(`advertID`),
  FOREIGN KEY (`advertID`) REFERENCES Advert(`advertID`),
  FOREIGN KEY(`companyID`) REFERENCES Company(`companyID`),
  CONSTRAINT demographic CHECK (demographic IN( '%-%', '<%', '>%' ))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `WorkDone` (
  `campaignID` int(6) NOT NULL,
  `employeeID` int(6) NOT NULL,
  `hoursWorked` int(4) NOT NULL,
  PRIMARY KEY(`campaignID`, `employeeID`),
  FOREIGN KEY (`campaignID`) REFERENCES Campaign(`campaignID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO PersonalInfo (`personID`, `firstName`, `secondName`, `emailAddress`, `phoneNumber`) VALUES
(1, 'Jarrett', 'occaecati', 'ebahringer@example.org', 131323),
(2, 'Sterling', 'nisi', 'ffritsch@example.org', 2123),
(3, 'Zack', 'dolorum', 'isadore.ruecker@example.org', 58293),
(4, 'Mossie', 'aut', 'treutel.celestino@example.org', 239385),
(5, 'Nico', 'veritatis', 'mwunsch@example.net', 29386),
(6, 'Micah', 'saepe', 'mohammed.welch@example.com', 98765),
(7, 'Keeley', 'ut', 'wboyer@example.com', 48705),
(8, 'Rebecca', 'quibusdam', 'jaqueline.quigley@example.com', 847665),
(9, 'Jay', 'debitis', 'cquigley@example.org', 23846),
(10, 'Jaquelin', 'et', 'keaton.mcclure@example.com', 7554),
(11, 'Brittany', 'consequatur', 'austyn17@example.com', 10639),
(12, 'Mariela', 'dolor', 'juvenal.wintheiser@example.org', 647930),
(13, 'Rosalia', 'voluptatem', 'noah.turner@example.com', 388704),
(14, 'Hazle', 'praesentium', 'schneider.berneice@example.org', 94960),
(15, 'Edwardo', 'praesentium', 'quentin64@example.org', 92943),
(16, 'Heather', 'sequi', 'okunde@example.net', 238749),
(17, 'Eleanore', 'error', 'vmitchell@example.org', 42942),
(18, 'Dena', 'omnis', 'price12@example.net', 2134),
(19, 'Emmalee', 'odit', 'santiago.bogisich@example.com', 38286),
(20, 'June', 'qui', 'qwilkinson@example.net', 899687);

INSERT INTO Employee (`employeeID`, `personID`, `workEmail`, `managerID`) VALUES 
(10, 10, 'jet@company.com',NULL),
(8, 8, 'rquibusdam@company.com',10),
(9, 9, 'jdebitis@company.com',10),
(1, 1, 'joccaeti@company.com',8),
(2, 2, 'snisi@company.com',8),
(3, 3, 'zdolorum@company.com',8),
(4, 4, 'maut@company.com',8),
(5, 5, 'nveritatis@company.com',9),
(6, 6, 'msaepe@company.com',9),
(7, 7, 'kut@company.com',9);


INSERT INTO Company (`companyID`, `name`) VALUES 
(1, 'Vogue'),
(2, 'Radio 4'),
(3, 'E4'),
(4, 'Google'),
(5, 'Facebook'),
(6, 'Bobs Builders'),
(7, 'Asda'),                             
(8, 'Tesla'),                            
(9, 'Times'),                       
(10, 'Programmer Weekly');
                             
INSERT INTO Client (`clientID`, `personID`, `companyID`) VALUES
(1, 11, '1'),
(2, 12, '2'),
(3, 13, '3'),
(4, 14, '4'),
(5, 15, '5'),
(6, 16, '6'),
(7, 17, '7'),
(8, 18, '8'),
(9, 19, '9'),
(10, 20, '10');
                  
INSERT INTO Campaign (`campaignID`, `clientID`, `startDate`, `endDate`) VALUES 
(1, 1, '2018.08.15', '2018.02.15'),
(2, 2, '2018.12.24', '2018.06.24'),
(3, 3, '2018.04.29', '2018.10.29'),
(4, 4, '2018.03.07', '2018.09.07'),
(5, 5, '2018.01.17', '2018.07.17'),
(6, 6, '2018.01.30', '2019.07.30'),
(7, 7, '2018.07.22', '2019.01.22'),
(8, 8, '2018.10.14', '2019.04.14'),
(9, 9, '2018.05.03', '2018.11.03'),
(10, 10, '2018.08.11', '2019.02.11');

INSERT INTO Advert (`advertID`, `campaignID`, `form`) VALUES 
(1, 1, 'mag'), (2, 1, 'web'), (3, 1, 'tv'), (4, 1, 'radio'),
(5, 2, 'tv'), (6, 2, 'radio'), (7, 2, 'mag'),
(8, 3, 'web'), (9, 3, 'mag'), (10, 3, 'tv'),
(11, 4, 'web'), (12, 4, 'radio'),
(13, 5, 'tv'),
(14, 6, 'web'), (15, 6, 'mag'), (16, 6, 'radio'), (17, 6, 'tv'),
(18, 7, 'radio'), (19, 7, 'mag'), 
(20, 8, 'tv'), (21, 8, 'radio'),
(22, 9, 'tv'),
(23, 10, 'web'), (24, 10, 'mag'), (25, 10, 'radio');


INSERT INTO Invoice (`invoiceID`, `campaignID`, `clientID`, `cost`) VALUES 
( 1, 1, 1, 61),
( 2, 2, 2, 81),
( 3, 3, 3, NULL),
( 4, 4, 4, NULL),
( 5, 5, 5, NULL),
( 6, 6, 6, NULL),
( 7, 7, 7, NULL),
( 8, 8, 8, NULL),
( 9, 9, 9, NULL),
( 10, 10, 10, NULL);
                             
INSERT INTO Magazine (`advertID`, `companyID`, `textSize`, `position`, `issues`) VALUES 
(1, 1, 'large', 'top-right', 16),
(7, 9, 'small', 'middle-center',23),
(9, 10, 'medium', 'bottom-left', 10),
(15, 1, 'medium', 'middle-left', 14),
(18, 1, 'large', 'custom', 19),
(23, 9, 'small', 'top-left', 7);
                    
                         
INSERT INTO TVRadio (`advertID`, `slot`, `runTime`, `companyID`, `broadcastingNo`) VALUES 
/*Radio Adverts*/
(4, 10.00, 120, 2, 15),
(6, 13.00, 120, 2, 35),
(12, 07.00, 120, 2, 23),
(16, 17.00, 120, 2, 12),
(18, 09.00, 120, 2, 9),
(21, 21.00, 120, 2, 25),
(25, 22.00, 120, 2, 36),

/*TV Adverts*/
(3, 07.00, 120, 3, 12),
(5, 10.00, 120, 3, 31),
(10, 12.00, 120, 3, 9),
(13, 23.00, 120, 3, 10),
(17, 06.00, 120, 3, 17),
(20, 17.00, 120, 3, 40),
(22, 20.00, 120, 3, 27);

                         
INSERT INTO Web (`advertID`, `companyID`, `demographic`, `region`, `views`) VALUES 
(2, 5, '16-30', 'region', 100),
(8, 8, '35-65', 'region', 100),
(11, 4, '>15', 'region', 100),
(14, 7, '15<', 'region', 100),
(23, 6, '20-65', 'region', 100);


INSERT INTO WorkDone (`campaignID`, `employeeID`, `hoursWorked`) VALUES 
(1, 1, 12), (1, 5, 21), (1, 7, 4), (1, 10, 7),
(2, 9, 28), (2, 3, 30),
(3, 2, 7), (3, 8, 18), (3, 4, 20), (3, 6, 16),
(4, 5, 50),
(5, 8, 30), (5, 3, 24),
(6, 1, 23), (6, 4, 18), (6, 9, 30), (6, 2, 10), (6, 10, 10),
(7, 6, 15), (7, 5, 13),
(8, 3, 20), (8, 7, 15), (8, 10, 5),
(9, 1, 20), (9, 2, 20),
(10, 7, 28), (10, 9, 14), (10, 4, 12), (10, 5, 23);
