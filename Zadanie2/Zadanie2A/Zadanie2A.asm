    .include "m32def.inc"    ; Dołączenie definicji dla ATmega32

    ; Czyszczenie rejestrów roboczych
    clr r16          ; Zerowanie rejestru r16
    clr r17          ; Zerowanie rejestru r17
    clr r18          ; Zerowanie rejestru r18

    ; Ustawienie młodszej części rejestrów
    sbr r16, 0b00001111  ; Ustawienie młodszej części rejestru r16 na 1, binarnie
    sbr r17, 0x0F        ; Ustawienie młodszej części rejestru r17 na 1, szesnastkowo
    sbr r18, 15          ; Ustawienie młodszej części rejestru r18 na 1, dziesiętnie

    ; Ustawienie wszystkich bitów na 1
    ser r19             ; Ustawienie wszystkich bitów w rejestrze r19 na 1
    ser r20             ; Ustawienie wszystkich bitów w rejestrze r20 na 1

    ; Czyszczenie starszej części rejestrów
    cbr r19, 0b11110000  ; Czyszczenie starszej części rejestru r19, binarnie
    cbr r20, 0xF0        ; Czyszczenie starszej części rejestru r20, szesnastkowo

    ; Ustawienie DDRA na wyjście
    ldi r21, 0xFF        ; Ustawienie DDRA na wyjście, szesnastkowo
    out DDRA, r21        ; Wypisanie wartości z r21 do DDRA

Start:
    rjmp Start           ; Skok do etykiety Start, tworząc pętlę nieskończoną
