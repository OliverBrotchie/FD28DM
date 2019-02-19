/* Query 1 */
SELECT DISTINCT Employee.employeeID, PersonalInfo.firstName, PersonalInfo.secondName
FROM PersonalInfo
	INNER JOIN Employee
		ON Employee.personID = PersonalInfo.personID
WHERE Employee.employeeID NOT IN 
(
	SELECT DISTINCT Employee.employeeID
	FROM Employee
		INNER JOIN WorkDone
			ON WorkDone.employeeID = Employee.employeeID
		INNER JOIN Campaign
			ON Campaign.campaignID = WorkDone.campaignID
		INNER JOIN Advert
			ON Advert.campaignID = Campaign.campaignID
		WHERE Advert.form = 'radio'
);


/* Query 2 */
SELECT Client.clientID, COUNT(Advert.form) AS NumberOfRadioAdverts
FROM Client
	INNER JOIN Campaign
		ON Campaign.clientID = Client.clientID
	INNER JOIN Advert
		ON Advert.campaignID = Campaign.campaignID
WHERE Advert.form = "radio"
GROUP BY clientID;

SELECT Client.clientID,  radio, tv, web, magazine
FROM Client
	INNER JOIN Campaign
		ON Campaign.clientID = Client.clientID
	INNER JOIN ( SELECT Advert.campaignID radioID, COUNT(Advert.form)  AS radio FROM Advert WHERE Advert.form = 'radio' GROUP BY radioID) AS RadioQ 
		ON radioID = Campaign.campaignID
	INNER JOIN ( SELECT Advert.campaignID tvID, COUNT(Advert.form)  AS tv FROM Advert WHERE Advert.form = 'tv' GROUP BY tvID) AS tvQ 
		ON tvID = Campaign.campaignID
	INNER JOIN ( SELECT Advert.campaignID webID, COUNT(Advert.form)  AS web FROM Advert WHERE Advert.form = 'web' GROUP BY webID) AS webQ 
		ON webID = Campaign.campaignID
	INNER JOIN ( SELECT Advert.campaignID magID, COUNT(Advert.form)  AS magazine FROM Advert WHERE Advert.form = 'mag' GROUP BY magID) AS magQ 
		ON magID = Campaign.campaignID;


/* Query 3 */
SELECT ID AS EmployeeID, PersonalInfo.firstName,PersonalInfo.secondName, MAX(hours) AS MaxHoursWorked
FROM (
	SELECT  WorkDone.employeeID AS ID, SUM(WorkDone.hoursWorked) as hours
	FROM WorkDone  
	GROUP BY WorkDone.employeeID
) WorkDone
INNER JOIN Employee ON Employee.employeeID = ID
INNER JOIN PersonalInfo ON PersonalInfo.personID = Employee.personID;

/*Query 4 */
UPDATE Invoice
INNER JOIN (
	SELECT  WorkDone.campaignID AS ID, SUM(WorkDone.hoursWorked)*20 AS newCost
	FROM WorkDone  
	GROUP BY WorkDone.campaignID
) AS Costs ON ID = Invoice.campaignID
SET Invoice.cost = newCost
WHERE Invoice.campaignID = ID;





/*Corbin Beaumont, Query 1, Calculates average cost of all campaigns for the first 10 clients.*/
SELECT clientID, avg(cost) 
FROM invoice   
GROUP BY clientID 
HAVING clientID < 11;

/*Corbin Beaumont, Query 2, calculates the earnings per hour worked and groups it by campaign ID*/
SELECT Invoice.campaignID, sum(Invoice.cost) DIV sum(WorkDone.hoursworked) AS averageCostPerHour
FROM Invoice
	INNER JOIN WorkDone 
		ON Invoice.campaignID = WorkDone.campaignID
GROUP BY Invoice.campaignID;





/* Philip Lawson, Query 1, Employees that aren't working more than 10 hours on a project*/
SELECT DISTINCT Employee.employeeID, PersonalInfo.firstName, PersonalInfo.secondName
FROM PersonalInfo
	INNER JOIN Employee
		ON Employee.personID = PersonalInfo.personID
