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

SELECTION-SCREEN BEGIN OF BLOCK b1.

  PARAMETERS p_me(50) TYPE c OBLIGATORY DEFAULT 'Mensagem teste.'.
  PARAMETERS p_type(50) TYPE c OBLIGATORY.

SELECTION-SCREEN END OF BLOCK b1.

START-OF-SELECTION.
  MESSAGE p_me TYPE p_type.

  WRITE 'fim.'.


*** Fim - HUGOANSILVA ***