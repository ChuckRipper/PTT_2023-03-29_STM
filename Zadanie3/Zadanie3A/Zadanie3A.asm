.include "m32def.inc"    ; Dołączenie definicji dla ATmega32

    ; Inicjalizacja portu C
    ldi r16, 0x0F       ; Ustawienie DDR C, aby PC0-PC3 były wejściami (0) a PC4-PC7 wyjściami (1)
    out DDRC, r16       ; Ustawienie kierunku pracy pinów dla portu C
    ldi r16, 0xF0       ; Ustawienie PORT C, aby PC0-PC3 miały wyłączone pull-up'y (0), a PC4-PC7 miały włączone pull-up'y (1)
    out PORTC, r16      ; Aktywacja pull-up'ów dla PC4-PC7 i wyłączenie dla PC0-PC3

    ; Inicjalizacja portu D
    ldi r16, 0x0F       ; Ustawienie DDR D, aby PD0-PD3 były wyjściami (1) a PD4-PD7 wejściami (0)
    out DDRD, r16       ; Ustawienie kierunku pracy pinów dla portu D
    ldi r16, 0x00       ; Ustawienie PORT D, aby PD0-PD3 były nisko (0) (domyślnie wyjścia będą nisko)
    out PORTD, r16      ; Zerowanie stanów wyjściowych dla PD0-PD3

    ; Inicjalizacja portu A
    ldi r16, 0xF0       ; Ustawienie DDR A, aby PA0-PA3 były wyjściami (1), a PA4-PA7 wejściami (0)
    out DDRA, r16       ; Ustawienie kierunku pracy pinów dla portu A
    ldi r16, 0x0F       ; Ustawienie PORT A, aby PA0-PA3 były wysoko (1) (aktywacja pull-up'ów dla wejść)
    out PORTA, r16      ; Włączenie pull-up'ów dla PA0-PA3

    ; Inicjalizacja portu B
    ldi r16, 0xF0       ; Ustawienie DDR B, aby PB0-PB3 były wyjściami (1), a PB4-PB7 wejściami (0)
    out DDRB, r16       ; Ustawienie kierunku pracy pinów dla portu B
    ldi r16, 0x0F       ; Ustawienie PORT B, aby PB0-PB3 były wysoko (1) (aktywacja pull-up'ów dla wejść)
    out PORTB, r16      ; Włączenie pull-up'ów dla PB0-PB3

Start:
    ; Przeniesienie bitów z portu C do portu D
    in r16, PINC            ; Odczytanie aktualnego stanu portu C
    andi r16, 0x0F          ; Zachowanie tylko 4 młodszych bitów z portu C
    out PORTD, r16          ; Przesłanie młodszych bitów do portu D jako dane wyjściowe

    ; Przeniesienie bitów z portu D do portu A
    in r16, PIND            ; Odczytanie aktualnego stanu portu D
    andi r16, 0xF0          ; Zachowanie tylko 4 starszych bitów z portu D
    swap r16                ; Zamiana młodszych i starszych bitów miejscami
    out PORTA, r16          ; Przesłanie zamienionych bitów do portu A jako dane wyjściowe

    ; Przeniesienie bitów z portu A do portu B
    in r16, PINA            ; Odczytanie aktualnego stanu portu A
    andi r16, 0x0F          ; Zachowanie tylko 4 młodszych bitów z portu A
    out PORTB, r16          ; Przesłanie młodszych bitów do portu B jako dane wyjściowe

    rjmp Start              ; Skok na początek pętli w celu powtarzania procesu
