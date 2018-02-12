Feature: Agregar producto a la bolsa de compras en Falabella.com

Scenario Outline: En google.com navegar a la pagina "falabella" 

Given que el usuario busca en google.com la palabra "falabella"
When se selecciona el texto que dice "<texto>"
Then ir a la página web de falabella.com

Examples:
|texto|
|Falabella.com - Mejor Compra Online|

Scenario Outline: funcionalidad buscar y agregar producto a la bolsa

Given se realiza la busqueda del producto "<producto>" 
When seleccione el producto
Then se mostrará el detalle del producto
And se habilita el botón "Agregar a Bolsa"
Then el producto se agrega de manera exitosa a la bolsa

Examples:
|producto|
|ps4|

Scenario Outline: Funcionalidad Aumentar la cantidad de productos y extención de garantia

Given que se aumenta la cantidad de productos a "<canidad>"
And seleccionar la opción "Extender garantia"
When se selecciona la opción "comprar"
Then se cargará el formulario de compra

Examples:
|cantidad|
|1|
|2|
|3|
|4|
|5|



Scenario: Funcionalidad Completar los datos para generar el despacho

Given se carga el formulario de compra en la vista
When se ingresan los datos del formulario
And seleccionar en tipo de despacho "Retira tu compra"
Then Se muestra la pantalla correspondiente al pago

Scenario: Funcionalidad seleccionar medio de pago

Given que se listan todas las opciones de pago
When se selecciona la opción "Efectivo"
Then Se  completan todos los datos 
And seleccionar "Reversar compra"
Then vuelve a  la vista anterior



