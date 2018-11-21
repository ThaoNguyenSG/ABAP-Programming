*&---------------------------------------------------------------------*
*& Report  Z_TH0701_DESCRIBE
*&
*&---------------------------------------------------------------------*
*& Written By: TaeHyeong
*& Reporting Data: `18.11.16
*&---------------------------------------------------------------------*
* MARA ���̺��� ���ڵ� ���μ��� ��ȸ�غ���. USING DESCRIBE TABLE
************************************************************************

REPORT  Z_TH0701_DESCRIBE.

DATA : it_tab TYPE TABLE OF mara ,
      wa_tab LIKE LINE OF it_tab.
DATA : line_count TYPE i.

select *
  from mara into table it_tab.

 DESCRIBE TABLE it_tab LINES line_count.    "���� ���� �����´�.

 FORMAT COLOR  7.
 WRITE :  3(6) '���̺�', 13(10) '���μ�'.

  FORMAT COLOR  3.
  NEW-LINE.
  WRITE : 3(6) 'mara', 10(10) line_count.