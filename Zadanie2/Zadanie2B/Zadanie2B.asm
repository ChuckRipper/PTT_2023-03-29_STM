    .include "m32def.inc"    ; Dołączenie definicji dla ATmega32

    ; Czyszczenie rejestrów roboczych
    clr r16          ; Zerowanie rejestru r16
    clr r17          ; Zerowanie rejestru r17

    ; Ustawienie starszej części rejestrów
    sbr r16, 0b11110000  ; Ustawienie starszej części rejestru r16 na 1, binarnie
    sbr r17, 0xF0        ; Ustawienie starszej części rejestru r17 na 1, szesnastkowo

    ; Ustawienie wszystkich bitów na 1
    ser r18             ; Ustawienie wszystkich bitów w rejestrze r18 na 1
    ser r19             ; Ustawienie wszystkich bitów w rejestrze r19 na 1
    ser r20             ; Ustawienie wszystkich bitów w rejestrze r20 na 1

    ; Czyszczenie młodszej części rejestrów
    cbr r18, 0b00001111  ; Czyszczenie młodszej części rejestru r18, binarnie
    cbr r19, 0x0F        ; Czyszczenie młodszej części rejestru r19, szesnastkowo
    cbr r20, 15          ; Czyszczenie młodszej części rejestru r20, dziesiętnie

    ; Ustawienie DDRB na wyjście
    ldi r21, 0xFF        ; Ustawienie DDRB na wyjście, szesnastkowo
    out DDRB, r21        ; Wypisanie wartości z r21 do DDRB

Main:
    rjmp Main            ; Skok do etykiety Main, tworząc pętlę nieskończoną
