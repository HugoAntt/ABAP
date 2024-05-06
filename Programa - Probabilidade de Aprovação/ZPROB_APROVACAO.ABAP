*&---------------------------------------------------------------------*
*& Report ZPROB_APROVACAO
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*

*** Ini - HUGOANSILVA e ARTHURSANTOS - TEXTO - 09.04.2024 14:57:27 ***
REPORT zprob_aprovacao.

DATA: lo_alv              TYPE REF TO cl_salv_table,
      lex_message         TYPE REF TO cx_salv_msg,
      lo_layout_settings  TYPE REF TO cl_salv_layout,
      lo_layout_key       TYPE        salv_s_layout_key,
      lo_columns          TYPE REF TO cl_salv_columns_table,
      lo_column           TYPE REF TO cl_salv_column,
      lex_not_found       TYPE REF TO cx_salv_not_found,
      lo_functions        TYPE REF TO cl_salv_functions_list,
      lo_display_settings TYPE REF TO cl_salv_display_settings,
      ld_faltas           TYPE string.


*
*"o Type precisa estar relacionao ao parametro do método, nesse caso: znota.
*DATA:
*  nota1 TYPE znota,
*  nota2 TYPE znota,
*  nota3 TYPE znota,
*  nota4 TYPE znota.

DATA(lo_Calc) = NEW zcl_regras_school( ). " Crie uma instância da classe

"EXIBIÇÃO DA TELA DE PESQUISA"
SELECTION-SCREEN BEGIN OF BLOCK b1.
  PARAMETERS: p_id TYPE zalunos-id. "MATCHCODE OBJECT ZSH_NOME_ID. "
  PARAMETERS: p_name TYPE zalunos-nome_aluno.
SELECTION-SCREEN END OF BLOCK b1.

*  INNER JOIN znotas AS n
*  ON a~id_aluno = n
*  INNER JOIN zdiscplina AS d
*  ON f~id_disciplina = d~id_disciplina
*  INNER JOIN zalunos AS a
*  ON t~id_aluno = a~id
*  INTO TABLE @DATA(lt_zfrequencia)
*  WHERE data IN @so_date
*    AND a~id = @p_id
*    AND a~nome_aluno = @p_name
*  ORDER BY d~nome_aluno.


* SELECT COUNT( * )
*  FROM znotas AS n
*  INNER JOIN zalunos AS a
*  ON a~id = n~id_aluno
*    INTO lv_count_notas
*  WHERE a~id = id.




DATA(lo_faltas) = NEW zcl_regras_school( ). " Crie uma instância da classe
ld_faltas = lo_faltas->cal_faltas( p_id ).

IF ld_faltas = 'Reprovado'.
  WRITE 'O Aluno foi reprovado por falta.'.
  EXIT.
ENDIF.

"Select Para funcionamento do LV
SELECT
  a~nome_aluno,
  n~nota,
  d~nome_discplina,
  n~data
  FROM znotas AS n
  INNER JOIN zalunos AS a
  ON n~id_aluno = a~id
  INNER JOIN zdiscplina AS d
  ON n~id_disciplina = d~id_disciplina
  INTO TABLE @DATA(lt_zPROB)
  WHERE a~id = @p_id
  ORDER BY d~nome_discplina.

TYPES: BEGIN OF ty_prob,
         nome_aluno      TYPE zalunos-nome_aluno,
         nome_disciplina TYPE zdiscplina-nome_discplina,
         nota1           TYPE znota,
         nota2           TYPE znota,
         nota3           TYPE znota,
         nota4           TYPE znota,
         media_ponderada TYPE znota,
       END OF ty_prob.

DATA: lt_prob              TYPE TABLE OF ty_prob,
      ls_prob              TYPE ty_prob,
      lv_current_discplina TYPE zdiscplina-nome_discplina,
      l_index              TYPE sy-tabix.

LOOP AT lt_zprob INTO DATA(ls_zprob).
  "Verifica discplina atual
  lv_current_discplina = ls_zprob-nome_discplina.

  "Verifica index atual da tabela
  l_index = sy-tabix.

  "Passa para o próximo index
  READ TABLE lt_zprob INDEX ( l_index + 1 ) INTO DATA(lv_next_disciplina).

  "Verifica se há uma próxima linha
  IF sy-subrc = 0.

    IF lv_next_disciplina-nome_discplina <> lv_current_discplina.

      ls_prob-nome_aluno = ls_zprob-nome_aluno.
      ls_prob-nome_disciplina = ls_zprob-nome_discplina.
