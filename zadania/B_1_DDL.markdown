#Tworzenienie schematu bazy danych

W tej sekcji skupiamy się na podstawach modelu relacyjnego.

# 1. Tworzenie  pierwszej tabeli (5 min)

  - Proszę o stworzenie tabeli o następujących atrybutach:
    - nr_pracownika TINYINT
    - imie VARCHAR(255)
  -   nazwisko VARCHAR(255)
    - wynagrodzenie NUMERIC(15, 2)
  - Nr pracownika jest identyfikatorem unikalnym. Proszę aby ten atrybut był kluczem głównym.

# 2. Aktualizacja atrybutu tabeli (5 min)
  - Wyobraźmy sobie sytuację, w której ilość pracowników znacząco wzrosła. W tej chwili osiąga zasięg globalny. W
  najbliższym czasie pracowników będą tysiące. W ciągu pięciu lat natomiast ich ilość może wzrosnąć nawet do dziesiątek
  milionów osób.
  - Używając dokumentacji proszę sprawdzić czy schemat wymaga zmiany atrybutu
  - Proszę określić na jaki typ najlepiej będzie zmienić typ danych w kolumnie
  - Używając odpowiedniej komendy ALTER proszę wykonać zmianę

# 3. Dodawanie nowych atrybtów do tabeli (10 min)
  - Firma zorientowała się, że potrzebuje dodatkowych informacji o pracownikach
  - Proszę zmodyfikować schemat bazy danych (np. używając komendy ALTER) tak aby przechowywał informacje o adresie pracownika:
      - miejscowosc VARCHAR(255)
      - ulica VARCHAR(255)
      - nr_domu VARCHAR(255)
  - Zaproponuj i zaimplementuj komendę która pomoże na modyfikację tabeli tak aby przechowywała:
      - wyksztalcenie VARCHAR(255)
      - departament VARCHAR(255)

# 4. Zadanie dodatkowe (15 min)

  - Zbierz wszystkie komendy w skrypt B1.sql
  - Zastanów się jakie usprawnienia widzisz w schemacie bazy danych
  - Poszukaj w dokumentacji informacji jak wstawić dane do bazy danych