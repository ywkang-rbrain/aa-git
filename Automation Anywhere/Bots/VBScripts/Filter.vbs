' ##############  �����ϱ�  ##############


' WScript.Arguments.Item(0)             '���ϸ�
' WScript.Arguments.Item(1)			  '��Ʈ�� 
' WScript.Arguments.Item(2)		      '������ ����ȣ (A=1, B=2, C=3, D=4 ..........) 
' WScript.Arguments.Item(3)			  '������ �ܾ�     /   ������(WScript.Arguments.Item(4))�� �о �����Ͽ� ����  /  Ex) A1,A3,A5 == 3�� �ܾ� ����
' WScript.Arguments.Item(4)			  '���ͱ����� : ����ڰ� ����     /    1������ ������ �ܾ 2�� �̻��϶� �����ϴ� ������  Ex) ��,��,��

Dim Input_Tye
Dim ColumnNum
Dim wb
Dim wks

'�������� �������� �����ϱ� ------------------------------------------------------------------------
If IsNumeric(WScript.Arguments.Item(2)) Then
    Input_Tye = "Numeric"
	ColumnNum = Cint(WScript.Arguments.Item(2))
Else
    Input_Tye = "String"

End If

'������ ��� ���ڷ� ��ȯ�ϱ� ------------------------------------------------------------------------
If Input_Tye = "String" Then

			Dim i
			Dim len_col
			Dim num_temp
			Dim str_digit 

			col_name = UCase(WScript.Arguments.Item(2))    
			For i = 1 To Len(col_name)
				str_digit = Mid(col_name, i, 1)
				num_temp = Asc(str_digit) - 64
				NumFromXLColumn = NumFromXLColumn + num_temp * 26 ^ (Len(col_name) - i)
			Next 		   

			ColumnNum = Cint(NumFromXLColumn)

End If


'�����ϱ� ------------------------------------------------------------------------------------------------
Set wb = GetObject(WScript.Arguments.Item(0))
Set wks = wb.Worksheets(WScript.Arguments.Item(1))
ArgCnt = WScript.arguments.count  '�Ѱ� �� ī��Ʈ �� 


if ArgCnt = "5" then '�� �ܾ ������ ���
	wks.Range("A1").AutoFilter ColumnNum, Split(WScript.Arguments.Item(3), WScript.Arguments.Item(4)), 1  '1���� <> ������������  /  * ���� ���� ����

elseif ArgCnt = "6" then ' ���� �ܾ�� ������ ���
	wks.Range("A1").AutoFilter ColumnNum, Split(WScript.Arguments.Item(3), WScript.Arguments.Item(4)), 7  '7���� ��Ƽ ���� ���� / �Ѵܾ� ���͵� ����

else '�ɼ��� �߸� ������ ��� - ����â 10�� ���ȸ�
	Dim WSH
	Set WSH = CreateObject("WScript.Shell") 
	WSH.Popup "�ɼ� ������ �߸��Ǿ����ϴ�."  & Chr(10) & Chr(13) & "AA���� ���� �ɼ��� �ٽ� �ѹ� Ȯ���ϼ���."  & Chr(10) & Chr(13) & Chr(10) & Chr(13) & "10 �� �� �ڵ����� �����ϴ�", 10, "�ɼ� ���� ����", vbInformation 
	Set WSH = Nothing

end if


Set wks = Nothing
Set wb = Nothing 

Err.Clear 


'xlAnd                         1           And
'xlOr                           2           Or
'xlBottom10Items         4           ���� 10��
'xlBottom10Percent      6           ���� 10%
'xlFilterCellColor          8            �� ����
'xlFilterDynamic          11            ���̳���
'xlFilterFontColor        9             ��Ʈ ��
'xlFilterIcon                10            ������
'xlFilterValues             7             ��
'xlTop10Items             3             ���� 10��
'xlTop10Percent         5             ���� 10%