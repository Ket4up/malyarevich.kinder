USE Kinder_garden
-- �������� ���������, ������� ����� �������� ������ �� ����� �������, 
-- ���������� �� � ������� ����������, ���� �� ����� ������ �� ������ �������
-- � ��������� � ������ �������, ���� ������ ������ ������������� ����������� ���������.
CREATE PROCEDURE [dbo].[MyProcedure] AS

DECLARE @ID INT
DECLARE @QUA INT
DECLARE @VAL VARCHAR (500)
DECLARE @NAM VARCHAR (500)
/*��������� ������*/
DECLARE @CURSOR CURSOR
/*��������� ������*/
SET @CURSOR  = CURSOR SCROLL
FOR
SELECT  INDEX, QUANTITY, VALUE,  NAME  
  FROM  My_First_Table WHERE  QUANTITY > 1
/*��������� ������*/
OPEN @CURSOR
/*�������� ������ ������*/
FETCH NEXT FROM @CURSOR INTO @ID, @QUA, @VAL, @NAM
/*��������� � ����� ������� �����*/
WHILE @@FETCH_STATUS = 0
BEGIN

        IF NOT EXISTS(SELECT VAL FROM My_Second_Table WHERE ID=@ID)
        BEGIN
/*��������� ��������� � ������ ������� ���� ������� �����������*/
                INSERT INTO My_Third_Table (VALUE, NAME) VALUE(@VAL, @NAM)
        END
/*�������� ��������� ������*/
FETCH NEXT FROM @CURSOR INTO @ID, @QUA, @VAL, @NAM
END
CLOSE @CURSOR

-----------------------------------------------

������ ��� ������ ������ ���� � �������� �� ������.

DECLARE  @firm    VARCHAR(50),
         @fam     VARCHAR(50),
         @message VARCHAR(80)
PRINT ' ������ ��������'
DECLARE klient_cursor CURSOR LOCAL FOR
    SELECT �����, �������
    FROM ������
    WHERE �����='������'
    ORDER BY �����, �������

OPEN klient_cursor
FETCH NEXT FROM klient_cursor INTO @firm, @fam
WHILE @@FETCH_STATUS=0
BEGIN
    SELECT @message='������ '+@fam+
                    ' ����� '+ @firm
    PRINT @message

-- ������� � ���������� �������--

    FETCH NEXT FROM klient_cursor 
      INTO @firm, @fam
END
CLOSE klient_cursor
DEALLOCATE klient_cursor