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
DATA ld_comp(10) TYPE p DECIMALS 2.

*PARAMETERS ld_opcao TYPE P.
PARAMETERS ld_raio TYPE p DECIMALS 2.

CONSTANTS lc_pi(12) TYPE p DECIMALS 9 VALUE '3.141592653'.

*WRITE 'Digite qual a operação deseja utilizar: '.
*new-LINE.
*WRITE '1 para Círculo.'.
*new-LINE.
*WRITE: '2 para Triângulo.', ld_opcao LEFT-JUSTIFIED.

"A ideia é fazer uma lista de áreas a ser calculadas, o usuário após selecionar, é automaticamente encaminhado.
"Teste 1


WRITE:(21) 'O valor do raio: ', ld_raio LEFT-JUSTIFIED.
NEW-LINE.

"Cálculo da àrea.
ld_area = ( ld_raio * ld_raio ) * lc_pi.

"Cálculo do comprimento.
ld_comp = ( 2 * lc_pi ) * ld_raio.

WRITE:(21) 'A área do círculo é: ', ld_area LEFT-JUSTIFIED.
NEW-LINE.

WRITE:(21) 'E seu comprimento: ', ld_comp LEFT-JUSTIFIED.




*** Fim - HUGOANSILVA ***