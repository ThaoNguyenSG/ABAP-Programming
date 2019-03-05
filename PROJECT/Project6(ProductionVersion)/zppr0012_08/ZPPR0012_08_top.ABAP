*&---------------------------------------------------------------------*
*& Include ZPPR0012_08_TOP                                   Report ZPPR0012_08
*&
*&---------------------------------------------------------------------*

REPORT   ZPPR0012_08.
TABLES MARA.
TABLES mkal.
DATA : BEGIN OF gs_tab,
      c_light TYPE icon-id,
       MATNR TYPE MARA-MATNR,
      WERKS TYPE WERKS_D,
      VERID TYPE mkal-verid,
END OF gs_tab.
DATA P_MODE TYPE C.

************************************************************************
*  ALV�� ���Ǵ� ��ȣ�� / �� // ��  // ��.
************************************************************************
CONSTANTS: c_green TYPE icon-id VALUE '@08@',
c_yellow TYPE icon-id VALUE '@09@',
c_red TYPE icon-id VALUE '@0A@'.

************************************************************************
* ���� ���ͳ� ���̺�
************************************************************************
DATA : it_tab Like TABLE OF gs_tab,
      wa_tab LIKE LINE OF it_tab.
************************************************************************
* ALV �⺻ ���ø�.
************************************************************************
DATA : container TYPE REF TO cl_gui_custom_container,            "�����̳� ����. ---> cl_gui_custom_container Ŭ���� ����.
       grid TYPE REF TO cl_gui_alv_grid,                         "�׸��� ����.  ---> cl_gui_alv_grid Ŭ���� ����.
       ok_code TYPE sy-ucomm.                                     "Ŭ�� ���� ����.
DATA: ls_layo TYPE lvc_s_layo,
     lt_fcat TYPE lvc_t_fcat.

************************************************************************
* ALV �n�� �Ǻ�!
************************************************************************
DATA : ch_num TYPE i.
************************************************************************
*  ��Ƽ�� ����Ʈ �ο� ��.
************************************************************************
DATA: INDEX_ROWS TYPE LVC_T_ROW,
      index_id TYPE  LVC_T_ROID ,
INDEX LIKE LINE OF INDEX_ROWS.
************************************************************************
*  �����ϱ� ���� CBO ���ͳ� ���̺� / Work Area.
************************************************************************
DATA : it_result TYPE TABLE OF ZPPT0012_08,
      wa_result LIKE LINE OF it_result.
*----------------------------------------------------------------------*
*   data definition
*----------------------------------------------------------------------*
*       Batchinputdata of single transaction
DATA:   BDCDATA LIKE BDCDATA    OCCURS 0 WITH HEADER LINE.
*       messages of call transaction
DATA:   MESSTAB LIKE BDCMSGCOLL OCCURS 0 WITH HEADER LINE.
*       error session opened (' ' or 'X')
DATA:   E_GROUP_OPENED.
*       message texts
TABLES: T100.
*----------------------------------------------------------------------*
*        Start new screen                                              *
*----------------------------------------------------------------------*
FORM BDC_DYNPRO USING PROGRAM DYNPRO.
  CLEAR BDCDATA.
  BDCDATA-PROGRAM  = PROGRAM.
  BDCDATA-DYNPRO   = DYNPRO.
  BDCDATA-DYNBEGIN = 'X'.
  APPEND BDCDATA.
ENDFORM.

*----------------------------------------------------------------------*
*        Insert field                                                  *
*----------------------------------------------------------------------*
FORM BDC_FIELD USING FNAM FVAL.
*  IF FVAL <> NODATA.
    CLEAR BDCDATA.
    BDCDATA-FNAM = FNAM.
    BDCDATA-FVAL = FVAL.
    APPEND BDCDATA.
*  ENDIF.
ENDFORM.

************************************************************************
* selection-options
************************************************************************
SELECT-OPTIONS: S_MATNR FOR MARA-MATNR.
PARAMETERS : S_werks TYPE mapl-werks DEFAULT 1200.
*************************************************************************
* ALL, (Routing) check, NOT CHECK  ���� ��ư ���.
*************************************************************************
SELECTION-SCREEN BEGIN OF LINE.
PARAMETERS : radio1 RADIOBUTTON GROUP TH.
SELECTION-SCREEN COMMENT 3(10) text-001 FOR FIELD radio1.
PARAMETERS : radio2 RADIOBUTTON GROUP TH.
SELECTION-SCREEN COMMENT 16(10) text-002 FOR FIELD radio2.
PARAMETERS : radio3 RADIOBUTTON GROUP TH.
SELECTION-SCREEN COMMENT 29(10) text-003 FOR FIELD radio3.
SELECTION-SCREEN END OF LINE.

----------------------------------------------------------------------------------
Extracted by Direct Download Enterprise version 1.3.1 - E.G.Mellodew. 1998-2005 UK. Sap Release 701