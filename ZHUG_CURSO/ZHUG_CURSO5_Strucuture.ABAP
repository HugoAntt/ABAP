*&---------------------------------------------------------------------*
*& Report ZHUG_CURSO5
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zhug_curso5.

*** Ini - HUGOANSILVA - TEXTO - 14.05.2024 08:58:13 ***

"Forma de armazenar variaveis em uma estrutura.


START-OF-SELECTION.
  DATA: BEGIN OF zcurso_cliente_s
       ,id(2)  TYPE c
       ,nome(20)
       ,END OF zcurso_cliente_s.

*START-OF-SELECTION.
*  DATA: BEGIN OF ls_localizacao
*       ,pais(2)    TYPE c
*       ,uf(2)      TYPE c
*       ,cidade(20) TYPE c
*       ,END OF ls_localizacao.


 zcurso_cliente_s = '01Mauro'.

 WRITE zcurso_cliente_s.

  "Funciona de armazenar todos juntos se respeitar a quantidade de limite de caracteres disponíveis.
*  ls_localizacao = 'BRPEOlinda'.
*
*  WRITE ls_localizacao-pais.
*  NEW-LINE.
*  WRITE ls_localizacao-uf.
*  NEW-LINE.
*  WRITE ls_localizacao-cidade.
  "Ou
*  ls_localizacao-pais=   'BR'.
*  ls_localizacao-uf=     'PE'.
*  ls_localizacao-cidade= 'Olinda'.

*** Fim - HUGOANSILVA ***