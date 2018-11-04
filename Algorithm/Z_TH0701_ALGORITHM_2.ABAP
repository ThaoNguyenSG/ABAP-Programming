*&---------------------------------------------------------------------*
*& Report  Z_TH0701_ALGORITHM_2
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*************
*Scenario 1. ����� �������̸�, �����ϰ� �ִ� ������ ZTHSOCCCER�� ����Ǿ� �ִ�.
*         2. ���⿡ �ٸ� �������� ������ ��ȹ�� ���� '���̸���'�� �ִ�.
*         3. ���⿡ ����� ���ܿ� �����ִ� �����鿡�� �����ؾ��� ������ �� �հ�� ���ΰ�?
*            ��, ���� �����ͺ��̽����� '���̸���'������ ������ ������ �̷������ �ʰ� �ִ� ��Ȳ�̴�.
************************************************************************************
REPORT  Z_TH0701_ALGORITHM_2.

DATA : it_zthsoccer type TABLE OF zthsoccer,
      wo_zthsoccer LIKE LINE OF it_zthsoccer,
      sum_salary type p.

SELECT *
  FROM zthsoccer
  INTO TABLE it_zthsoccer
  where name <> '���̸���'.

LOOP AT it_zthsoccer into wo_zthsoccer.
sum_salary = sum_salary + wo_zthsoccer-salary.
ENDLOOP.

write : sum_salary.