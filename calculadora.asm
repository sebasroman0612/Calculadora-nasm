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



;APERTURA DEL PROGRAMA
    .code
    mov ax,@data ;Inicializa el segmento de datos
    mov ds,ax




;---MOSTRAR MENU---
    menu:
        lea dx,msg_Menu  ;Muestra el menu de opciones
        mov ah,9
        int 21h

        lea dx,msg_Suma ;Opciones de operaciones
        mov ah,9
        int 21h

        lea dx,msg_Resta
        mov ah,9
        int 21h

        lea dx,msg_Op_Multiplicacion
        mov ah,9
        int 21h

        lea dx,msg_Op_Division
        mov ah,9
        int 21h

        lea dx,msg_Salir
        mov ah,9
        int 21h

        lea dx,msg_Opcion
        mov ah,9
        int 21h

        mov ah,1 ;Lee la opcion seleccionada
        int 21h
        mov bh,al
        sub bh,48


;---SWITCH OPCIONES---
    cmp bh,1
    je Op_Suma

    cmp bh,2
    je Op_Resta

    cmp bh,3
    je Op_Multiplicacion

    cmp bh,4
    je Op_Division

    cmp bh,5
    je exit_p

;SUMA
    Op_Suma:                ;Solicita y lee los numeros
    lea dx, msg_PrimerNumero
    mov ah,9
    int 21h

    mov ah,1
    int 21h
    mov bl,al

    lea dx,msg_SegundoNumero
    mov ah,9
    int 21h

    mov ah,1
    int 21h
    mov cl,al

    add al,bl ;Realiza la suma
    mov ah,0
    aaa

    mov bx,ax
    add bh,48
    add bl,48

    lea dx,msg_Resultado ;Imprime el resultado
    mov ah,9
    int 21h

    mov ah,2
    mov dl,bh
    int 21h

    mov ah,2
    mov dl,bl
    int 21h

    jmp menu        ;Regresa al menu principal

;RESTA
    Op_Resta:
    lea dx,msg_PrimerNumero
    mov ah,9
    int 21h

    mov ah,1
    int 21h
    mov bl,al

    lea dx,msg_SegundoNumero
    mov ah,9
    int 21h

    mov ah,1
    int 21h
    mov cl,al

    sub bl,cl
    add bl,48

    lea dx,msg_Resultado
    mov ah,9
    int 21h

    mov ah,2
    mov dl,bl
    int 21h

    jmp menu

;MULTIPLICACIÓN
    Op_Multiplicacion:
    lea dx,msg_PrimerNumero
    mov ah,9
    int 21h

    mov ah,1
    int 21h
    sub al,48
    mov num1,al

    lea dx,msg_SegundoNumero
    mov ah,9
    int 21h

    mov ah,1
    int 21h
    sub al,48
    mov num2,al

    mul num1
    mov resultado,al
    aam

    add ah,48
    add al,48

    mov bx,ax

    lea dx,msg_Resultado
    mov ah,9
    int 21h

    mov ah,2
    mov dl,bh
    int 21h

    mov ah,2
    mov dl,bl
    int 21h

    jmp menu


; División
    Op_Division:
        lea dx, msg_PrimerNumero
        mov ah, 9
        int 21h

        mov ah, 1
        int 21h
        sub al, 48
        mov num1, al

        lea dx, msg_SegundoNumero
        mov ah, 9
        int 21h

        mov ah, 1
        int 21h
        sub al, 48
        mov num2, al

        ; Verificación de división por cero
        cmp num2, 0
        je DivZeroError ; Salta a DivZeroError si num2 es cero

        ; Cargar el valor de num1 en AX para la división
        mov al, num1
        cbw              ; Extiende AL a AX (convierte byte a word)

        ; Realizar la división
        mov cl, num2
        div cl
        mov resultado, al
        aam

        add ah, 48
        add al, 48

        mov bx, ax

        lea dx, msg_Resultado
        mov ah, 9
        int 21h

        mov ah, 2
        mov dl, bh
        int 21h

        mov ah, 2
        mov dl, bl
        int 21h

        jmp menu ; Regresa al menú

    ; Manejo de error de división por cero
    DivZeroError:
        lea dx, msg_ErrorDivZero ; Cargar la dirección del mensaje de error
        mov ah, 9
        int 21h
        jmp menu ; Regresa al menú principal

;--- MENSAJE DE ERROR ---
msg_ErrorDivZero db 10, 13, 'Operacion no valida. Division por cero no permitida.$'

;---CIERRE DEL PROGRAMA---
    exit_p:         ;Etiqueta de cierre del programa
    lea dx,msg_CerrarPrograma
    mov ah,9
    int 21h

    exit:
    mov ah, 4ch
    int 21h

    end  ;Fin del codigo fuente


