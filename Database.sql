CREATE TABLE `Campaign` (
  `campaignID` int(6) NOT NULL UNIQUE,
  `clientID` int(6) NOT NULL UNIQUE,
  PRIMARY KEY(campaignID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `Advert` (
  `advertID` int(6) NOT NULL UNIQUE,
  `campaignID` int(6) NOT NULL UNIQUE,
  `type` varchar(8) NOT NULL,
  PRIMARY KEY (advertID),
  FOREIGN KEY (campaignID) REFERENCES Campaign(campaignID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `Client` (
  `clientID` int(6) NOT NULL UNIQUE,
  PRIMARY KEY(clientID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `Invoice` (
  `invoiceID` int(6) NOT NULL UNIQUE,
  `campaignID` int(6) NOT NULL UNIQUE,
  `clientID` int(6) NOT NULL UNIQUE,
  `cost` int(16) NOT NULL,
  PRIMARY KEY(invoiceID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `Magazine` (
  `advertID` int(6) NOT NULL UNIQUE,
  `magazine` varchar(32) NOT NULL,
  `size` varchar(16) NOT NULL,
  `position` varchar(16) NOT NULL,
  `frequency` int(4) NOT NULL,
  PRIMARY KEY (advertID),
  FOREIGN KEY (advertID) REFERENCES Advert(advertID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `TV&Radio` (
  `advertID` int(6) NOT NULL UNIQUE,
  `slot` varchar(32) NOT NULL,
  `length` int(5) NOT NULL,
  `station` varchar(32) NOT NULL,
  `broadcastingNo` int(3) NOT NULL,
  PRIMARY KEY(advertID),
  FOREIGN KEY (advertID) REFERENCES Advert(advertID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `Web` (
  `advertID` int(6) NOT NULL UNIQUE,
  `company` varchar(64) NOT NULL,
  `demographic` varchar(32) NOT NULL,
  `region` varchar(64) NOT NULL,
  `views` int(8) NOT NULL,
  PRIMARY KEY(advertID),
  FOREIGN KEY (advertID) REFERENCES Advert(advertID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `WorkDone` (
  `campaignID` int(6) NOT NULL UNIQUE,
  `employeeID` int(6) NOT NULL UNIQUE,
  `hoursWorked` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;