Feature: 
As a servicio o tarea del sistema interno
I want que se genere el archivo .csv con clientes y direcciones
So that cargar el archivo al sistema de distribución (logistica)

  Scenario: La generación del archivo .csv falla a la hora programada (12:00 am)
  	Given la generación del archivo .csv con el listado de clientes y direcciones falla
    When se cumple la hora programada para su generación
    Then se deberá consultar el estatus de generación del archivo
    And reprogramar la generación del archivo en un lapso de tiempo no mayor a <nminutos> minutos
    
   Example:
   |nminutos|
   | 1 |
   | 2 |
   | 3 |
   | 4 |
   | 5 |
   
  Scenario: El archivo .csv se genera con data incompleta a la hora programada (12:00 am)
    Given se genera el archivo .csv con data incompleta
     When se cumple la hora programada para a generación del .csv
     Then se deberá consultar el estatus de generación del archivo
     And reprogramar la generación del archivo en un lapso de tiempo no mayor a 5 minutos
     And cambiar el estatus a consultar para la generación del archivo
     
  Scenario: El archivo .csv se genera con éxito a la hora programada
    Given que el archivo .csv se genera con éxito
     When se cumple la hora programada
     Then se deberá cambiar el estatus de generación del archivo a exitoso
     
     
  Scenario: Carga del archivo al sistema de logística
   Given que el archivo .csv fue generado con éxito
   When consulta el estatus del archivo
   And estatus es exitoso
   Then cargar el archivo .csv al sistema de logística

  Scenario: No se carga el archivo al sistema de logística 
    Given que el archivo .csv no se generó con éxito en el sistema interno
     When se programo la generación del .csv
     Then No se cargará el archivo .csv al sistema de logística