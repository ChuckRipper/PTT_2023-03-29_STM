# Zadania z teorii

## 1.C Krótko wyjaśnij obowiązek konfiguracji "fuse bit-ów" oraz sens ich istnienia w pamięci mikrosterownika.

**"Fuse bits"** (bity bezpiecznikowe) to specjalna część pamięci mikrokontrolera, która pozwala na konfigurację kluczowych parametrów sprzętowych, które są ustawiane na stałe (do czasu kolejnego programowania). Obejmują one ustawienia takie jak źródło sygnału zegara, ustawienia watchdog'a, konfigurację resetu czy wybór trybu pracy bootloadera. Sens istnienia "fuse bit-ów" leży w możliwości dostosowania zachowania mikrokontrolera do potrzeb aplikacji i warunków pracy urządzenia jeszcze przed jego uruchomieniem, a także zabezpieczeniu przed niechcianymi zmianami konfiguracji w trakcie działania. Konfiguracja "fuse bits" odbywa się zazwyczaj podczas programowania mikrokontrolera i wymaga użycia programatora.

W środowisku mikrokontrolerów STM (np. rodziny STM32 firmy STMicroelectronics), pojęcie fuse bitów nie jest tak powszechnie używane jak w mikrokontrolerach AVR od Atmel. Zamiast tego, w mikrokontrolerach STM32 mówi się częściej o opcjach konfiguracyjnych przechowywanych w sekcji pamięci zwanej **bajtami opcji** (z ang. _option bytes_). Te opcje konfiguracyjne umożliwiają zmianę kluczowych ustawień mikrokontrolera, takich jak zabezpieczenia przed odczytem, konfiguracje watchdog, konfiguracje resetu i wiele innych.

W przeciwieństwie do mikrokontrolerów AVR, gdzie fuse bity mogą być programowane bezpośrednio przez ISP (In-System Programming), w mikrokontrolerach STM32 konfiguracja Option Bytes zwykle odbywa się za pośrednictwem dedykowanego narzędzia programistycznego lub bootloadera, a nie bezpośrednio w kodzie programu. Jest to spowodowane tym, że zmiana Option Bytes może mieć daleko idące konsekwencje dla działania mikrokontrolera i często wymaga specjalnych procedur.

### Przykłady Option Bytes w mikrokontrolerach STM32

- **Read Protection (RDP)**: Opcja ta służy do zabezpieczenia mikrokontrolera przed nieautoryzowanym odczytem zawartości pamięci flash. Możliwe jest ustawienie różnych poziomów ochrony, od braku ochrony, przez ochronę częściową, aż po pełną ochronę, która uniemożliwia odczyt zawartości flash przez debuger.

- **User Configuration**: Zawiera bity konfiguracyjne dla różnych opcji, takich jak konfiguracja **watchdog**, konfiguracja startowa pamięci flash itp.

- **Write Protection**: Umożliwia zabezpieczenie wybranych sektorów pamięci flash przed zapisem, co może być użyteczne do ochrony krytycznych części programu przed przypadkowym nadpisaniem.

```asm
 ; Przykłąd - zmiana OB (option bytes) RDP (Read Protection)
    LDR R0, =FLASH_OPTKEYR    ; Adres rejestru klucza opcji flash
    LDR R1, =0x45670123       ; Pierwszy klucz
    STR R1, [R0]              ; Odblokowanie dostępu do Option Bytes
    LDR R1, =0xCDEF89AB       ; Drugi klucz
    STR R1, [R0]              ; Kontynuacja odblokowania

    ; Następnie można zmodyfikować Option Bytes, np. RDP
    LDR R0, =FLASH_OPTCR      ; Adres rejestru konfiguracji opcji
    LDR R1, [R0]
    ORR R1, R1, #(RDP_Level << Pozycja_RDP_w_rejestrze) ; Zmiana poziomu RDP
    STR R1, [R0]              ; Zapisanie zmienionej wartości
```