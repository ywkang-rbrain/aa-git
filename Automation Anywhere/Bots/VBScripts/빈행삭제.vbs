'#####�� �� ���� #####

'WScript.Arguments.Item(0)�� ���� AA���� �ѱ�� ������ vFileName�� ���� ������ �����ؼ� �Ұ�� ������ �־ �� ��ġ�� ���� �Է�

'������ü��� = WScript.Arguments.Item(0)
'��Ʈ�� = WScript.Arguments.Item(1)
'�˻��� �� = WScript.Arguments.Item(2)		�˻��� ��  ���ڷ� Ex) A=1, B=2, C=3................ 
'������ = WScript.Arguments.Item(3)	    	���ڸ� �Է�
'�������� = WScript.Arguments.Item(4)		���ڸ� �Է�

'Ex) "C:\aaa.xlsx" "Sheet1" "A" "2" "200"

On Error Resume Next

Dim wb
Dim wks
Dim i
Dim j
Dim ColumnNum
Dim StartRow
Dim EndRow 
Dim vColumn

Set wb = GetObject(WScript.Arguments.Item(0))
Set wks = wb.Worksheets(WScript.Arguments.Item(1))

'������ ��� ���ڷ� ��ȯ�ϱ� ------------------------------------------------------------------------
col_name = UCase(WScript.Arguments.Item(2))    
For i = 1 To Len(col_name)
	str_digit = Mid(col_name, i, 1)
	num_temp = Asc(str_digit) - 64
	NumFromXLColumn = NumFromXLColumn + num_temp * 26 ^ (Len(col_name) - i)
Next 		   
ColumnNum = Cint(NumFromXLColumn)
'������ ��� ���ڷ� ��ȯ�ϱ� ------------------------------------------------------------------------

StartRow = Cint(WScript.Arguments.Item(3))    
EndRow = Cint(WScript.Arguments.Item(4))       

j=1
For i = StartRow to EndRow          
  
  If Trim(wks.Cells(i, ColumnNum).Value) = "" And j <> EndRow Then            
		wks.Rows(i).Delete
		i = i-1         
  ElseIf  EndRow = j Then
		If Trim(wks.Cells(i, ColumnNum).Value) = "" Then
			wks.Rows(i).Delete
		End If
		Exit For	
  End If
  j = j + 1

Next 

Err.Clear      '����â �ȶ߰� �ϴ� ��ɾ�  :   ���� �ܰ迡���� �ּ� ó��  /  ������� �ݵ�� �ּ� ����


