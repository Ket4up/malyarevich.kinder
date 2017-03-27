USE Kinder_garden
--��������� ��������� ������ � Teacher_of_section, �� ������� ����� � ��� �� ������ ��� ��������� �������
CREATE TRIGGER TriggerDenyInsertDuplerOfSectionOnMonthYear
   ON Teacher_Of_section
   AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
IF (SELECT month_sect, year_sect, id_section FROM inserted) = (SELECT month_sect, year_sect, id_section FROM inserted)
ROLLBACK
PRINT'�� �� ������ �������� ������������� �� ������ ����� � ������ ������, ��� ��� �� ��� ������ ��� ��������� �������������.'
END

USE Kinder_garden

INSERT INTO Teacher_of_section(id_teacher_sect, id_section, id_employee, month_sect, year_sect) VALUES
	(22, 2, 3, 3, 2013)
--------------------------------------------------------------

IF OBJECT_ID('TRG_InsertSyncEmp') IS NOT NULL
DROP TRIGGER TRG_InsertSyncEmp
GO

CREATE TRIGGER TRG_InsertSyncEmp 
ON dbo.EMPLOYEE
AFTER INSERT AS
BEGIN
INSERT INTO EMPLOYEE_BACKUP
SELECT * FROM INSERTED
END
GO

INSERT INTO EMPLOYEE (EMPID, FNAME, LNAME) VALUES (504, 'Vish', 'Dalvi') 


SELECT * from EMPLOYEE
SELECT * from EMPLOYEE_BACKUP 
GO