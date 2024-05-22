*&---------------------------------------------------------------------*
*& Report ZHUG_CURSO6
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zhug_curso6.
*** Ini - HUGOANSILVA - TEXTO - 15.05.2024 17:27:42 ***


START-OF-SELECTION.
  DATA: Id   TYPE c,
        nome TYPE c LENGTH 20.

*A forma do exemplo original ababixo, a ideia seria utilizar as manipulações em uma tabela Standart
*START-OF-SELECTION.
*  DATA: BEGIN OF zcurso_cliente_s
*       ,Id TYPE c
*       ,nome(20) TYPE c
*       ,END OF zcurso_cliente_s.

  TYPES: BEGIN OF ty_cliente,
           Id   TYPE i,
           nome TYPE c,
         END OF ty_cliente.

  DATA: lt_cliente TYPE TABLE OF ty_cliente,
        ls_cliente TYPE ty_cliente.

  " Populando a tabela interna
  ls_cliente-Id = '10'.
  ls_cliente-nome = 'José'.
  APPEND ls_cliente TO lt_cliente.

  ls_cliente-Id = '20'.
  ls_cliente-nome = 'Mauro'.
  APPEND ls_cliente TO lt_cliente.

  ls_cliente-Id = '30'.
  ls_cliente-nome = 'Paula'.
  APPEND ls_cliente TO lt_cliente.

  ls_cliente-Id = '30'.
  ls_cliente-nome = 'Paula'.
  APPEND ls_cliente TO lt_cliente.

  " Ordenando a tabela pelo ID
  SORT lt_cliente BY Id ASCENDING.

  " Removendo IDs duplicados
  DELETE ADJACENT DUPLICATES FROM lt_cliente COMPARING Id.

  " Exibindo os dados da tabela interna
  LOOP AT lt_cliente INTO ls_cliente.
    WRITE: / ls_cliente-Id, ls_cliente-nome.
  ENDLOOP.

*** Fim - HUGOANSILVA ***