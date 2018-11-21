************************************************************************
*                                       TOP                                    *
*----------------------------------------------------------------------*
*       CLASS alv_event_handler DEFINITION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS alv_event_handler DEFINITION.
  PUBLIC SECTION.
    METHODS: handle_hotspot_click FOR EVENT hotspot_click OF   "---> �ֽ��� �̺�Ʈ ���� �� cl_gui_alv ���� ���� ����.
                            cl_gui_alv_grid
                            IMPORTING e_column_id
                                               es_row_no.

ENDCLASS.                    "lcl_event_receiver DEFINITION

*----------------------------------------------------------------------*
*       CLASS alv_event_handler IMPLEMENTATION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS alv_event_handler IMPLEMENTATION.
  METHOD: handle_hotspot_click.                                           " ---> Ŭ���� ���� ������ ��ȯ: �ʵ��, �ο��, �ο� ��ȣ
    PERFORM handle_click USING e_column_id                          "--->e_column_id(�ʵ��) �� es_row_no(�ο� ��ȣ) ��� �Ͽ� ���� �Լ� ȣ��.
                                           es_row_no.
  ENDMETHOD.                    "handle_hotspot_click
ENDCLASS.                    "alv_event_handler IMPLEMENTATION
*&---------------------------------------------------------------------*
*&      Form  handle_click
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_COLUMN   text
*      -->PS_ROW_NO  text
*----------------------------------------------------------------------*
FORM handle_click  USING    p_column
                        ps_row_no TYPE lvc_s_roid.
  READ TABLE it_tab INTO wa_tab INDEX ps_row_no-row_id.           "--->��(�� ��ȣ)-��(�ʵ��) ������ �ε����� ȭ�鿡 �ִ� ������ �о��.

  IF p_column = 'MATNR'.                                                       "---> MATNR�� �о��� ���.
    SET PARAMETER ID 'ZTHMATNR' FIELD wa_tab.                        "---> ZTHMATNR �޸𸮿� WA_TAB�� �Ѱ��ָ鼭.
    CALL TRANSACTION 'ZSAPMZSF002_08'.                                "---> Ʈ������� ȣ���Ѵ�.
  ENDIF.

ENDFORM.                    " HANDLE_CLICK

************************************************************************
*                                       F01                                     *
*&---------------------------------------------------------------------*
*&      Module  INIT_SCREEN  OUTPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
....
   CREATE OBJECT alv_event_handler.                            " 5. ��ü ����.
    SET HANDLER alv_event_handler->HANDLE_hotspot_click FOR grid.
.....
