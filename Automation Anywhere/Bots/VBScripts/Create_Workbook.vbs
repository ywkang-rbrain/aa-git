'#####  Create_Workbook  #####

'WScript.Arguments.Item(0)�� ���� AA���� �ѱ�� ������ vFileName�� ���� ������ �����ؼ� �Ұ�� ������ �־ �� ��ġ�� ���� �Է�

'WScript.Arguments.Item(0)					������ü���
'WScript.Arguments.Item(1)					Ȯ����

On Error Resume Next

Dim App
Dim wb
Dim wks
Dim FileFormat

Set App = CreateObject("Excel.Application") 
App.Application.DisplayAlerts = False			'�˸�â X

Set wb = App.Workbooks.Add

If WScript.Arguments.Item(1) = "xlsb" Then
	FileFormat = "50"
ElseIf WScript.Arguments.Item(1) = "xlsx" Then
	FileFormat = "51"
ElseIf WScript.Arguments.Item(1) = "xlsm" Then
	FileFormat = "52"
ElseIf WScript.Arguments.Item(1) = "xls" Then
	FileFormat = "56"
End If

wb.SaveAs WScript.Arguments.Item(0) , FileFormat
wb.Close

Set App = nothing
Set wb = nothing

Err.Clear      '����â �ȶ߰� �ϴ� ��ɾ�  :   ���� �ܰ迡���� �ּ� ó��  /  ������� �ݵ�� �ּ� ����


'50 = xlExcel12 (Excel Binary Workbook in 2007-2016 with or without macro's, xlsb)
'51 = xlOpenXMLWorkbook (without macro's in 2007-2016, xlsx)
'52 = xlOpenXMLWorkbookMacroEnabled (with or without macro's in 2007-2016, xlsm)
'56 = xlExcel8 (97-2003 format in Excel 2007-2016, xls)