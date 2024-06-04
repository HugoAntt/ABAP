*&---------------------------------------------------------------------*
*& Report ZHUG_CURSO9
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zhug_curso9.
*** Ini - HUGOANSILVA - TEXTO - 03.06.2024 09:16:12 ***

DATA: ls_header TYPE zcurso_so_header,
      ls_item   TYPE zcurso_so_item.

START-OF-SELECTION.
  BREAK-POINT.

  PERFORM ex1 USING 1.

  NEW-LINE.
  WRITE 'Fim do Programa.'.

FORM ex1 USING ud_soid TYPE int4.

  "Estrutura do cabeçalho do item da ordem de venda.
  DATA: ls_header TYPE zcurso_so_header,
        ls_item   TYPE zcurso_so_item.

  "Limpando e preenchendo a ordem de venda.
  CLEAR ls_header.
  ls_header-sold = ud_soid.
  ls_header-erdat = sy-datum.
  ls_header-erzet = sy-uzeit.
  ls_header-ernam = sy-uname.

  "Preenchendo o item específico
  CLEAR ls_item.
  ls_item-soid = ud_soid.
  ls_item-posnr = 1.
  ls_item-matnr = '10'.
  ls_item-menge = 2.
  ls_item-price_un = '1.99'.

  INSERT zcurso_so_header FROM ls_header.
  IF sy-subrc = 0.
    IF ls_item-menge > 0.
      INSERT zcurso_so_item FROM ls_item.
    ELSE.
      WRITE |O Item ( ls_item-posnr ) tem quantidade menor ou igual a zero|.
    ENDIF.
  ENDIF.
ENDFORM.

"Form 2.




*** Fim - HUGOANSILVA ***