'#####  ����� ���� �ٿ��ֱ�  /  ���͵� ���� �ٿ��ֱ� �� ���� ##### 

'������ ���� ��� ������ �־ �ҽ��� ���� Parameter �Է�
'WScript.Arguments.Item(0)�� ���� AA���� �ѱ�� ������ vFileName�� ���� ������ �����ؼ� �Ұ�� ������ �־ �� ��ġ�� ���� �Է�

'������ü��� = WScript.Arguments.Item(0)  
'��Ʈ�� = WScript.Arguments.Item(1)
'���� = WScript.Arguments.Item(2)
'WScript.Arguments.Item(3)        ��ȣ�� �Է�  Ex) 1=����, 2=���, 3=����, 4=�ʷ�, 5=�Ķ�, 6=��� .........  56���� ���� 
'																		 ��Ȯ�� ������ ���ͳݿ� "Interior.ColorIndex"�� �˻��ϸ� ����


On Error Resume Next

Dim wb
Dim wks

Set wb = GetObject(WScript.Arguments.Item(0))
Set wks = wb.Worksheets(WScript.Arguments.Item(1))
wb.Application.DisplayAlerts = False

wks.Range(WScript.Arguments.Item(2)).Interior.ColorIndex = WScript.Arguments.Item(3)

Set wks = nothing
Set wb = nothing

Err.Clear