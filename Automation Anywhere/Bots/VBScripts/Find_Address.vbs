'==========  Find�� ã�� �˻����� Address ã��(�Ѱ��� ã��)  ================

'WScript.Arguments.Item(0)�� ���� AA���� �ѱ�� ������ vFileName�� ���� ������ �����ؼ� �Ұ�� ������ �־ �� ��ġ�� ���� �Է�

'������ü��� = WScript.Arguments.Item(0)  
'��Ʈ�� = WScript.Arguments.Item(1)
'�˻��� ���� = WScript.Arguments.Item(2)				' Ex) A:A(O)   /  A1:A500(O)  /  A1:Z100(O)    |  A(X)
'�˻��� = WScript.Arguments.Item(3)						
'��ġ�� = WScript.Arguments.Item(4)						' 1 = 100%��ġ  /  2 = �κ���ġ
'ã�� ���� = WScript.Arguments.Item(5)					' 1= ������ �Ʒ�  /  2 = �Ʒ��� ��
'Return ���� ���� = WScript.Arguments.Item(6)			' ����(���� �� ������) / ����(���ڷ� �� ��ȣ�� ����)  / ����(���� �� ��ȣ�� ����) /  �ɼ��� �Է����� ������(E6�� ���� �⺻ ���·� ����)   

'------------------------------------------------------------------------------------------------------------------------------------------------------------
'			1. ���ϰ��  2. ��Ʈ��	 3. ����		4. �˻���		5. ( 1=������ġ, 2=�κ���ġ)  6. ã�¹���(1=�������Ʒ�, 2=�Ʒ�����)  7. Return ���� ����
'�ɼ�1  ex)	 "C:\aa.xlsx"	 "Sheet1"	 "A:A"  "���"  "1"  "1" 
'�ɼ�2  ex)	 "C:\aa.xlsx"	 "Sheet1"	 "A:A"  "���"  "1"  "1" "����"
'------------------------------------------------------------------------------------------------------------------------------------------------------------

'==============================================
'�˻��� ��� = Return �� ���
'==============================================
'�˻��� �ȵ� ��� = "Not Found"�� Return��
'AA���� 
'If "Not Found" �ϰ�      Else�� �б��ؼ� ���
'==============================================

On Error Resume Next

Dim wb
Dim wks

Set wb = GetObject(WScript.Arguments.Item(0))
Set wks = wb.Worksheets(WScript.Arguments.Item(1))
wb.Application.DisplayAlerts = False

Dim FoundCell
Set FoundCell = wks.Range(WScript.Arguments.Item(2)).Find (WScript.Arguments.Item(3),,,WScript.Arguments.Item(4),,WScript.Arguments.Item(5))

If FoundCell Is Nothing Then
   Final_Value = "Not Found"
   ColRow = Final_Value
Else
   Final_Value = FoundCell.Address
   Final_Value_Split = Split(Final_Value,"$")
   vColumn = Final_Value_Split(1)
   vRow = Final_Value_Split(2)
End If

If Final_Value = "Not Found" Then
	ColRow = "Not Found"
Else	'���� / ���� / ���� / �⺻(�ɼǻ���)

		If WScript.Arguments.Item(6) = "����" Then
			ColRow= vColumn

		ElseIf WScript.Arguments.Item(6) = "����" Then
				'���ڿ��� ���ڷ� ��ȯ ---------------------------------------------------------------------------
				col_name = vColumn
				For i = 1 To Len(col_name)
					str_digit = Mid(col_name, i, 1)
					num_temp = Asc(str_digit) - 64
					NumFromXLColumn = NumFromXLColumn + num_temp * 26 ^ (Len(col_name) - i)
				Next 		   

				ColumnNum = Cint(NumFromXLColumn)
				'���ڿ��� ���ڷ� ��ȯ ---------------------------------------------------------------------------
			ColRow= ColumnNum

		ElseIf WScript.Arguments.Item(6) = "����" Then
			ColRow= vRow

		Else
			ColRow = vColumn & vRow

		End if
	
End if

WScript.StdOut.Write (ColRow)  

Set wks = nothing
Set wb = nothing

Err.Clear       '����â �ȶ߰� �ϴ� ��ɾ�  :   ���� �ܰ迡���� �ּ� ó��  /  ������� �ݵ�� �ּ� ����