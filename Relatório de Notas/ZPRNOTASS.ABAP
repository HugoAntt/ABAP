*&---------------------------------------------------------------------*
*& Report ZPRNOTASS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zprnotass.
*** Ini - HUGOANSILVA, ARTHUR - TEXTO - 09.05.2024 15:49:17 ***

TYPES: BEGIN OF ty_prob,

         nome_alunos     TYPE Znomealuno,
         disciplina      TYPE z_nome_disciplina,
         nota1           TYPE znota,
         nota2           TYPE znota,
         nota3           TYPE znota,
         nota4           TYPE znota,
         media_ponderada TYPE znota,
         probabilidade   TYPE znota,

       END OF ty_prob.

"Declaração ALV
INCLUDE zprnotass_top.
" Tela de seleção
INCLUDE zprnotass_sel.
"Select
INCLUDE zprnotass_sos.

"Loop
LOOP AT lt_zprob INTO DATA(ls_zprob).
  "Verifica discplina atual
  lv_current_discplina = ls_zprob-disciplina.

  "Verifica index atual da tabela
  l_index = sy-tabix.

  "Passa para o próximo index
  READ TABLE lt_zprob INDEX ( l_index + 1 ) INTO DATA(lv_next_disciplina).

  "Verifica se há uma próxima linha
  IF sy-subrc = 0.

    IF lv_next_disciplina-disciplina <> lv_current_discplina.

      ls_prob-nome_alunos = ls_zprob-nome_alunos.
      ls_prob-disciplina = ls_zprob-disciplina.

      "Verifica se o loop ocorrerá corretamente na última nota.
      ls_prob-nota4 = ls_zprob-nota.

      "Metodo da Média Ponderada.
      ls_prob-media_ponderada = lo_Calc->calc_notas( n1 = ls_prob-nota1 n2 = ls_prob-nota2 n3 = ls_prob-nota3 n4 = ls_prob-nota4 probabilidade_aprovacao = ls_prob-probabilidade ).
*      ls_prob-probabilidade = lo_Calc->calc_notas(  ).

      "Preenchendo lt_prob
      APPEND ls_prob TO lt_prob.

    ELSE.
      "Verifica o bimestre atual
      IF ls_zprob-data+4(2) BETWEEN '02' AND '03'.
        ls_prob-nota1 = ls_zprob-nota.
      ELSEIF ls_zprob-data+4(2) BETWEEN '04' AND '06'.
        ls_prob-nota2 = ls_zprob-nota.
      ELSEIF ls_zprob-data+4(2) BETWEEN '08' AND '09'.
        ls_prob-nota3 = ls_zprob-nota.
      ELSEIF ls_zprob-data+4(2) BETWEEN '10' AND '11'.
        ls_prob-nota4 = ls_zprob-nota.
      ENDIF.

    ENDIF.

  ELSE.

    ls_prob-nome_alunos = ls_zprob-nome_alunos.
    ls_prob-disciplina = ls_zprob-disciplina.

    "Verificação na quarta nota.
    ls_prob-nota4 = ls_zprob-nota.

    "Metodo da Média Ponderada.
    ls_prob-media_ponderada = lo_Calc->calc_notas( n1 = ls_prob-nota1 n2 = ls_prob-nota2 n3 = ls_prob-nota3 n4 = ls_prob-nota4 probabilidade_aprovacao = ls_prob-probabilidade ).

    "Preenchendo a tabela lt_prob.
    APPEND ls_prob TO lt_prob.

  ENDIF.

ENDLOOP.


TRY.
    cl_salv_table=>factory(
      IMPORTING
        r_salv_table = lo_alv
      CHANGING
        t_table      =  lt_prob ).

  CATCH cx_salv_msg INTO lex_message.

ENDTRY.

"Tabela ALV
" Código da Layout da ALV

lo_layout_settings   = lo_alv->get_layout( ).
lo_layout_key-report = sy-repid.
lo_layout_settings->set_key( lo_layout_key ).
lo_layout_settings->set_save_restriction( if_salv_c_layout=>restrict_none ).

lo_functions = lo_alv->get_functions( ).
lo_functions->set_all( ).

"lo_column = lo_columns->get_column( 'DATA1' ).

lo_columns = lo_alv->get_columns( ).
lo_columns->set_optimize( ).


TRY .

    lo_column = lo_columns->get_column( 'DISCIPLINA' ).
    lo_column->set_short_text( 'Disc' ).
    lo_column->set_medium_text( 'Disciplina' ).
    lo_column->set_long_text( 'Disciplina' ).

    lo_column = lo_columns->get_column( 'NOME_ALUNOS' ).
    lo_column->set_short_text( 'Aluno' ).
    lo_column->set_medium_text( 'Nome do Aluno' ).
    lo_column->set_long_text( 'Nome do Aluno' ).

    lo_column = lo_columns->get_column( 'NOTA1' ).
    lo_column->set_short_text( '1° Nota' ).
    lo_column->set_medium_text( '1° Nota do Aluno' ).
    lo_column->set_long_text( '1° Nota do Aluno' ).

    lo_column = lo_columns->get_column( 'NOTA2' ).
    lo_column->set_short_text( '2° Nota' ).
    lo_column->set_medium_text( '2° Nota do Aluno' ).
    lo_column->set_long_text( '2° Nota do Aluno' ).

    lo_column = lo_columns->get_column( 'NOTA3' ).
    lo_column->set_short_text( '3° Nota' ).
    lo_column->set_medium_text( '3° Nota do Aluno' ).
    lo_column->set_long_text( '3° Nota do Aluno' ).

    lo_column = lo_columns->get_column( 'NOTA4' ).
    lo_column->set_short_text( '4° Nota' ).
    lo_column->set_medium_text( '4° Nota do Aluno' ).
    lo_column->set_long_text( '4° Nota do Aluno' ).

    lo_column = lo_columns->get_column( 'MEDIA_PONDERADA' ).
    lo_column->set_short_text( 'Média' ).
    lo_column->set_medium_text( 'Média Ponderada' ).
    lo_column->set_long_text( 'Média Ponderada' ).

    lo_column = lo_columns->get_column( 'PROBABILIDADE' ).
    lo_column->set_short_text( 'Prob(%)' ).
    lo_column->set_medium_text( 'Probabilidade(%)' ).
    lo_column->set_long_text( 'Probabilidade de Aprovação(%)' ).

*      lo_column = lo_columns->get_column( 'PERCENTUAL_FALTA' ).
*        lo_column->set_short_text( 'Falta' ).
*        lo_column->set_medium_text( 'Falta(%)' ).
*        lo_column->set_long_text( 'Falta(%)' ).
*      CATCH cx_salv_not_found INTO lex_not_found.


  CATCH cx_salv_not_found INTO lex_not_found.

ENDTRY.


lo_display_settings = lo_alv->get_display_settings( ).
lo_display_settings->set_striped_pattern( if_salv_c_bool_sap=>true ).

lo_display_settings->set_list_header( TEXT-001 ).

lo_alv->display( ).


cont = 1.
IF cont = 2.
ENDIF.

*** Fim - HUGOANSILVA, ARTHUR  ***