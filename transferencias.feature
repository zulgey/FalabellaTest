Feature: Transferencias bancarias a terceros
Realizar una transferencia bancaria a un tercero como titular de una cuenta
entonces se deberá abonar el monto a la cuenta destino y en caso de no cumplir las validaciones no deberá procesar la transferencia

  Scenario Outline: Transferir un monto inferior al límite máximo permitido para titulares persona natural a cuentas del mismo banco
    Given que el monto a transferir es menor al <limitemaximo> diario
     And que no se han realizado más transferencias bancarias desde la cuenta titular
     When se seleccione la opción procesar transferencia 
     Then debitar el <monto> de <Ctaorigen>
     And abonar el <monto> a la <Ctadestino>

  Example: 
  |limitemaximo|monto|Ctaorigen|Ctadestino|
  |1.000.000|500.000|1431531535|4353363636|
  |2.000.000|600.000|9574632890|0946721846|
  |3.000.000|1.000.000|3456728945|7465342178|
  
  
  
  Scenario Outline: Transferir un monto inferior al límite máximo permitido para titulares persona juridica a cuentas del mismo banco
    Given que el monto a transferir es menor al <limitemaximo> diario
     And que no se han realizado más transferencias bancarias desde la cuenta titular que superen el <limitemaximo>
     When se seleccione la opción procesar transferencia 
     Then debitar el <monto> de <Ctaorigen>
     And abonar el <monto> a la <Ctadestino>

  Example: 
  |limitemaximo|monto|Ctaorigen|Ctadestino|
  |3.000.000|500.000|1431531535|4353363636|
  |4.000.000|1.000.000|9574632890|0946721846|
  |5.000.000|2.000.000|3456728945|7465342178|
  
   Scenario Outline: Transferir un monto inferior al límite máximo permitido para cuentas de distinto banco persona natural
    Given que el monto a transferir es menor al <limitemaximo> diario para otros bancos
     And que no se han realizado más transferencias bancarias desde la cuenta titular que superen el <limitemaximo>
     When se seleccione la opción procesar transferencia 
     Then debitar el <monto> de <Ctaorigen>
     And abonar el <monto> a la <Ctadestino>

  Example: 
  |limitemaximo|monto|Ctaorigen|Ctadestino|
  |800.000|500.000|1431531535|4353363636|
  |400.000|200.000|9574632890|0946721846|
  |500.000|100.000|3456728945|7465342178|
   
  Scenario: Transferir un monto superior al límite máximo permitido a cuentas de distinto banco persona natural
    Given que el monto a transferir es mayor al <limitemaximo> diario para otros bancos
     When se seleccione la opción procesar transferencia
     Then se mostrará mensaje indicando que el <monto> supera el límite máximo para transferencias
     And no se deberá debitar el <monto>  de la cuenta de origen 
     And no se deberá abonar el <monto> a la cuenta destino
     
  Example:
   |limitemaximo|monto|
   |600.000|1.000.000|
   |1.000.000|1.200.000|
   
  Scenario: Transferir un monto superior al límite máximo permitido para transferencias por puntos de venta
    Given que el monto a transferir sumado a las transacciones realizadas en el día por medio de punto de venta superan el <limitemaximo> diario para transferencias por puntos de venta
     When Cuando se ingrese la clave del usuario en el punto de venta
     Then se mostrara mostrará mensaje indicando transacción fallida
     And no se deberá debitar el <monto>  de la cuenta de origen del titular 
     And no se deberá abonar el <monto> a la cuenta destino del punto de venta
     
  Example:
   |limitemaximo|monto|
   |3.000.000|3.500.000|
   |1.000.000|1.200.000|
   
  Scenario: transferir un monto superior al monto disponible en la cuenta bancaria del titular
    Given que el <importe> a transferir supera el <montodisponible> en la cuenta bancaria de origen 
    When se seleccione la opción procesar transferencia
    Then se mostrara mostrará mensaje indicando que el saldo es insuficiente
    And no se deberá debitar el <importe>  de la cuenta de origen del titular 
    And no se deberá abonar el <importe> a la cuenta destino del punto de venta
    
  Example:
   |importe|montodisponible|
   |800.000|500.000|
   |300.000|200.000|
   
   
  Scenario: Transferencias superiores a un monto que el banco determine.
    Given que el monto de la transferncia es mayor o igual al monto establecido por el banco
     When se seleccione la opción procesar transferencia
     Then se establecera la exigencia de la firma digital avanzada




     


   
   
   
   
   


