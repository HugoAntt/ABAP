*&---------------------------------------------------------------------*
*& Report ZHUG_CURSO8
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zhug_curso8.

TYPES: ly_scarr       TYPE scarr,
       ly_scarr_table TYPE STANDARD TABLE OF ly_scarr.

DATA: ls_scarr TYPE scarr,
      lt_scarr TYPE ly_scarr_table.

BREAK-POINT.

"----------------------------------------------------------

TYPES: BEGIN OF ly_scarr,
         id   TYPE scarr-carrid,
         nome TYPE scarr-carrname,
       END OF ly_scarr.

DATA ls_scarr TYPE ly_scarr.

BREAK-POINT.

"---------------------------------------------------------´

"É necessário, pois type de tabela dentro de type, funciona somebte dessa forma.
TYPES: ly_scarr_tab TYPE STANDARD TABLE OF scarr WITH NON-UNIQUE KEY carrid..

TYPES: BEGIN OF ly_scarr,
         id        TYPE i,
         scarr     TYPE scarr,
         scarr_tab TYPE ly_scarr_tab,
       END OF ly_scarr.

DATA ls_scarr TYPE ly_scarr.

BREAK-POINT.