***    MODIFICADO POR lUCAS E WENDEL
      ls_prob-nota4 = ls_zprob-nota.
***    FIM MODIFICAÇÃO
      "Metodo da Média Ponderada.
      ls_prob-media_ponderada = lo_Calc->cal_media_ponderada( n1 = ls_prob-nota1 n2 = ls_prob-nota2 n3 = ls_prob-nota3 n4 = ls_prob-nota4 ).

      APPEND ls_prob TO lt_prob.
    ELSE.
      "Verifica bimestre atual
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
    ls_prob-nome_aluno = ls_zprob-nome_aluno.
    ls_prob-nome_disciplina = ls_zprob-nome_discplina.

***    MODIFICADO POR lUCAS E WENDEL
    ls_prob-nota4 = ls_zprob-nota.
***    FIM MODIFICAÇÃO
    "Metodo da Média Ponderada.
    ls_prob-media_ponderada = lo_Calc->cal_media_ponderada( n1 = ls_prob-nota1 n2 = ls_prob-nota2 n3 = ls_prob-nota3 n4 = ls_prob-nota4 ).

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

lo_display_settings = lo_alv->get_display_settings( ).
lo_display_settings->set_striped_pattern( if_salv_c_bool_sap=>true ).

lo_display_settings->set_list_header( TEXT-001 ).

lo_alv->display( ).

*"Metodo da Média Ponderada.
*DATA(lo_Calc) = NEW zcl_regras_school( ). " Crie uma instância da classe
*lo_Calc->cal_media_ponderada( n1 = nota1 n2 = nota2 n3 = nota3 n4 = nota4 ).
*
*
*DATA: lt_zprob               TYPE TABLE OF ty_frequencia,
*      ls_frequencia          TYPE ty_frequencia,
*      lv_current_disciplina  TYPE zdiscplina-nome_discplina,
*      ld_percentual_presenca TYPE p DECIMALS 2,
*      ld_percentual_falta    TYPE p DECIMALS 2,
*      lv_count               TYPE i VALUE 1,
*      lv_count_presenca      TYPE i VALUE 0,
*      l_index                TYPE sy-tabix.
*
*LOOP AT lt_zfrequencia INTO DATA(ls_zfrequencia).
*  lv_current_disciplina = ls_zfrequencia-nome_discplina.
*  l_index = sy-tabix.
*
*  READ TABLE lt_zfrequencia INDEX ( l_index + 1 ) INTO DATA(lv_next_discplina).
*
*  IF sy-subrc = 0.
*    IF lv_next_discplina-nome_discplina <> lv_current_disciplina.
*      ls_frequencia-nome_aluno = ls_zfrequencia-nome_aluno.
*      ls_frequencia-nome_turma = ls_zfrequencia-nome_turma.
*      ls_frequencia-nome_disciplina = ls_zfrequencia-nome_discplina.
*      ls_frequencia-presencas = lv_count_presenca.
*      IF so_date IS NOT INITIAL.
*        ld_percentual_presenca = ( ls_frequencia-presencas / lv_count ) * 100.
*        ls_frequencia-percentual_falta = 100 - ld_percentual_presenca.
*      ENDIF.
*      APPEND ls_frequencia TO lt_frequencia.
*      lv_count = 1.
*      lv_count_presenca = 1.
*    ELSE.
*      lv_count = lv_count + 1.
*      IF ls_zfrequencia-presenca = 'P'.
*        lv_count_presenca = lv_count_presenca + 1.
*      ENDIF.
*    ENDIF.
*  ELSE.
*    ls_frequencia-nome_aluno = ls_zfrequencia-nome_aluno.
*    ls_frequencia-nome_turma = ls_zfrequencia-nome_turma.
*    ls_frequencia-nome_disciplina = ls_zfrequencia-nome_discplina.
*    ls_frequencia-presencas = lv_count_presenca.
*    IF so_date IS NOT INITIAL.
*      "WRITE: lv_count_presenca, lv_count.
*      ld_percentual_presenca = ( ls_frequencia-presencas / lv_count ) * 100.
*      ls_frequencia-percentual_falta = 100 - ld_percentual_presenca.
*    ENDIF.
*    APPEND ls_frequencia TO lt_frequencia.
*    lv_count = 1.
*    lv_count_presenca = 1.
*  ENDIF.
*ENDLOOP.
*
**LOOP AT ty_prob INTO DATA
**
*
*
*
*
*
*
** * Fim - HUGOANSILVA e ARTHURSANTOS ***z