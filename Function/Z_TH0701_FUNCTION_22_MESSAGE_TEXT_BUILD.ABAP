    CALL TRANSACTION 'MF50' USING bdcdata
                     MODE   p_mode                                        " ��� N(BDC�� �����ϴٰ� ������ ������ �Ѿ��)�̳� A(�ϳ��ϳ� �� �����ִ� ��)�� E��
                     UPDATE 'S'                                        " ������Ʈ �ɼ�: S(���ÿ�)��, A(���ڵ� ������ �����ͺ��̽��� ������Ʈ�� ���߿� �ض�)��, L�̳�
                     MESSAGES INTO messtab.

***********************************************************************
* �����Ͱ� ��� ���ͳ� ���̺� ---> ��� ALV�� �ѷ��� ���ͳ����̺� ������ �̵�.
***********************************************************************
  MOVE-CORRESPONDING wa_tab TO re_wa_tab.

    re_wa_tab-light = c_green.
    LOOP AT messtab[] INTO messtab.
***********************************************************************
* messtab�� Ÿ���� E���.
***********************************************************************
      IF messtab-msgtyp = 'E'.
        re_wa_tab-light = c_red.
***********************************************************************
* MESSAGE_TEXT_BUILD �Լ��� ���ؼ�, ���� �޽����� �޴´�.
***********************************************************************
        CALL FUNCTION 'MESSAGE_TEXT_BUILD'
          EXPORTING
            msgid               = messtab-msgid
            msgnr               = messtab-msgnr
          IMPORTING
            message_text_output = re_wa_tab-text.
        EXIT.
      ENDIF.
    ENDLOOP.