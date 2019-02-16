/* Example index, reduces the time for query 3 from 0.02s to 0.00s */
/* creates index for table_name(column_name) */
CREATE INDEX hours ON WorkDone (hoursWorked);
/* deletes index */
DROP INDEX hours ON WorkDone;


/* There could be a huge number of employees working at the marketing firm and for example if you had an urgent problem
this would reduce the time needed to relay infomation up the chain of command. Reduces the query from 0.02s to 0.00s  */
CREATE INDEX manager ON Employee(employeeID, managerID);
