'#####  �� �ʺ� ����  #####

'WScript.Arguments.Item(0)�� ���� AA���� �ѱ�� ������ vFileName�� ���� ������ �����ؼ� �Ұ�� ������ �־ �� ��ġ�� ���� �Է�

'������ü��� = WScript.Arguments.Item(0)
'��Ʈ�� = WScript.Arguments.Item(1)
'�� = WScript.Arguments.Item(2)						ex) A,  A:C 
'����/�ڵ� = WScript.Arguments.Item(3)
'�����ϰ�� = WScript.Arguments.Item(4)				' ���ʺ� ��

On Error Resume Next

Dim wb
Dim wks

Set wb = GetObject(WScript.Arguments.Item(0))
Set wks = wb.Worksheets(WScript.Arguments.Item(1))
wb.Application.DisplayAlerts = False

If WScript.Arguments.Item(3) = "����" Then
	wks.Columns(WScript.Arguments.Item(2)).ColumnWidth = WScript.Arguments.Item(4)
ElseIf WScript.Arguments.Item(3) = "�ڵ�" Then
	wks.Columns(WScript.Arguments.Item(2)).Autofit
End if


Set wks = nothing
Set wb = nothing

Err.Clear       '����â �ȶ߰� �ϴ� ��ɾ�  :   ���� �ܰ迡���� �ּ� ó��  /  ������� �ݵ�� �ּ� ����