WHERE Employee.employeeID NOT IN
(
	SELECT DISTINCT Employee.employeeID
	FROM Employee
		INNER JOIN WorkDone
			on WorkDone.employeeID = Employee.employeeID
		WHERE WorkDone.hoursWorked > 10
)
ORDER BY Employee.employeeID;

/* Philip Lawson, Query 2, View that displays a list of employee ID's and their first and last names*/
CREATE VIEW vEmployeeID AS
SELECT Employee.EmployeeID, PersonalInfo.firstName, PersonalInfo.secondName
FROM PersonalInfo
	INNER JOIN Employee
		ON Employee.personID = PersonalInfo.personID;
SELECT vEmployeeID.EmployeeID, vEmployeeID.firstName, vEmployeeID.secondName
FROM vEmployeeID;





/* Oliver Brotchie Query 1, All middle managers (Anyone who is a manager but also has their own manager) */
SELECT *
FROM Employee
WHERE Employee.employeeID IN (
	SELECT Employee.ManagerID
	FROM Employee 
) AND Employee.managerID IS NOT NULL;

/* Oliver Brotchie, Query 2, Find all adverts that have a target demographic that aplies to 16 - 30 year olds */
SELECT * 
FROM Web
WHERE Web.advertID IN (
	SELECT Web.advertID
	FROM (SELECT SUBSTRING_INDEX(Web.demographic, '>', -1) AS GTValue, Web.advertID AS GTID FROM Web WHERE Web.demographic LIKE ">%") AS GTQuery
		INNER JOIN Web
			ON Web.advertID = GTID
	WHERE CONVERT(GTValue,UNSIGNED INTEGER) <= 30
) OR Web.advertID IN (
	SELECT Web.advertID
	FROM (SELECT SUBSTRING_INDEX(Web.demographic, '<', -1) AS LTValue, Web.advertID AS LTID FROM Web WHERE Web.demographic LIKE "<%") AS LTQuery
		INNER JOIN Web
			ON Web.advertID = LTID
	WHERE CONVERT(LTValue,UNSIGNED INTEGER) >= 30 AND CONVERT(LTValue,UNSIGNED INTEGER) >= 16 
) OR Web.advertID IN (
	SELECT Web.advertID
	FROM (SELECT SUBSTRING_INDEX(Web.demographic, '-', 1) AS ToLValue ,SUBSTRING_INDEX(Web.demographic, '-', -1) AS ToRValue, Web.advertID AS ToID FROM Web WHERE Web.demographic LIKE "%-%") AS ToQuery
		INNER JOIN Web
			ON Web.advertID = ToID
	WHERE CONVERT(ToLValue,UNSIGNED INTEGER) <= 16 AND CONVERT(ToRValue,UNSIGNED INTEGER) >= 30
);





/* Cameron Bone, Query 1, Displays view of number of hours worked on for each Campaign and the cost of each campaign*/
CREATE VIEW vHours AS
SELECT Campaign.campaignID, Invoice.cost, COUNT(WorkDone.employeeID) AS NumberOfEmployees

	INNER JOIN Invoice
		ON Invoice.campaignID = Campaign.campaignID;
		
		SELECT vHours.campaignID, vHours.cost, vHours.NumberOfEmployees
FROM vHours;


/* Cameron Bone, Query 2, Finds the campaigns which have a TV or Radio advert which has a runtime longer than 40 seconds */
SELECT Campaign.clientID, AVG(TVRadio.runTime) AS Average_Runtime
FROM TVRadio
	INNER JOIN Advert 
		ON Advert.advertID = TVRadio.advertID
	INNER JOIN Campaign 
		ON Campaign.campaignID = Advert.campaignID 
GROUP BY Campaign.clientID
HAVING Average_Runtime > 40;


/* James Mullan, Query 1, Shows the Number of Employees involved in a web advert in each region */
SELECT Campaign.campaignID, Advert.advertID, Web.region, COUNT(WorkDone.employeeID) AS NumberOfEmployees
FROM Employee
	INNER JOIN WorkDone
		ON WorkDone.employeeID = Employee.employeeID
	INNER JOIN Campaign
		ON Campaign.campaignID = WorkDone.campaignID
	INNER JOIN Advert
		ON Advert.campaignID = Campaign.campaignID
	INNER JOIN Web
		ON Web.advertID = Advert.advertID
	GROUP BY Web.region;
