Feature: Expedición a la luna
Realizar una expedición a la luna con el objetivo de encontrar agua

  Scenario: Explorar zona norte de la luna
    Given que se realizaron hoyos en la zona norte de la luna
     When se realizó la primera expedición
     Then Se deben verificar los hoyos exixtentes para revisar si hay existencia de agua en la
     
  Scenario: Explorar zona sur de la luna 
    Given que no se exploró la zona sur
     When se realizó la primera expedición
     Then se deben realizar hoyos en dicha zona en búqueda de agua
     
  Scenario: Explorar zona este de la luna
    Given que no se exploró la zona este
     When se realizó la primera expedición
     Then se deben realizar hoyos en dicha zona en búqueda de agua
     
  Scenario: Explorar zona este de la luna
    Given que no se exploró la zona oste
     When se realizó la primera expedición
     Then se deben realizar hoyos en dicha zona en búqueda de agua
   





