'#####  ���� ���� �ϱ� #####

' ������ ���� ��� ������ �־ �ҽ��� ���� Parameter �Է�
'WScript.Arguments.Item(0)�� ���� AA���� �ѱ�� ������ vFileName�� ���� ������ �����ؼ� �Ұ�� ������ �־ �� ��ġ�� ���� �Է�

' WScript.Arguments.Item(0)             '���ϸ�
' WScript.Arguments.Item(1)			  '��Ʈ�� 

On Error Resume Next


Set wb = GetObject(WScript.Arguments.Item(0))
Set wks = wb.Worksheets(WScript.Arguments.Item(1))
wb.Application.DisplayAlerts = False

wks.AutoFilterMode = False

Set wks = Nothing
Set wb = Nothing 


Err.Clear