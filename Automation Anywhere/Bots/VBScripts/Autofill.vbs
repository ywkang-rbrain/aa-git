''#####  ���� ���� �ڵ� ä��� #####

'WScript.Arguments.Item(0)�� ���� AA���� �ѱ�� ������ vFileName�� ���� ������ �����ؼ� �Ұ�� ������ �־ �� ��ġ�� ���� �Է�

'������ü��� = WScript.Arguments.Item(0)  
'��Ʈ�� = WScript.Arguments.Item(1)
'�ٿ����� ������ġ = WScript.Arguments.Item(2)
'�ٿ����� ���� = WScript.Arguments.Item(3)

On Error Resume Next



Dim wb
Dim wks

Set wb = GetObject(WScript.Arguments.Item(0))
Set wks = wb.Worksheets(WScript.Arguments.Item(1))
wb.Application.DisplayAlerts = False

wks.Range(WScript.Arguments.Item(2)).Autofill wks.Range(WScript.Arguments.Item(3))

Set wks = nothing
Set wb = nothing

Err.Clear