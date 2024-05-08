*&---------------------------------------------------------------------*
*& Report ZHUG_CURSO3
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zhug_curso3.

*** Ini - HUGOANSILVA - TEXTO - 24.04.2024 11:02:01 ***
"Programa que relaciona companhias aereas com as moeadas utilizadas através de um radiobutton.

TABLES: scarr.

DATA w_aereo TYPE scarr.
DATA t_aereo TYPE TABLE OF scarr. "Tabela interna
DATA moeda TYPE c LENGTH 3.


"Entrada de dados
SELECTION-SCREEN BEGIN OF BLOCK bloco1 WITH FRAME TITLE TEXT-001.
  SELECT-OPTIONS: s_carrid FOR scarr-carrid.

  PARAMETERS: r_usd RADIOBUTTON GROUP r1 DEFAULT 'X',
              r_eur RADIOBUTTON GROUP r1,
              r_cad RADIOBUTTON GROUP r1,
              r_sek RADIOBUTTON GROUP r1,
              r_jpy RADIOBUTTON GROUP r1,
              r_chf RADIOBUTTON GROUP r1,
              r_gbp RADIOBUTTON GROUP r1,
              r_sgd RADIOBUTTON GROUP r1,
              r_aud RADIOBUTTON GROUP r1,
              r_zar RADIOBUTTON GROUP r1.

SELECTION-SCREEN END OF BLOCK bloco1.



CASE 'X'.

  WHEN r_usd.
    moeda = 'USD'.

  WHEN r_eur.
    moeda = 'EUR'.

  WHEN r_CAD.
    moeda = 'CAD'.

  WHEN r_SEK.
    moeda = 'SEK'.

  WHEN r_JPY.
    moeda = 'JPY'.

  WHEN r_CHF.
    moeda = 'CHF'.

  WHEN r_GBP.
    moeda = 'GBP'.

  WHEN r_SGD.
    moeda = 'SGD'.

  WHEN r_AUD.
    moeda = 'AUD'.

  WHEN r_ZAR.
    moeda = 'ZAR'.

ENDCASE.

SELECT mandt,
carrid,
carrname,
currcode
INTO TABLE @t_aereo
FROM scarr
WHERE carrid IN @s_carrid
AND currcode = @moeda.

IF sy-subrc = 0.
  LOOP AT t_aereo INTO w_aereo.

    WRITE: /(17) 'Mandante: '  ,w_aereo-mandt LEFT-JUSTIFIED.
    WRITE: /(17) 'Id: '  ,w_aereo-carrid LEFT-JUSTIFIED.
    WRITE: /(17) 'Cia: '  ,w_aereo-carrname LEFT-JUSTIFIED.
    WRITE: /(17) 'Codigo da Moeda: '  ,w_aereo-currcode LEFT-JUSTIFIED.
    WRITE: /.
  ENDLOOP.
ENDIF.


*Erro caso a companhia aerea não trabalhe com a moeda escolhida.
IF moeda <> w_aereo-currcode.
  MESSAGE 'A moeda inserida não é compatível com a companhia aérea.' TYPE 'S' DISPLAY LIKE 'E'.
  RETURN.
ENDIF.


**** Fim - HUGOANSILVA ***