'#####  ����� ���� �ٿ��ֱ� #####

'WScript.Arguments(0)�� ���� AA���� �ѱ�� ������ vFileName�� ���� ������ �����ؼ� �Ұ�� ������ �־ �� ��ġ�� ���� �Է�

'������ü��� = WScript.Arguments(0)
'��Ʈ�� = WScript.Arguments(1)
'������� = WScript.Arguments(2)
'v������ =   WScript.Arguments(3)
'vOption = WScript.Arguments(4)

On Error Resume Next

Dim wb
Dim wks
Dim vRange
Dim vOption    

Set wb = GetObject(WScript.Arguments(0))
Set wks = wb.Worksheets(WScript.Arguments(1))
wb.Application.DisplayAlerts = False
vRange = WScript.Arguments(2) 
vOption = WScript.Arguments(3)

'WScript.Sleep (1000)	'�������� 1�� Sleep

	'�������� +  Ctrl+V		/   ��������												  / �׵θ� : O   /  �� : O
	IF vOption = "��������_��ü" Then
		wks.Range(vRange).PasteSpecial 1

	'�������� + �����ٿ��ֱ�		/ 	�������� 					    			  / �׵θ� : X   /  �� : X
	ElseIF vOption = "��������_����" Then
		wks.Range(vRange).PasteSpecial 12

	'�ٸ����� +  Ctrl+V		/   ��������												  / �׵θ� : O   /  �� : O
	ElseIF vOption = "�ٸ�����_��ü" Then
		wks.Range(vRange).PasteSpecial 8	

	'�ٸ����� +  �����ٿ��ֱ�    /   ��������  + â��							  / �׵θ� : O   /  �� : O    + (â��+ â��+ â��+ â��+ â��+ â��)  -->  â�� �ٽ� ���� �������� ó��
	ElseIF vOption = "�ٸ�����_����" Then
		wks.Range(vRange).PasteSpecial -4163

	'���� �̿��� ��� ���    /   ���� ���� 											  / �׵θ� : X   /  �� : X
	Else
		wks.Range(vRange).PasteSpecial 12

	End If 	

Set wks = nothing
Set wb = nothing

Err.Clear