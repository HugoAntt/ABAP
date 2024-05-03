*&---------------------------------------------------------------------*
*& Report ZHUG_CURSO2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zhug_curso2.
*** Ini - HUGOANSILVA - TEXTO - 22.04.2024 09:48:41 ***

*1° Exemplo: Calculo da área de um círculo.

"Declaração
*DATA ld_raio(10) TYPE p DECIMALS 2.

DATA ld_area(10) TYPE p DECIMALS 2.
PARAMETERS ld_raio TYPE p DECIMALS 2.
CONSTANTS lc_pi(12) TYPE p DECIMALS 9 VALUE '3.141592653'.

WRITE: 'O valor do raio: ', ld_raio LEFT-JUSTIFIED.
NEW-LINE.

"Cálculo
ld_area = ( ld_raio * ld_raio ) * lc_pi.

WRITE: 'A área com o raio é: ' LEFT-JUSTIFIED, ld_area LEFT-JUSTIFIED, '.'.




*** Fim - HUGOANSILVA ***