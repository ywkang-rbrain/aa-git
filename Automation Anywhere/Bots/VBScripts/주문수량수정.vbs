'##### �ֹ� ���� ����  #####

'WScript.Arguments.Item(0)					���ش���
'WScript.Arguments.Item(1)					���ּ���
'WScript.Arguments.Item(2)					�ݿø��� %   -->   ex) 20, 30 �ݵ�� ���ڸ� �Է� 

'ex)
'�ֹ����ɴ��� ��� ���ּ��� 30% �̸� (1~29%����)�� ��� 0, �̻��� ��� �ֹ����ɴ����� ����
'�ֹ����� 40, (���ּ��� 10 -> 0 / ���ּ��� 20 -> 40)


'remainder
On Error Resume Next

Dim vBaseUnit					'���ش���
Dim vOrderQuantity			'���ּ���
Dim vRoundOffPercent		'�ݿø� ���� %
Dim vShare 
Dim vResultValue 
Dim vPercent 
Dim vDivision 
Dim vRemainder 


vBaseUnit = Cint(WScript.Arguments.Item(0))
vOrderQuantity = Cint(WScript.Arguments.Item(1))
vRoundOffPercent = Cint((WScript.Arguments.Item(2)))
vRoundOffPercent = CSng(vRoundOffPercent/100)

vDivision = (vOrderQuantity / vBaseUnit)             '������
vShare = Fix(vOrderQuantity / vBaseUnit)            '��
vRemainder = vBaseUnit Mod vOrderQuantity      '������
vPercent = vDivision - vShare                          '���� ������ �������� %

	If vPercent >= vRoundOffPercent Then
        vResultValue = (vShare * vBaseUnit) + vBaseUnit
    Else
        vResultValue = (vShare * vBaseUnit)
    End If

WScript.StdOut.Write (vResultValue)  'vResultValue Return


Err.Clear      '����â �ȶ߰� �ϴ� ��ɾ�  :   ���� �ܰ迡���� �ּ� ó��  /  ������� �ݵ�� �ּ� ����