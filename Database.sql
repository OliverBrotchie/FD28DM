SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


CREATE TABLE `Advert` (
  `advertID` int(6) NOT NULL,
  `campaignID` int(6) NOT NULL,
  `type` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `Campaign` (
  `campaignID` int(6) NOT NULL,
  `clientID` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `Client` (
  `clientID` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `Invoice` (
  `invoiceID` int(6) NOT NULL,
  `campaignID` int(6) NOT NULL,
  `clientID` int(6) NOT NULL,
  `cost` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `Magazine` (
  `advertID` int(6) NOT NULL,
  `magazine` varchar(32) NOT NULL,
  `size` varchar(16) NOT NULL,
  `position` varchar(16) NOT NULL,
  `frequency` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `TV&Radio` (
  `advertID` int(6) NOT NULL,
  `slot` varchar(32) NOT NULL,
  `length` int(5) NOT NULL,
  `station` varchar(32) NOT NULL,
  `broadcastingNo` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `Web` (
  `advertID` int(6) NOT NULL,
  `company` varchar(64) NOT NULL,
  `demographic` varchar(32) NOT NULL,
  `region` varchar(64) NOT NULL,
  `views` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `WorkDone` (
  `campaignID` int(6) NOT NULL,
  `employeeID` int(6) NOT NULL,
  `hoursWorked` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


ALTER TABLE `Advert`
  ADD PRIMARY KEY (`advertID`),
  ADD KEY `campaignID` (`campaignID`);


ALTER TABLE `Campaign`
  ADD PRIMARY KEY (`campaignID`);


ALTER TABLE `Client`
  ADD PRIMARY KEY (`clientID`);


ALTER TABLE `Invoice`
  ADD PRIMARY KEY (`invoiceID`);


ALTER TABLE `Magazine`
  ADD KEY `advertID` (`advertID`);


ALTER TABLE `Web`
  ADD KEY `advertID` (`advertID`);


ALTER TABLE `Advert`
  ADD CONSTRAINT `Advert_ibfk_1` FOREIGN KEY (`campaignID`) REFERENCES `Campaign` (`campaignID`);


ALTER TABLE `Magazine`
  ADD CONSTRAINT `Magazine_ibfk_1` FOREIGN KEY (`advertID`) REFERENCES `Advert` (`advertID`);


ALTER TABLE `Web`
  ADD CONSTRAINT `Web_ibfk_1` FOREIGN KEY (`advertID`) REFERENCES `Advert` (`advertID`);
COMMIT;
