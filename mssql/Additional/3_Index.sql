USE Kinder_garden
	--������ ��� ������� ���������� �� �������� [���] � ��������� ������ ������
GO
--DROP INDEX Employee.INDX_cl_EmpId
DROP INDEX INDX_cl_EmpId
ON Employee
GO
CREATE UNIQUE CLUSTERED INDEX INDX_cl_EmpId
	ON Employee (surname ASC, first_name ASC, last_name ASC)

----------------------------------------------------------------------------------
	-- ������ ��� ������� Visits_Journal �� �������� id_child � id_section
USE Kinder_garden
GO
DROP INDEX Visits_Journal.INDX_ncl_VisJournlIdChild
GO
CREATE NONCLUSTERED INDEX INDX_ncl_VisJournlIdChild 
	ON Visits_Journal (id_child ASC, id_section DESC)
GO
-----------------------------------------------------------------------------------
	-- ������������������ ������ ��� ������� Child �� �������� [���]
USE Kinder_garden
--IF OBJECT_ID('INDX_ChildSurname') IS NOT NULL
DROP INDEX INDX_cl_ChildSurname
ON Child
GO
USE Kinder_garden
CREATE CLUSTERED INDEX INDX_cl_ChildSurname 
ON Child (surname ASC, first_name ASC, last_name ASC)
GO
SELECT Child.surname
FROM Child JOIN Groups ON Child.id_group = Groups.id_group
WHERE Child.surname = 'Sidorov'