'#####  ���� ���� �����ؼ� �����ϱ� #####

'WScript.Arguments.Item(0)�� ���� AA���� �ѱ�� ������ vFileName�� ���� ������ �����ؼ� �Ұ�� ������ �־ �� ��ġ�� ���� �Է�

'������ü��� = WScript.Arguments.Item(0)  
'��Ʈ�� = WScript.Arguments.Item(1)
'������� = WScript.Arguments.Item(2)


	On Error Resume Next


Dim wb
Dim wks

Set wb = GetObject(WScript.Arguments.Item(0))
Set wks = wb.Worksheets(WScript.Arguments.Item(1))
wb.Application.DisplayAlerts = False
  
wks.Range(WScript.Arguments.Item(2)).Copy

Set wks = nothing
Set wb = nothing 

Err.Clear