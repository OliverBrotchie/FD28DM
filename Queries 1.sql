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
