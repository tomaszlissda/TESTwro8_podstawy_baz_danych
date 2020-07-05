# Instalacja środowiska pracy

## 1. Pobierz instalator ze [strony producenta](https://dev.mysql.com/downloads/installer/)

## 2. Podążaj za instalatorem

  Wybieramy customową instalację:

  ![Krok 1](./obrazy/Instalator_krok1.PNG)

  Potrzebny będzie nam serwer bazy danych:

  ![Krok 2](./obrazy/Instalator_krok2.PNG)

  Wygodnym narzędzie dostępu do bazy danych My SQL jest Workbench:

  ![Krok 3](./obrazy/Instalator_krok3.PNG)

  Bardziej zaawansowani użytkownicy mogą preferować Command Line Interface:

  ![Krok 4](./obrazy/Instalator_krok4.PNG)

  Jeśli planujesz dłuższą przygodę z bazą danych My SQL miłym akcentem będzie dokumentacja i przykłady. Te elementy nie
  będą wymagane na tym kursie. Krok ten traktuj opcjonalnie:

  ![Krok 5](./obrazy/Instalator_krok5_opcjonalny.PNG)

  Następne okno sprawdza czy na komputerze zainstalowano wcześniej programy używane przez elementy Twojej instalacji.
  W naszym przypadku na środowisku Windows potrzebny będzie: Microsoft Visual C++ 2019 Redistributable Package (x64)

  ![Krok 6](./obrazy/Instalator_krok6.PNG)

  Installer powinien automatycznie zainstalować wymagany pakiet:

  ![preprekwizyty instalacji](./obrazy/prerekwizyt_instalacja.PNG)

  Jeśli udało się zobaczysz następujące okno:

  ![prerekwizyty zainstalowane](./obrazy/prerekwizyt_success.PNG)

  Wracając do okna prerekwizytów widzimy:

  ![potwierdzenie prerekwizytów](./obrazy/spelnione_prerekwizyty.PNG)

  Jeśli nie uda się zainstalować prerekwizyt Microsoft Visual C++ 2019 Redistributable Package (x64) możesz pobrać ten
  prerekwizyt ze [strony Microsoftu](https://visualstudio.microsoft.com/pl/downloads/)

  W kolejnych krokach widzimy progres instalacji:

  ![Krok 7](./obrazy/Instalator_krok7.PNG)
  ![Krok 8](./obrazy/Instalator_krok8.PNG)

  Następnie produkt mus być skonfigurowany. Wybieramy domyślne ustawienia tak długo jak to możliwe:

  ![Krok 9](./obrazy/Instalator_krok9.PNG)
  ![Krok 10](./obrazy/Instalator_krok10.PNG)
  ![Krok 11](./obrazy/Instalator_krok11.PNG)
  ![Krok 12](./obrazy/Instalator_krok12.PNG)

  Aby umożliwić połączenie do bazy danych potrzebujemy ustawić hasło konta głównego (tzw. root). Stwórz hasło bezpieczne
  ale i łatwe do zapamiętania:

  ![Krok 13](./obrazy/Instalator_krok13.PNG)
  ![Krok 14](./obrazy/Instalator_krok14.PNG)
  ![Krok 15](./obrazy/Instalator_krok15.PNG)
  ![Krok 16](./obrazy/Instalator_krok16.PNG)
  ![Krok 17](./obrazy/Instalator_krok17.PNG)

  Aby kontynuować instalację potrzebne będzie hasło konta głównego:

  ![Krok 18](./obrazy/Instalator_krok18.PNG)
  ![Krok 19](./obrazy/Instalator_krok19.PNG)
  ![Krok 20](./obrazy/Instalator_krok20.PNG)
  ![Krok 21](./obrazy/Instalator_krok21.PNG)

  Zależnie od preferencji możesz wybrać punkt 3.1 lub 3.2. W ramach z ajęć nie będzie miało znaczenia czy wolisz używać CLI
  czy narzędzia graficznego.

## 3.1. Uruchom CLI i użyj hasła które ustawione zostało w ramach instalacji.

  ![Krok 1 CLI](./obrazy/CLI1.PNG)
  ![Krok 2 CLI](./obrazy/CLI2.PNG)

## 3.2. Uruchom Workbench i użyj hasła ustawionego w ramach instalacji

  ![Krok 1 Workbench](./obrazy/workbench1.PNG)
  ![Krok 1 Workbench](./obrazy/workbench2.PNG)
  ![Krok 2 Workbench](./obrazy/workbench3.PNG)

## 4. Stwórz bazę danych sda_test

## 5. Utwórz użytkownika z loginem odpowiadającym Twojemu imieniu

## 6. Nadaj uprawnienia "do wszystkiego" utworzonemu użytkownikowi

Materiały pomocnicze:
  [Dokumentacja GRANT](https://dev.mysql.com/doc/refman/8.0/en/grant.html)