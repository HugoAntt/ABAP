*&---------------------------------------------------------------------*
*& Report ZHUG_CURSO10
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zhug_curso10.
*** Ini - HUGOANSILVA - TEXTO - 04.06.2024 08:39:13 ***

*DATA lt_kunnr_r TYPE RANGE OF kunnr.
DATA ld_kunnr TYPE kunnr.

SELECTION-SCREEN BEGIN OF BLOCK b1.
  "Criação do Range
  SELECT-OPTIONS s_kunnr FOR ld_kunnr.
SELECTION-SCREEN END OF BLOCK b1.

"===============================================================
"Range com Select

DATA: ld_matnr TYPE zcurso_so_item-matnr,
      ld_price TYPE zcurso_so_item-price_un.

SELECTION-SCREEN BEGIN OF BLOCK b1.
  SELECT-OPTIONS s_matnr FOR ld_matnr.
  SELECT-OPTIONS s_price FOR ld_price.
SELECTION-SCREEN END OF BLOCK b1.

START-OF-SELECTION.
  DATA lt_item  TYPE STANDARD TABLE OF zcurso_so_item.

  SELECT *
    INTO TABLE lt_item
    FROM zcurso_so_item
    WHERE matnr IN s_matnr() AND price_un IN s_price().

*** Fim - HUGOANSILVA *** 