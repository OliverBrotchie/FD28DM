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


/* Query 2 Need to add all types*/
SELECT Client.clientID, PersonalInfo.firstName, PersonalInfo.secondName, COUNT(Advert.form) AS NumberOfRadioAdverts
FROM PersonalInfo
	INNER JOIN Client
		ON Client.personID = personalInfo.personID
	INNER JOIN Campaign
		ON Campaign.clientID = Client.clientID
	INNER JOIN Advert
		ON Advert.campaignID = Campaign.campaignID
WHERE Advert.form = "radio";


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

/*Corbin Beaumont, Query 1, Calculates average cost of all campaigns for clients who have clientID beginning with 1.*/
SELECT avg(cost) 
FROM invoice   
GROUP BY clientID 
HAVING clientID LIKE '1%';

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

/* Oliver Brotchi, Query 2, Find all adverts that have a target demographic that aplies to 16 - 30 year olds */
SELECT * 
FROM Web
WHERE Web.advertID IN (
	SELECT Web.advertID
	FROM (SELECT SUBSTRING_INDEX(Web.demographic, '>', -1) AS GTValue, Web.advertID AS GTID FROM Web WHERE Web.demographic LIKE ">%") AS GTQuery
		INNER JOIN Web
			ON Web.advertID = GTID
	WHERE CONVERT(GTValue,UNSIGNED INTEGER) <= 16
) OR Web.advertID IN (
	SELECT Web.advertID
	FROM (SELECT SUBSTRING_INDEX(Web.demographic, '<', -1) AS LTValue, Web.advertID AS LTID FROM Web WHERE Web.demographic LIKE "<%") AS LTQuery
		INNER JOIN Web
			ON Web.advertID = LTID
	WHERE CONVERT(LTValue,UNSIGNED INTEGER) >= 30  
) OR Web.advertID IN (
	SELECT Web.advertID
	FROM (SELECT SUBSTRING_INDEX(Web.demographic, '-', 1) AS ToLValue ,SUBSTRING_INDEX(Web.demographic, '-', -1) AS ToRValue, Web.advertID AS ToID FROM Web WHERE Web.demographic LIKE "%-%") AS ToQuery
		INNER JOIN Web
			ON Web.advertID = ToID
	WHERE CONVERT(ToLValue,UNSIGNED INTEGER) <= 16 OR CONVERT(ToRValue,UNSIGNED INTEGER) >= 30
);
