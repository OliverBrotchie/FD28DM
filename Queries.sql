/* Query 1 (not working) */
SELECT DISTINCT Employee.employeeID, PersonalInfo.firstName, PersonalInfo.secondName
FROM PersonalInfo
	INNER JOIN Employee
		ON Employee.personID = PersonalInfo.personID
	INNER JOIN WorkDone
		ON WorkDone.employeeID = Employee.employeeID
	INNER JOIN Campaign
		ON Campaign.campaignID = WorkDone.campaignID
	INNER JOIN Advert
		ON Advert.campaignID = Campaign.campaignID
WHERE Advert.form != 'radio';




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







