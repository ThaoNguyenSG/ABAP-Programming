*&---------------------------------------------------------------------*
*& Report  Z_TH0701_OOP_3_CONSTRUCTOR
*&
*&---------------------------------------------------------------------*
*& �˰Ե� ��� 1. constructor�� �Ű� �Ķ���ʹ� create object ��ü(�Ķ����1, �Ķ����2)�� �־��ش�. CALL METHOD�� �ƴϾ�. CREATE�� ������ �Ǳ� ������.
*&          2. constructor�� �ִ� superclass�� ��ӹް� �Ǹ� �ݵ�� superclass�� constructor�� ȣ�����־�� �Ѵ�.
*&
*&
*&---------------------------------------------------------------------*

REPORT  z_th0701_oop_3_constructor.
DATA: total_mineral TYPE i,
      total_gas TYPE i.
*----------------------------------------------------------------------*
*       CLASS starport DEFINITION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS starport DEFINITION.
  PUBLIC SECTION.
    METHODS : constructor IMPORTING mineral TYPE i gas TYPE i,
      display_write.
ENDCLASS.                    "starport DEFINITION

*----------------------------------------------------------------------*
*       CLASS starport IMPLEMENTATION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS starport IMPLEMENTATION.
  METHOD constructor.
    total_mineral = mineral.
    total_gas = gas.
  ENDMETHOD.                    "constructor
  METHOD display_write.
    WRITE : / '��Ÿ��Ʈ�� �̳׶�: ', total_mineral,'��,', total_gas, '�� ������ϴ�.'.
  ENDMETHOD.                    "display_write
ENDCLASS.                "starport IMPLEMENTATION
*----------------------------------------------------------------------*
*       CLASS starportaddon DEFINITION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS starportaddon DEFINITION INHERITING FROM starport.
  PUBLIC SECTION.
    METHODS constructor IMPORTING mineral TYPE i gas TYPE i.
ENDCLASS.                    "starportaddon DEFINITION

*----------------------------------------------------------------------*
*       CLASS starportaddon IMPLEMENTATION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS starportaddon IMPLEMENTATION.
  METHOD constructor.
    CALL METHOD super->constructor
      EXPORTING
        mineral = 150
        gas     = 100.
    total_mineral = total_mineral + mineral.
    total_gas = total_gas + gas.
    WRITE : / '��Ÿ��Ʈ ������� �� �̳׶�: ', total_mineral,'��,', total_gas, '�� ������ϴ�.'.
  ENDMETHOD.                    "constructor
ENDCLASS.                    "starportaddon IMPLEMENTATION




DATA : obj1 TYPE REF TO starport,
      obj2 TYPE REF TO starportaddon.

START-OF-SELECTION.

  CREATE OBJECT obj1
    EXPORTING
      mineral = 150
      gas     = 100.
  CALL METHOD obj1->display_write.
  CREATE OBJECT obj2
    EXPORTING
      mineral = 50
      gas     = 50.