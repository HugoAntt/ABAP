*&---------------------------------------------------------------------*
*& Report ZHUG_CURSO5
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zhug_curso5.

*** Ini - HUGOANSILVA - TEXTO - 14.05.2024 08:58:13 ***

"Forma de armazenar variaveis em uma estrutura.
START-OF-SELECTION.
  DATA: BEGIN OF ls_localizacao
       ,pais(2)    TYPE c
       ,uf(2)      TYPE c
       ,cidade(20) TYPE c
       ,END OF ls_localizacao.


  "Funciona de armazenar todos juntos se respeitar a quantidade de limite de caracteres disponíveis.
  ls_localizacao = 'BRPEOlinda'.

  WRITE ls_localizacao-pais.
  WRITE ls_localizacao-uf.
  WRITE ls_localizacao-cidade.

*** Fim - HUGOANSILVA ***