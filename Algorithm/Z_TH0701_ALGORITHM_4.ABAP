*&---------------------------------------------------------------------*
*& Report  Z_TH0701_GCDLCM
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
*************************************************************************
*Scenario 1. ����ڷκ��� 2���� ���ڸ� �Է¹޴´�.
*         2. 2���� ���ڿ� ���� �ִ�����(GCD) �� �ּҰ����(LCM)�� ����Ѵ�.
*
*
*************************************************************************
REPORT  z_th0701_gcdlcm.

PARAMETERS : num1 TYPE i,
             num2 TYPE i.

DATA : gcd TYPE i VALUE 1,
      lcm TYPE i VALUE 1,
      number TYPE i,
      iden1 TYPE i,
      iden2 TYPE i.

IF num1 >= num2.
  gcd = num2.
ELSE.
  gcd = num1.
ENDIF.

DO.
  iden1 = num1 MOD gcd.
  iden2 = num2 MOD gcd.
  IF iden1 = 0 AND iden2 = 0.
    EXIT.
  ELSE.
    gcd = gcd - 1.
  ENDIF.
ENDDO.
*****************************************************************************
IF num1 >= num2.
  lcm = num1.
ELSE.
  lcm = num2.
ENDIF.

DO.
  iden1 = lcm MOD num1.
  iden2 = lcm MOD num2.
  IF iden1 = 0 AND iden2 = 0.
    EXIT.
  ELSE.
    lcm = lcm + 1.
  ENDIF.
ENDDO.


WRITE : / '�ִ�������', gcd,'�̸�, �ּҰ������ ', lcm, '�Դϴ�.'.