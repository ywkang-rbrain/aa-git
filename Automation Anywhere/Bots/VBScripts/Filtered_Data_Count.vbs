'#####  ���͵� ��� ���ϱ� / �హ�� ���� ##### 
' ������ ���� ��� ������ �־ �ҽ��� ���� Parameter �Է�
'WScript.Arguments.Item(0)�� ���� AA���� �ѱ�� ������ vFileName�� ���� ������ �����ؼ� �Ұ�� ������ �־ �� ��ġ�� ���� �Է�


'������ü��� = WScript.Arguments.Item(0)  
'��Ʈ�� = WScript.Arguments.Item(1)

'######################################################################################
'�ݵ�� �����Ͱ� ����ִ� �ѿ��� ����   /   ex)A2:J50(X) A~J���� ��� ����� ���ļ� ����Ͽ� ��� �ȸ���
'######################################################################################
'��ü ����  = WScript.Arguments.Item(2)  ex) A2:A10  /  B2:B50   /  C2:C60  

On Error Resume Next


Dim wb
Dim wks
Dim Filtered_Data_Count

Set wb = GetObject(WScript.Arguments.Item(0))
Set wks = wb.Worksheets(WScript.Arguments.Item(1))
wb.Application.DisplayAlerts = False

Filtered_Data_Count = wks.Range(WScript.Arguments.Item(2)).SpecialCells(12).Count

If Filtered_Data_Count = "" then
	Filtered_Data_Count = 0
end if

WScript.StdOut.Write (Filtered_Data_Count)  'ã�� Filtered_Data_Count�� Return

Set wks = nothing
Set wb = nothing


Err.Clear  