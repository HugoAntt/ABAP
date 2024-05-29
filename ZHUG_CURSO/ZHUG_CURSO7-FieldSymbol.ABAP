*&---------------------------------------------------------------------*
*& Report ZHUG_CURSO7
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zhug_curso7.
*** Ini - HUGOANSILVA - TEXTO - 23.05.2024 15:31:50 ***

"Há declaração de estruturas e tabela interna, caso haja dúvidas......
DATA: ld_varname TYPE char30,
      ld_teste   TYPE char30,
      ls_scarr   TYPE scarr,
      lt_scarr   TYPE STANDARD TABLE OF scarr.

"Criação de Field Symbol
FIELD-SYMBOLS: <ld_varname> TYPE char30,
               <ld_teste>    TYPE char30,
               <ls_scarr>   TYPE scarr,
               <lt_scarr>   TYPE scarr.


"Preenchendo as Variáveis e Estruturas.
ld_teste = 'Teste'.
ls_scarr-carrid = 1.
ls_scarr-carrname = 'AZUL'.
ls_scarr-currcode = 'EUR'.

BREAK-POINT.

"Referenciando os FS.
ASSIGN: ld_teste TO <ld_teste>,
        ls_scarr TO <ls_scarr>.

"Forma de Verificar se o Field Symbol "<ld_teste>" tem referência.
*IF <ld_teste> IS ASSIGNED.
*  WRITE 'Tem referência:'.
*  WRITE <ld_teste> LEFT-JUSTIFIED.
*ELSE.
*  WRITE 'Não tem referência.'.
*ENDIF.

NEW-LINE.

"Limpando referência do Field Symbol.
UNASSIGN <ld_teste>.

NEW-PAGE.

"Preenchendo Novamente.
ld_teste = 'Teste do novo referencial'.

"Referenciando novamente.
ASSIGN ld_teste TO <ld_teste>.

"Resultado:
WRITE: ld_teste LEFT-JUSTIFIED.
NEW-LINE.
WRITE ls_scarr LEFT-JUSTIFIED.

NEW-PAGE.

WRITE 'FS da Tabela Interna:'.
NEW-LINE.

SELECT *
  FROM scarr
  INTO TABLE lt_scarr.

"Adicionando os campos da tabela interna ao Field Symbol.
LOOP AT lt_scarr ASSIGNING <lt_scarr>.
  WRITE <lt_scarr>-carrname.
ENDLOOP.

NEW-PAGE.

"Referenciando um FS com uma Variável de outro programa.
*ld_varname = '(ZHUG_CURSO5)zcurso_cliente_s'.
*
*ASSIGN (ld_varname) TO <ld_varname>.
*
*WRITE <ld_varname>.

*** Fim - HUGOANSILVA ***
