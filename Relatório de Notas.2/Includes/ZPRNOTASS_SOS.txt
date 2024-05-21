*&---------------------------------------------------------------------*
*& Include          ZPRNOTASS_SOS
*&---------------------------------------------------------------------*

"Select Para funcionamento do LV
SELECT
  id_nota,
  nome_aluno,
  nota,
  disciplina,
  data
  FROM znotass AS n
  INTO TABLE @DATA(lt_zPROB)
  WHERE id_nota = @p_id
  ORDER BY disciplina.
