*&---------------------------------------------------------------------*
*& Report  Z_TH0701_OSQL_2_GROUPBY
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
* 20090709�� ������ �¹����� ��Ʃ����� �ο����� ���϶�!

REPORT  Z_TH0701_OSQL_2_GROUPBY.
DATA : result type i.
DATA : it_sflcrew LIKE TABLE OF sflcrew,   "LIKE TABLE OF ������ �̿��Ͽ�, ABAP Dictionary ���̺� ����.
      wo_sflcrew LIKE LINE OF it_sflcrew.  "��������� ���� ��� LIKE�� ����Ͽ�, WorkArea�� ������ �� �� �ִ�.  LIKE LINE OF�� ������ ��� ���ͳ� ���̺��� ������ �� ����.

SELECT COUNT(*) AS pilotcount
  FROM sflcrew
  INTO result "Result ������ �����϶�.
  WHERE FLDATE = '20090709' "FLDATE�� 20090709�� ����
   GROUP BY ROLE "ROLE�� �׷�ȭ �Ͽ�,
  HAVING ROLE = 'STEWARD'. "ROLE�� STEWARD�� ���� ����Ѵ�.
  ENDSELECT.
WRITE : '2009�� 7�� 9�Ͽ� ������ ���� ��Ʃ��𽺴�',result,'���Դϴ�'.
* Group By �Լ��� ��������μ�, �����Լ��� �̿밡���ϴ�.
* �����Լ� 1. COUNT : �ο� ����.
* �����Լ� 2. AVG
* �����Լ� 3. MAX
* �����Լ� 4. MIN
* �����Լ� 5. STDDEV : ����
* �����Լ� 6. SUM

* HAVING ���� WHERE���� ��������.
* ---> WHERE���� FROM���� ���� ���� ���̺��� ���� ������ �Ŵ� ��(����)
* ---> HAVING���� GROUPBY���� ���� ������ �Ŵ°� (���߿�, �����Լ��� �������� ��밡��)