*&---------------------------------------------------------------------*
*& Include          ZPRNOTAS_TOP
*&---------------------------------------------------------------------*



DATA: lo_alv              TYPE REF TO cl_salv_table,
      lex_message         TYPE REF TO cx_salv_msg,
      lo_layout_settings  TYPE REF TO cl_salv_layout,
      lo_layout_key       TYPE        salv_s_layout_key,
      lo_columns          TYPE REF TO cl_salv_columns_table,
      lo_column           TYPE REF TO cl_salv_column,
      lex_not_found       TYPE REF TO cx_salv_not_found,
      lo_functions        TYPE REF TO cl_salv_functions_list,
      lo_display_settings TYPE REF TO cl_salv_display_settings.

DATA: lt_prob              TYPE TABLE OF ty_prob,
      ls_prob              TYPE ty_prob,
      lv_current_discplina TYPE znotass-disciplina,
      l_index              TYPE sy-tabix.

"Mensagem Teste
DATA cont TYPE float.