*----------------------------------------------------------------------*
*       CLASS alv_event_handler DEFINITION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS alv_event_handler DEFINITION.                                      "1. �̺�Ʈ Ŭ���� ����.
  PUBLIC SECTION.
    METHODS on_double_click FOR EVENT double_click OF cl_gui_alv_grid    "2. �̺�Ʈ ���� ����.
    IMPORTING e_column
      es_row_no.
ENDCLASS.                    "alv_event_handler DEFINITION
*----------------------------------------------------------------------*
*       CLASS alv_event_handler IMPLEMENTATION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS alv_event_handler IMPLEMENTATION.                                   "3. �̺�Ʈ ���� ����.
METHOD on_double_click.
  DATA lv_message TYPE string.
  DATA w_write(160) TYPE C.
  LOOP AT it_tab INTO wa_tab.
    if sy-tabix = es_row_no-row_id.
      w_write = 'Ŭ���� ��:'.
      W_write+6(10) = es_row_no-row_id.
      w_write+130(25) = '������� �̸�:'.
      w_write+143(10) = wa_tab-uname.
*      CONCATENATE / wa_tab-uname
      ENDIF.
  ENDLOOP.
  lv_message = es_row_no-row_id.
*  CONCATENATE  'Ŭ���� ��:' lv_message '������� �̸�:' w_write INTO lv_message.
*
  MESSAGE w_write TYPE 'I'.

ENDMETHOD.                    "alv_event_handler

ENDCLASS.                    "alv_event_handler IMPLEMENTATION

*----------------------------------------------------------------------*
*  MODULE INIT_SCREEN OUTPUT
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
MODULE init_screen OUTPUT.
DATA : alv_event_handler TYPE REF TO alv_event_handler.       "4. �̺�Ʈ Ŭ���� ������ ����.
  CREATE OBJECT container
    EXPORTING
      container_name = 'THCONT1'.
  CREATE OBJECT grid
    EXPORTING
      i_parent = container.
  CREATE OBJECT alv_event_handler.                            " 5. ��ü ����.
    SET HANDLER alv_event_handler->on_double_click FOR grid.  " 6. ON_DOUBLE_CLICK �������� ���: ���⿡�� ���� ���� ����.

  PERFORM set_grid_layo CHANGING ls_layo.
  PERFORM set_grid_fcat CHANGING lt_fcat.
  CALL METHOD grid->set_table_for_first_display
  EXPORTING
    is_layout = ls_layo
    CHANGING
      it_fieldcatalog = lt_fcat
      it_outtab       = it_tab.

ENDMODULE.                 " INIT_SCREEN  OUTPUT