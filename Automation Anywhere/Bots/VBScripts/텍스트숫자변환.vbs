'#####  �ؽ�Ʈ ���� ��ȯ #####

'WScript.Arguments.Item(0)�� ���� AA���� �ѱ�� ������ vFileName�� ���� ������ �����ؼ� �Ұ�� ������ �־ �� ��ġ�� ���� �Է�

'������ü��� = WScript.Arguments.Item(0)
'��Ʈ�� = WScript.Arguments.Item(1)
'��������ȣ = WScript.Arguments.Item(2)

'�ѹ��� �� ������ ���� ���� ---> 2���� �̻��� ���� �ѹ��� �����ϱ�

On Error Resume Next

Dim wb
Dim wks

Set wb = GetObject(WScript.Arguments.Item(0))
Set wks = wb.Worksheets(WScript.Arguments.Item(1))
wb.Application.DisplayAlerts = False

'������ ��� ���ڷ� ��ȯ�ϱ� ------------------------------------------------------------------------
col_name = UCase(WScript.Arguments.Item(2))    
For i = 1 To Len(col_name)
	str_digit = Mid(col_name, i, 1)
	num_temp = Asc(str_digit) - 64
	NumFromXLColumn = NumFromXLColumn + num_temp * 26 ^ (Len(col_name) - i)
Next 		   
ColumnNum = Cint(NumFromXLColumn)
'������ ��� ���ڷ� ��ȯ�ϱ� ------------------------------------------------------------------------

wks.Cells(ColumnNum).EntireColumn.TextToColumns

Set wks = nothing
Set wb = nothing


Err.Clear      '����â �ȶ߰� �ϴ� ��ɾ�  :   ���� �ܰ迡���� �ּ� ó��  /  ������� �ݵ�� �ּ� ����
