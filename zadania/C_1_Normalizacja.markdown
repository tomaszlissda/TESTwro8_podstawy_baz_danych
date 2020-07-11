# 1. Czyszczenie dotychczasowego schematu bazy danych (10 min)

  - Usuń następujące kolumny:
      - miejscowosc VARCHAR(255)
      - ulica VARCHAR(255)
      - nr_domu VARCHAR(255)
      - departament VARCHAR(255)

# 2. Nowa tabela rodzajów wykształcenia (5 min)

  - Utwórz tabelę zawierającą kolumny:
      - id TINYINT
      - rodzaj VARCHAR(255)
  - Nazwij nową tabelę `rodzaj_wyksztalcenia`
  - Dodaj do tabeli pracownik klucz obcy do tabeli rodzaj_wyksztalcenia
  - Stwórz wpisy dla rodzajów wykształcenia:
      - 'Inżynier'
      - 'Magister'
      - 'średnie'
      - 'podstawowe'
  - Określ rodzaje wykształcenia pracowników. Załóżmy, że każdy z pracowników ma mieć wykształcenie średnie, większość
    pracowników powinna składać się z Magistrów i Inżynierów

# 3. Nowa tabela departamentów (5 min)

  - Utwór[azwie `departament`
  - Utwórz kolumny:
      - id TINYINT
      - nazwa VARCHAR(255)
  - Dodaj do tabeli `pracownik` klucz obcy do tabeli `departament`
  - Stwórz departamenty:
      - 'QA'
      - 'IT'
      - 'Zarząd'
      - 'Support'
  - Przypisz każdemu pracownikowi dowolny departament

# 4. Nowa tabela adresów (10 min)
  - Utwórz nową tabelę o nazwie `adres`
      - Utwórz kolumny:
      - id BIGINT
      - miejscowosc VARCHAR(255)
      - ulica VARCHAR(255)
      - nr_domu VARCHAR(255)
  - Dodaj do tabeli `pracownik` klucz obcy do tabeli `adres`
  - Stwórz kilka adresów we Wrocławiu, Berlinie, Warszawie i Londynie
  - Przypisz adresy do wybranych pracowników (nie wszystkich)
  - Kilka adresów przypisz do więcej niż jednego pracownika


# Zadanie dodatkowe 1

  Utwórz skrypt sql B4.sql oraz dodaj go do swojego repozytorium git.

# Zadanie dodatkowe 2

  Zastanów się co jeszcze mogłoby zostać znormalizowane

# Zadanie dodatkowe 3

  Pomyśl jak zaprojektować zmianę shcematu bazy danych tak aby departament miał informację o dyrektorze. Zakładamy, że
  dyrektor to również pracownik.

# Zadanie dodatkowe 4

  Zaproponuj zmianę schematu bazy danych tak aby pracownik mógł mieć dowiązanie do więcej niż jednego adresu.