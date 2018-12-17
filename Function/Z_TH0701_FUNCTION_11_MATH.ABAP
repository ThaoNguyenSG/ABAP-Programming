*&---------------------------------------------------------------------*
*& Report  Z_TH0701_MATH
*&
*&---------------------------------------------------------------------*
*& Written By TaeHyeong
*& Reporting Date: `18.12.04
*& Updating Date: `18.12.05
*& Subject: Round, Ceil, Floor
*&---------------------------------------------------------------------*

REPORT  Z_TH0701_MATH.
DATA : num1 TYPE p DECIMALS 2 VALUE '10.23',
      result TYPE p DECIMALS 2,
      num2 TYPE p VALUE 100.
*result = num1 ** num2.
CALL FUNCTION 'FIMA_NUMERICAL_VALUE_ROUND'
 EXPORTING  I_RTYPE = '+'             " �ݿø� ' ' ,�ø� '+' , ���� '-' ����
I_RUNIT = '0.1'                             " ������ ������� ����ڸ����� �ݿ��ϰڴ���? 0.1 ---> �Ҽ� �� °�ڸ� ���� �������� �Ǵ��Ѵ�.
I_VALUE = num1
IMPORTING E_VALUE_RND = result.

write : / '�ݿø�, �ø�, ���� ó������Դϴ�.', result.
result = sqrt( num2 ).                    " ������ �Լ�
write : / '������ ó�� ����Դϴ�.', result.
result = result ** result.                  " ���� �Լ�
write : / '���� ó�� ����Դϴ�.', result.