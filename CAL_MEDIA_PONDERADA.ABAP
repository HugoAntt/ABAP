  METHOD cal_media_ponderada.

    DATA:
      p1           TYPE p DECIMALS 2,
      p2           TYPE p DECIMALS 2,
      p3           TYPE p DECIMALS 2,
      p4           TYPE p DECIMALS 2,
      somadospesos TYPE p DECIMALS 2.

    p1 = 2.
    p2 = 3.
    p3 = 2.
    p4 = 3.

* Calculando a soma dos pesos
    somadospesos = p1 + p2 + p3 + p4.

* Calculando a média ponderada
    media_ponderada = ( n1 * p1 + n2 * p3 + n3 * p3 + n4 * p4 ) / somadospesos.



  ENDMETHOD.

"Método presente na arquitetura do programa ZPROB_APROVACAO.