'#####  ���ప ã�Ƽ� �� �����ϱ� ##### 

' ������ ���� ��� ������ �־ �ҽ��� ���� Parameter �Է�
'WScript.Arguments.Item(0)�� ���� AA���� �ѱ�� ������ vFileName�� ���� ������ �����ؼ� �Ұ�� ������ �־ �� ��ġ�� ���� �Է�


'������ü��� = WScript.Arguments.Item(0)  
'��Ʈ�� = WScript.Arguments.Item(1)
'������ ã�� ��  = WScript.Arguments.Item(2)      ex) A, B, C, D ......  

On Error Resume Next

Dim wb
Dim wks
Dim EndRow

Set wb = GetObject(WScript.Arguments.Item(0))
Set wks = wb.Worksheets(WScript.Arguments.Item(1))
wb.Application.DisplayAlerts = False

EndRow = wks.Range(WScript.Arguments.Item(2) & wks.Rows.Count).End(-4162).Row   'xlUp = -4162   /   xlDown = -4121

If EndRow = 1 Then
	If Trim(wks.Range(WScript.Arguments.Item(2) & 1).Value) = "" Then
		EndRow = 0
	Else
		EndRow = 1
	End if
End if

WScript.StdOut.Write (EndRow)  'ã�� EndRow�� Return

Set wks = nothing
Set wb = nothing

Err.Clear       '����â �ȶ߰� �ϴ� ��ɾ�  :   ���� �ܰ迡���� �ּ� ó��  /  ������� �ݵ�� �ּ� ����