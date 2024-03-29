    .include "m32def.inc"    ; Dołączenie definicji dla ATmega32

    ; Czyszczenie rejestrów roboczych
    clr r16          ; Zerowanie rejestru r16
    clr r17          ; Zerowanie rejestru r17
    clr r18          ; Zerowanie rejestru r18
    clr r19          ; Zerowanie rejestru r19

    ; Ustawienie młodszej części rejestrów
    sbr r16, 0b00001111  ; Ustawienie młodszej części rejestru r16 na 1, binarnie
    sbr r17, 0x0F        ; Ustawienie młodszej części rejestru r17 na 1, szesnastkowo
    sbr r18, 15          ; Ustawienie młodszej części rejestru r18 na 1, dziesiętnie
    sbr r19, 0b00001111  ; Ustawienie młodszej części rejestru r19 na 1, binarnie

    ; Ustawienie wszystkich bitów na 1
    ser r20             ; Ustawienie wszystkich bitów w rejestrze r20 na 1

    ; Czyszczenie starszej części rejestru
    cbr r20, 0b11110000  ; Czyszczenie starszej części rejestru r20, binarnie

    ; Ustawienie DDRC na wyjście
    ldi r21, 0xFF        ; Ustawienie DDRC na wyjście, szesnastkowo
    out DDRC, r21        ; Wypisanie wartości z r21 do DDRC

Petla:
    rjmp Petla           ; Skok do etykiety Petla, tworząc pętlę nieskończoną
