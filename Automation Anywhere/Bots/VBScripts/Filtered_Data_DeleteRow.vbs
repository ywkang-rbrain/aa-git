'#####  ���͵� ����� �����ϱ� ##### 
'1�� ����κ��� ������ ���ҷ���  WScript.Arguments.Item(2)�� ���� 2����� ����


' ������ ���� ��� ������ �־ �ҽ��� ���� Parameter �Է�
'WScript.Arguments.Item(0)�� ���� AA���� �ѱ�� ������ vFileName�� ���� ������ �����ؼ� �Ұ�� ������ �־ �� ��ġ�� ���� �Է�


'������ü��� = WScript.Arguments.Item(0)  
'��Ʈ�� = WScript.Arguments.Item(1)
'������ ����  = WScript.Arguments.Item(2)   ex) 2:10
On Error Resume Next

Dim wb
Dim wks

Set wb = GetObject(WScript.Arguments.Item(0))
Set wks = wb.Worksheets(WScript.Arguments.Item(1))
wb.Application.DisplayAlerts = False

wks.Rows(WScript.Arguments.Item(2)).SpecialCells(12).EntireRow.Delete

Set wks = nothing
Set wb = nothing


Err.Clear