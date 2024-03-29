# Zadania z teorii

## 1.A Krótko wyjaśnij istotę zastosowania rezystorów podciągających pull-up w portach mikroprocesora znajdujących się w przestrzeni I/O

**Rezystory podciągające (pull-up)** są używane w portach wejściowych mikroprocesora, aby zapewnić określony poziom sygnału (zazwyczaj wysoki) gdy wejście nie jest podłączone (jest "wisi"). Dzięki temu, porty wejściowe nie pozostają w stanie nieokreślonym (zwanym też stanem pływającym), co mogłoby prowadzić do nieprzewidywalnych odczytów. Rezystor podciągający jest połączony między linią wejściową a zasilanie, zapewniając stabilny poziom wysoki, dopóki do linii nie zostanie podłączony sygnał o potencjale niższym, np. masie (GND), co efektywnie zmienia stan na niski.