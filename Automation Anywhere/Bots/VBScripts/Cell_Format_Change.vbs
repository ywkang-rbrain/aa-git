'#####  ǥ�� ���� ���� #####

'WScript.Arguments.Item(0)�� ���� AA���� �ѱ�� ������ vFileName�� ���� ������ �����ؼ� �Ұ�� ������ �־ �� ��ġ�� ���� �Է�

'������ü��� = WScript.Arguments.Item(0)
'��Ʈ�� = WScript.Arguments.Item(1)
'���� = WScript.Arguments.Item(2)
'�������� = WScript.Arguments.Item(3)		�Ϲ� / �ؽ�Ʈ / ���� / ȸ�� / �޸�(õ����) / �ۼ�Ʈ / ������1 / ���������
'����������� ��� = WScript.Arguments.Item(4)		'����������� ��� /  ����� ���� ����  Ex) "#,###.00;[Red](#,###.00);0.00"


On Error Resume Next

Dim wb
Dim wks

Set wb = GetObject(WScript.Arguments.Item(0))
Set wks = wb.Worksheets(WScript.Arguments.Item(1))
wb.Application.DisplayAlerts = False			'�˸�â X

If WScript.Arguments.Item(3) = "�Ϲ�" Then 
'	wks.Range(WScript.Arguments.Item(2)).Style = "Normal"					'�Ϲ� �Է� - ���1	
	wks.Range(WScript.Arguments.Item(2)).NumberFormat = "General"		'�Ϲ� �Է� - ���2		
ElseIf WScript.Arguments.Item(3) = "�ؽ�Ʈ" Then 
	wks.Range(WScript.Arguments.Item(2)).NumberFormatLocal = "@"			'�ؽ�Ʈ �Է�
ElseIf WScript.Arguments.Item(3) = "����" Then 
	wks.Range(WScript.Arguments.Item(2)).NumberFormat =  "0"					'����
ElseIf WScript.Arguments.Item(3) = "ȸ��" Then 
	wks.Range(WScript.Arguments.Item(2)).Style = "Currency [0]"						'��ȭ
ElseIf WScript.Arguments.Item(3) = "�޸�" Then 
	wks.Range(WScript.Arguments.Item(2)).Style = "Comma [0]"					'�޸�(õ���� �޸� ���)
ElseIf WScript.Arguments.Item(3) = "�ۼ�Ʈ" Then 
	wks.Range(WScript.Arguments.Item(2)).Style = "Percent"						'�ۼ�Ʈ
ElseIf WScript.Arguments.Item(3) = "������1" Then 
	wks.Range(WScript.Arguments.Item(2)).Style = "������1"						'������1
ElseIf WScript.Arguments.Item(3) = "���������" Then 
	wks.Range(WScript.Arguments.Item(2)).NumberFormat =  WScript.Arguments.Item(4)	'����� ���� ����  Ex) "#,###.00;[Red](#,###.00);0.00"
End If


Set wks = nothing
Set wb = nothing


Err.Clear      '����â �ȶ߰� �ϴ� ��ɾ�  :   ���� �ܰ迡���� �ּ� ó��  /  ������� �ݵ�� �ּ� ����

