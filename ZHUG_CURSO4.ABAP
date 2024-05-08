*&---------------------------------------------------------------------*
*& Report ZHUG_CURSO4
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zhug_curso4.

*** Ini - HUGOANSILVA - TEXTO - 06.05.2024 15:58:41 ***

*Tipos:
*S = Sucesso
*E = Erro
*W = Aviso
*I = Informação
*A = Abortar
*X = Cancelar (Dump)

*SELECTION-SCREEN BEGIN OF BLOCK b1.
*
*  PARAMETERS p_me(50) TYPE c OBLIGATORY DEFAULT 'Mensagem teste.'.
*  PARAMETERS p_type(50) TYPE c OBLIGATORY.
*
*SELECTION-SCREEN END OF BLOCK b1.

*START-OF-SELECTION.
*  MESSAGE p_me TYPE p_type.


START-OF-SELECTION.
  DATA ld_message TYPE c.
*  MESSAGE e000(z_curso3).
  MESSAGE s001(z_curso3) WITH 'ver' 'funciona.'.



AT SELECTION-SCREEN ON HELP-REQUEST FOR z_curso3.
  MESSAGE i888 WITH 'AT SELECTION-SCREEN'
                    'ON HELP-REQUEST FOR SEL_OPT1-HIGH'.
*  MESSAGE 'ERRO' TYPE 'S' DISPLAY LIKE 'E'.

*Através da classe de mensagem. Transação SE91
  "Para Auxílio de programa: DEMO_SELECTION_SCREEN_EVENTS


  WRITE 'Fim do Programa.'.


*** Fim - HUGOANSILVA ***