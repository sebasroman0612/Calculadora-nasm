;---;---Etiquetas Principales---
    .model small ;Define el modelo como "small", para permitir un solo segmento de código y uno de datos.
    .stack 100h ;Reserva 256 Bytes para la pila
    .386        ;Indica el tipo de arquitectura que se va a utilizar
    .data       ;Comienza la sección de datos donde se declaran variables y mensajes

;---MENSAJES EN CONSOLA---
    msg_Menu db 10, 13,'Menu', 10, 13, '$' ;Define un mensaje de menú que incluye saltos de linea y termina en '$'
    msg_Suma db '   1. Suma $'             ;Mensaje para la opción 1 (Suma).
    msg_Resta db 10,13,'   2. Resta $'     ;Mensaje para la opción 2 (Resta)
    msg_Op_Multiplicacion db 10,13,'   3. Multiplicacion $' ; Mensaje para la opción 3 (Multiplicación)
    msg_Op_Division db 10,13,'   4. Division $' ;Mensaje para la opción 4 (División)
    msg_Salir db 10,13,'   5. Salir $' ; Mensaje que indica opción 5 (Salir) del menú
    msg_Opcion db 10,13,'   Escoge una opcion: $' ;Mensaje que solicita al usuario que elija una opción en el menú
    msg_PrimerNumero db 10,13,10,13,'Ingresa el primer numero: $' ;Mensaje que solicita el primer número
    msg_SegundoNumero db 10,13,'Ingresa el segundo numero: $'     ;Mensaje que solicita el segundo número
    msg_Resultado db 10,13,10,13,'El resultado es: $'   ;Mensaje que muestra el resultado de la operación
    msg_CerrarPrograma db 10,13,10,13,'Cerrando el programa... $' ;Mensaje que se muestra al cerrar el programa
    

;---VARIABLES---
    num1 db ? ;Declaración de una variable 'num1' de tipo byte para almacenar el primer número
    num2 db ? ;Declaración de una variable 'num2' de tipo byte para almacenar el segundo número
    resultado db ? ;Declara una variable 'resultado' de tipo byte para almacenar el resultado de la operación



