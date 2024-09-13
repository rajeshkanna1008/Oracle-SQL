-- Synonym creation 

--table data
select * from studentdetails;
--create a synonym from sys user to RAJESH user table name as mytable
CREATE SYNONYM RAJESH.mytable
  FOR sys.StudentDetails;

--Grant the permission
GRANT SELECT, INSERT, UPDATE, DELETE
  ON sys.studentDetails
  TO RAJESH;
-- Revoke the permission
Revoke dba, resource ,connect from RAJESH;
