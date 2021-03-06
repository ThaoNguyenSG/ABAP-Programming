*&---------------------------------------------------------------------*
*& Include ZPPR0010_08_TOP                                   Report ZPPR0010_08
*&
*&---------------------------------------------------------------------*
************************************************************************
* Title: 생산 계획 및 생산 마스터 관리
************************************************************************
* DATE          AUTHOR                  DESCRIPTION
************************************************************************
* 2018.12.28    TaeHyeong               Create Radio Button in Report
************************************************************************
REPORT   ZPPR0010_08.

SELECTION-SCREEN BEGIN OF BLOCK block1.
*************************************************************************
* TH 그룹에 라디오 버튼을 2개 생성한다.
*************************************************************************
PARAMETERS : Test1 RADIOBUTTON GROUP TH.
PARAMETERS : Test2 RADIOBUTTON GROUP TH.
SELECTION-SCREEN END OF BLOCK block1.


START-OF-SELECTION.

IF Test1 = 'X'.
*************************************************************************
* Case1: 첫 번째 라디오버튼 클릭 후 실행한다면.
*************************************************************************
    WRITE:/ 'TaeHyeong test1 Button Click'.
  ELSEIF Test2 = 'X'.
*************************************************************************
* Case2: 두 번째 라디오버튼 클릭 후 실행한다면.
*************************************************************************
    WRITE:/ 'TaeHyeong test2 Button Click'.

  ENDIF.
