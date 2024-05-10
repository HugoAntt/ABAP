*&---------------------------------------------------------------------*
*& Include          ZPRNOTASS_SEL
*&---------------------------------------------------------------------*

"EXIBIÇÃO DA TELA DE PESQUISA"
SELECTION-SCREEN BEGIN OF BLOCK b1.
  PARAMETERS: p_id TYPE znotass-id_nota. "MATCHCODE OBJECT ZSH_ZNOTASS. "
  PARAMETERS: p_name TYPE znotass-nome_aluno.
SELECTION-SCREEN END OF BLOCK b1.