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


/*Corbin Beaumont, Query 1, Calculates average cost of all campaigns for clients who have clientID beginning with 1.*/
SELECT avg(cost) 
FROM invoice   
GROUP BY clientID 
HAVING clientID LIKE '1%';

/*Corbin Beaumont, Query 2, calculates the earnings per hour worked and groups it by campaign ID*/
SELECT Invoice.campaignID, sum(Invoice.cost) DIV sum(WorkDone.hoursworked) AS earnings_per_hour_worked
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
ORDER BY Employee.employeeID
;

/* Philip's second query : view that displays a list of employees with first and last names*/
CREATE VIEW vEmployeeID AS
SELECT Employee.EmployeeID, PersonalInfo.firstName, PersonalInfo.secondName
FROM PersonalInfo
	INNER JOIN Employee
		ON Employee.personID = PersonalInfo.personID
;
SELECT * FROM vEmployeeID;

