# 1. Wstawianie rekordów do bazy danych (20 min)

- wstaw do tabeli pracowników rekord ze swoim imieniem, nazwiskiem i adresem
- wstaw do tabeli kilka pracowników o wykształceniu wyższym, pozostałe atrybuty mogą być dowolne
- wstaw do tabeli kilka pracowników z Wrocławia
- wstaw do tabeli kilka pracowników z Warszawy
- wstaw do tabeli pracownika, który miesza w Londynie
- wstaw do tabeli pracowników siedziby w Berlinie
- wstaw pracownika o wykształceniu 'Magister Zarządzania' pracującego w Warszawie
- wstaw pracowników o wykształceniu średnim, prośba o dokładnie jednego pracownika w każdym mieście używanym w
  poprzednich zapytaniach
- wstaw pracownika który mieszka pod tym samym adresem co Ty
- Wykonaj komędę `SELECT * FROM pracownicy;`, jaki wynik widzisz?

# 2. Modyfikacja rekordów w bazie danych (25 min)
- Ustaw wynagrodzenie wszystkich pracowników wartością 2500.00
- Zmień departament wszystkich pracowników z Berlina i Londynu na 'Departament QA'
- Zwiększ wynagrodzenie wszystkich pracowników departamentu QA do 4000.00
- Zwiększ swoje zarobki do 4800.00 i departament na 'Departament QA'
- Ustaw wykształcenie pracownika mieszkającego pod Twoim adresem wartością 'Inżynier'
- Zwiększ zarobki wszystkich Magistrów zarządzania do 4000.00
- Zwiększ zarobki kilku pracowników do wartości pomiędzy 2500 a 3200
- Zmień swój adres na adres w którym się znajdujemy (SWPS)
- Wykonaj komędę `SELECT * FROM pracownicy;`, jaki wynik widzisz?

# 3. Usuwanie rekordów z bazy danych (5 min)
- Usuń wszystkich pracowników którzy mieszkają pod tym samym adresem co Ty (teraz powinien być to adres SWPS)
- Usuń wszystkich pracowników z Londynu
- Wykonaj komędę 'SELECT * FROM pracownicy;', jaki wynik widzisz?
- Zmodyfikuj komendę `SELECT * FROM pracownicy WHERE imie = '%imię' AND nazwisko = '%nazwisko';`, wstawiając za
  - %imię - swoje imię
  - %nazwisko - swoje nazwisko
  Wywołaj mienioną komendę, jaki wynik widzisz?

# 4. Zadanie dodatkowe

  Utwórz skrypt B2.sql zawierający wszystkie komendy zgromadzone w ramach zadania.