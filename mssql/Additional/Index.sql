USE Kinder_garden
--������ ��� ������� ������ �� ������� ������� � ��������� ������ ������
CREATE UNIQUE CLUSTERED INDEX index_klient1
  ON ������ (�������)
  WITH DROP_EXISTING
  ON PRIMARY
  -
  -- ������ ��� ������� ������ �� �������� ������� � ��� � ��������� ������ ������
  -- �������� ������� ����� ����������� �� ��������.
  -- �������� �������������� ���������� ���������� ��� ��������� ������ � �������
  -- ��������� ������ ���������� ��������� ������� �� ������ 30%
  CREATE UNIQUE NONCLUSTERED INDEX index_klient2
  ON ������ (������� DESC,��� DESC)
  WITH FILLFACTOR=30,
  STATISTICS_NORECOMPUTE
  ON PRIMARY