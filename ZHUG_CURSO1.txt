*&---------------------------------------------------------------------*
*& Report ZHUG_CURSO1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zhug_curso1.
*** Ini - HUGOANSILVA - TEXTO - 19.04.2024 09:34:55 ***


"Declaração das variáveis
DATA ld_id TYPE i.
DATA ld_nome(100) TYPE c.
DATA ld_dnasc TYPE d.
DATA ld_hnasc TYPE t.
DATA ld_peso(6) TYPE p DECIMALS 3.
DATA ld_desc TYPE string.
DATA ld_login(5) TYPE n.

"Preenchimento da tabela
ld_id = 1.
ld_nome = 'José da Silva'.
ld_dnasc = '19900201'.
ld_hnasc = '153519'.
ld_peso = '80.00'.
ld_desc = 'Um cliente que compra em grande volume.'.
ld_login = 00001.

"Escrevendo dados na tela
WRITE 'Dados do Cliente:'.
NEW-LINE.

WRITE (19) 'Id: '.
WRITE ld_id LEFT-JUSTIFIED.
NEW-LINE.

WRITE (19) 'Nome: '.
WRITE ld_nome LEFT-JUSTIFIED.
NEW-LINE.

WRITE (19) 'Data de Nascimento: '.
WRITE: ld_dnasc DD/MM/YYYY,'-'.
WRITE: ld_hnasc+0(2),':',ld_hnasc+2(2),':',ld_hnasc+4(2).
NEW-LINE.

"Outra forma:
*WRITE: 'Data de Nascimento: ', ld_dnasc, ld_hnasc,
*       /.

WRITE (19) 'Peso: '.
WRITE ld_peso LEFT-JUSTIFIED.
NEW-LINE.

WRITE (19) 'Descrição: '.
WRITE ld_desc LEFT-JUSTIFIED.
NEW-LINE.

WRITE (19) 'Login: '.
WRITE ld_login LEFT-JUSTIFIED.
NEW-LINE.

WRITE (19) 'Id: '.
WRITE ld_id LEFT-JUSTIFIED.


*** Fim - HUGOANSILVA ***