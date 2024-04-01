.include "m32def.inc"    ; Dołączenie definicji dla ATmega32

    ; Inicjalizacja portu C, tak jak w poprzednich programach
    ldi r16, 0x0F       ; PC0-PC3 jako wejście, PC4-PC7 jako wyjście
    out DDRC, r16       ; Konfiguracja kierunku pracy pinów dla portu C
    ldi r16, 0xF0       ; Włączenie pull-upów na PC4-PC7
    out PORTC, r16      ; Aktywacja pull-upów i wyjść

    ; Inicjalizacja portu D, tak jak w poprzednich programach
    ldi r16, 0x0F       ; PD0-PD3 jako wyjście, PD4-PD7 jako wejście
    out DDRD, r16       ; Konfiguracja kierunku pracy pinów dla portu D
    ldi r16, 0x00       ; Ustawienie niskiego stanu dla wyjść PD0-PD3
    out PORTD, r16      ; Wyzerowanie stanów wyjściowych dla PD0-PD3

    ; Inicjalizacja portu B, tak jak w poprzednich programach
    ldi r16, 0xF0       ; PB0-PB3 jako wejście, PB4-PB7 jako wyjście
    out DDRB, r16       ; Konfiguracja kierunku pracy pinów dla portu B
    ldi r16, 0x0F       ; Włączenie pull-upów na PB0-PB3
    out PORTB, r16      ; Aktywacja pull-upów i wyjść

    ; Inicjalizacja portu A dla programu nr 3
    ldi r16, 0x0F       ; PA0-PA3 jako wyjście, PA4-PA7 jako wejście
    out DDRA, r16       ; Konfiguracja kierunku pracy pinów dla portu A
    ldi r16, 0xF0       ; Włączenie pull-upów na PA4-PA7
    out PORTA, r16      ; Aktywacja pull-upów i wyjść

Start:
    ; Przeniesienie bitów z portu C do portu D
    in r16, PINC            ; Odczytanie aktualnego stanu portu C
    andi r16, 0x0F          ; Zachowanie tylko młodszych bitów z portu C
    out PORTD, r16          ; Przesłanie młodszych bitów do portu D

    ; Przeniesienie bitów z portu D do portu B
    in r16, PIND            ; Odczytanie aktualnego stanu portu D
    andi r16, 0xF0          ; Zachowanie tylko starszych bitów z portu D
    swap r16                ; Zamiana miejscami starszych i młodszych bitów
    out PORTB, r16          ; Przesłanie zamienionych bitów do portu B

    ; Przeniesienie bitów z portu B do portu A
    in r16, PINB            ; Odczytanie aktualnego stanu portu B
    andi r16, 0x0F          ; Zachowanie tylko młodszych bitów z portu B
    out PORTA, r16          ; Przesłanie młodszych bitów do portu A

    rjmp Start              ; Skok na początek pętli w celu powtarzania procesu
