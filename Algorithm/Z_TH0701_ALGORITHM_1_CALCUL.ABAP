*&---------------------------------------------------------------------*
*& Report  Z_TH0701_ALGORITHM_1_CALCUL
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  Z_TH0701_ALGORITHM_1_CALCUL.
TYPES title(30) type c.
DATA test TYPE title.
PARAMETERS : num1 type P,
             num2 TYPE P,
*            num1, num2 --->������ PARAMETERS�� �̿��Ͽ�, ��� ����.
             operator type c. "operator ---> ��������� �Է��� ���� ����

DATA result type P DECIMALS 2.
* ��� ����� �ޱ� ���� ���� ���� ---> DECIMAL�� �̿���, �Ҽ��� �ڸ��� ��� ���� ����.

test = '��Ģ���� ����'.
write : test.

PERFORM calcul using num1 num2 changing result."PERFORM ������ �̿���, ���� �����ƾ ȣ��.
WRITE : result.
*&---------------------------------------------------------------------*
*&      Form  CALCUL
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
* CALCUL �����ƾ ���� ����.
form CALCUL using n1 type p
                  n2 type P
*                 n1, n2�� �Ű������� �޾ƿ���.
      changing n3 type P.
*                 n3 ��� OUTPUT ���� �����ϱ�.
* USING�� CHANGING�� ����.
if operator = '+'.
   n3 = n1 + n2.
* ���ϱ� ��� ����.

ELSEIF operator = '-'.
  n3 = n1 - n2.
* ���� ��� ����.
elseif operator = '*'.
    n3 = n1 * n2.
* ���ϱ� ��� ����.
elseif operator = '/'.
  n3 = n1 / n2.
* ������ ��� ����.
ELSE.
  write : '��� ������ �ش����� �ʴ� �����Դϴ�.'.
ENDIF.
endform.