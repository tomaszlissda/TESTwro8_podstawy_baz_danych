/** Skrypt ten wykonaliśmy w ramach sesji live coding na zajęciach z baz danych */
/* Obszar w którym znajduje się ten napis nazywamy komentarzem blokowym */
-- obszar w którym znajduje się ten napis to komentarz liniowy
/*
	Oba komentarze zachowują się podobnie - kod w nich zawarty nie jest wykonywany.
    Różnica jeat taka, że komentarz blokowy obejmuje kilka lini
*/
-- natomiast komentarz liniowy tylko jedną linię
-- jak wspominaliśmy na zajęciach, język SQL jest językiem deklaratywnym. Mówimy co chcemy aby było wykonane,  
-- ale nie do końca opisujemy sposób tego uzyskania.
DROP DATABASE IF EXISTS nazwa2; -- instrukcja, która znajduje się po lewej stronie od komentarza, powoduje usunięcie bazy danych o ile ona istnieje
CREATE DATABASE nazwa2; -- linia w której się znajdujemy powoduje utworzenie bazy danych. 
-- Jest to doskonały przykład komendy deklaratywnej. Nie zajmujemy się szczegółami jak baza danych powstaje
-- Mówimy po prostu, że chcemy bazę danych o nazwie "nazwa2"
USE nazwa2; -- Instrukcją USE wybieramy bazę danych na której chemy pracować.
/* Tworznie tabel również jest prostą komendą.
Oczywiście składnia pozwala na dużo więcej niż przykład poniżej, ale aby stworzyć tabelę z kilkoma kolumnami nie trzeba dużo wiedzieć.
Wystarczy podstawowa wiedza:
Co to tabela?
Co to klucz główny?
Co to klucz obcy?
Co to atrybut?
Znajomość kilku typów danych
*/
CREATE TABLE a ( -- Linia pierwsza reprezentuje deklarację chęci utworzenia tabeli
	id BIGINT AUTO_INCREMENT PRIMARY KEY, /* W tym miejscu deklarujemy chęć utworzenia klucza głównego. 
		Klucz główny który tworzymy ma następujące cechy:
			typ - BIGINT
            wartość domyślna - AUTO_INCREMENT - mówi o tym, że każdy kolejny wiersz otrzyma kolejną wartość z zakresu typu danych BIGINT 1, 2, 3, 4,...
            ograniczenie - PRIMARY KEY - mówi nam o tym, że dana kolumna to klucz główny: nie może zawierać pustych wartości, każdy wiersz musi 
            reprezentować inna wartość klucza głównego
     */
    nazwa VARCHAR(10) -- przykład utworzenia prostego atrybutu, posiada on nazwę (w tym przypadku "nawzwa") oraz typ - w tym przypadku VARCHAR(10) 
);

/* Drugi przykład przykład pokazuje, że możemy utworzyć tabelę bez klucza głównego.
Nie jest to jednak dobrą praktyką i narusza zasady relacyjności.*/
CREATE TABLE www (
	adres TEXT
);
/* Gdy zdarzy się sytuacja, że musimy dodać do tabeli atrybut,  niezależnie czy to klucz główny, czy klucz obcy, czy zwykły atrybut 
można to wykonać komendą alter. */
ALTER TABLE www ADD COLUMN id BIGINT; -- widzimy tu składnię dodania kolumny id o typie BIGINT do tabeli on nazwie www
-- innymi słowy aktualizujemy tabelę o dodanie kolumny id o typie bigint.
ALTER TABLE www ADD PRIMARY KEY klucz_glowny_nazwa (id); /* Tu aktualizujemy tabelę ww o dodanie do niej ograniczenia 
klucza głównego o nazwie klucz_glowny_nazwa, w nawiasach widzimy kolumnę, która reprezentuje klucz główny. Kolumn może być więcej niż jedna.
Warunkiem koniecznym jest aby kolumna lub kolumny posiadały unikalne wartości we wszystkich wierszach. 
Jeśli chcieli byśmy zrobić klucz główny na kilku kolumnach np: imie oraz nazwisko, oznaczało by to, że żaden rekord nie może powtarzać 
tej samej pary wartości (imie,nazwisko) czyli może istnieć tylko jeden ("Jan","Kowalski") w tabeli.
*/
-- ktoś pytał jak wyświetlić tabele, które są w bazie danych
-- można posłużyć się information schema 
SELECT
    *
  FROM INFORMATION_SCHEMA.TABLES
  WHERE TABLE_SCHEMA = 'nazwa2'
;
-- możemy też jednak zrobić to prostszą komendą:
SHOW TABLES;
-- information schema daje nam jednak więcej informacji jak na przykład
SELECT
    TABLE_NAME, CREATE_TIME
  FROM INFORMATION_SCHEMA.TABLES
  WHERE TABLE_SCHEMA = 'nazwa2'
;

-- Tu po raz kolejny pokazaliśmy komendę alter, ponieważ nie było to dla Was jasne
ALTER TABLE a ADD COLUMN b DATE;  -- Przedstawiliśmy jak dodać kolumnę b typu DATE do tabeli a
ALTER TABLE a RENAME TO b; -- Poazaliśmy jak zmienić nazwę tabeli a na b
ALTER TABLE b RENAME COLUMN nazwa TO name; -- tu pokazaliśmy sobie jak można zrobić zmianę nazwy kolumny w tabeli
ALTER TABLE b RENAME COLUMN name TO nazwa; 
/* na potrzebę zadania musieliśmy pokazać jak zmienić typ kolumny */
ALTER TABLE b MODIFY COLUMN nazwa VARCHAR (100); -- tu mały komentarz: zmieniamy tabelę modyfikując kolumnę "nazwa" nadając jej nowe cechy, 
-- tu był to typ VARCHAR(100), innymi słowy zwiększyliśmy pojemność kolumny z 10 do 100
/* następnie przeszliśmy do wstawiania wierszy do tabeli */
INSERT INTO b (nazwa, b)  VALUES ('1224', '2020-01-01'); -- tu pokazujemy jak wstawić wiersz, nie definiując wartości we wszystkich kolumnach
/* uzupełniliśmy tylko nazwę i kolumnę b, zatem reszta kolumn powinna być ustawiona wartościami domyślnymi, w szczególności NULL. */
/* tą samą instrukcję wykonaliśmy kilka razy */
INSERT INTO b (nazwa, b)  VALUES ('1224', '2020-01-01');
INSERT INTO b (nazwa, b)  VALUES ('1224', '2020-01-01');
INSERT INTO b (nazwa, b)  VALUES ('1224', '2020-01-01');
SELECT * FROM b; -- Pokazujemy tu prosty select, który wybiera wszystkie wiersze tabeli oraz ich wszystkie atrybuty
-- kwerendę tę wykonaliśmy w celu pokazania, że kolumna id dostała wartości 1, 2, 3, 4 pomimo, że instrukcja insert tego nie deklarowałalter
-- pokazało to jak zachowuje się auto increment
/* 
Następnie przedstawiliśmy sobie jak w prosty i wydajny sposób usunąć wszystkie wiersze z tabeli. 
Powiedzieliśmy sobie wtedy, że wywołanie tej komendy bedzie szybsze niż DELETE FROM a;
Powiedzieliśmy sobie również, że chętni mogą doczytać dlaczego. Pojawiło się hasło wyzwalacze/triggery
*/
TRUNCATE TABLE a; 
/* dla ćwiczenia stworzyliśmy kolejną tabelę by przedstawić jak zachowuje się instrukcja DEFAULT */
CREATE TABLE c (
	id BIGINT auto_increment PRIMARY KEY,
    nazwa VARCHAR(122) DEFAULT 'aaaaa' -- ten fragment mówi nam, że jeśli nie podamy przy insert wartości kolumny "nazwa" otrzyma ona wartości 'aaaaa'
);
/* klikukrotnie wykonaliśmy instrukcję insert bez podania żadnych wartości kolumn */
INSERT INTO c VALUES ();
INSERT INTO c VALUES ();
INSERT INTO c VALUES ();
INSERT INTO c VALUES ();
/* Próbowaliśmy odgadnąć co zwróci poniższy select */
SELECT * FROM c;
/* zdania były podzielone ale ostatecznie wszyscy zobaczyli że wynikiem było 
1, aaaaa
2, aaaaa
3, aaaaa
4, aaaaa
*/
/* jako, że mieliście swoje wersje tabeli pracownicy pokazaliśmy sobie jak ją usunąć */
DROP TABLE IF EXISTS pracownicy;
/* jak widać zrobiliśmy to IF EXISTS z dwóch powodów:
	- mój schemat jeszcze jej nie zawierał
    - nie wszyscy z Was mieli ukończone poprzednie zadania
Nie mniej jednak ma to dodatkowy atut, bo powtórzyliśmy sobie ważny element składni :)
*/
/* następnie przeszliśmy do właściwej sesji live coding */
CREATE TABLE wyksztalcenie ( -- zrobiliśmy sobie słownik wykształcenia
	id INT PRIMARY KEY,
	nazwa TEXT
);
/* wstawiliśmy kilka wartości */
INSERT INTO wyksztalcenie(id, nazwa) VALUES (1, 'podstawowe');
 -- pokazaliśmy sobie, że można to robić specyfikując kolumny do których wstawiamy
INSERT INTO wyksztalcenie VALUES (2, 'średnie'); 
-- ale udowodniliśmy sobie również, że nie jest to konieczne jeśli uzupełniamy wszystkie atrybuty w odpowiedniej koejności
INSERT INTO wyksztalcenie VALUES (3, 'wyższe');

-- wyświetliliśmy sobie wszystkie wstawione rekordy
SELECT nazwa, id FROM wyksztalcenie;

/* podobnie zrobiliśmy z departamentem */
CREATE TABLE departament ( -- powstał słownik
	id INT PRIMARY KEY,
	nazwa VARCHAR(255)
);

-- powstały wpisy
INSERT INTO departament VALUES (1, 'IT');
INSERT INTO departament VALUES (2, 'QA');
INSERT INTO departament VALUES (3, 'Finanse');
-- i wyświetliliśmy sobie je wszystkie
SELECT * FROM departament;

/* utworzyliśmy tabelę pracowników */
CREATE TABLE pracownicy (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    imie VARCHAR(255),
    nazwisko VARCHAR(255),
    wynagrodzenie NUMERIC(15, 2), 
    id_departament INT REFERENCES departament(id), -- tu zaprezentowaliśmy jak zrobić klucz obcy do tabeli departament wskazująć na kolumnę id z tabeli departament
    id_wyksztalenie INT REFERENCES wyksztalcenie(id) -- tu zrobiliśmy podobnie ale wskazując na kolumnę id tabeli wykształcenie
);

/* mieliście za zadanie wstawienie kilku pracowników,  ale zrobiłem to też u siebie */
INSERT INTO pracownicy 
(imie, nazwisko, wynagrodzenie, id_departament, id_wyksztalenie) 
VALUES ('tomasz', 'lis', 1500.00, 1, 2);
INSERT INTO pracownicy 
VALUES (DEFAULT, 'jan', 'kowalski', DEFAULT, 3, 1);
INSERT INTO pracownicy 
(imie, nazwisko, wynagrodzenie, id_departament, id_wyksztalenie) 
VALUES ('jan', 'kowalski', 5500.00, 1, 1);
INSERT INTO pracownicy 
(imie, nazwisko, wynagrodzenie, id_departament, id_wyksztalenie) 
VALUES ('janina', 'kowalska', 3500.01, 3, 3);
INSERT INTO pracownicy 
(imie, nazwisko, wynagrodzenie, id_departament, id_wyksztalenie) 
VALUES ('janina', 'kowalska-nowak', 3500.01, 3, 2);

/* ostatecznie wyświetliliśmy wszystkich pracowników */
SELECT  * FROM pracownicy;

/* dodaliśmy tabelę adres */
CREATE TABLE adres (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    miejscowosc VARCHAR(255),
    ulica VARCHAR(255),
    nr_domu VARCHAR(255)
);
/* wstawiliśmy kilka adresów - ja byłem leniwy i wstawiłem tylko 2 */
INSERT INTO adres VALUES(DEFAULT, 'Wrocław', 'Obornicka', '1');
INSERT INTO adres VALUES(DEFAULT, 'Wrocław', 'Legnicka', '2B');
/* oraz wyświetliliśmy je */
SELECT * FROM adres;

/* wzbogaciliśmy tabelę praconicy o nową kolumnę id_adres z domyślną wartością 2, oraz kluczem obcym do tabeli adres wskazującym na id z tabeli adres */
ALTER TABLE pracownicy ADD COLUMN id_adres INT DEFAULT 2 REFERENCES adres(id);
/* zaktualizowaliśmy wszystkich pracowników o adresy tak, że adres 1 dostali pracownicy 1, 2, 3 */
UPDATE pracownicy SET id_adres = 1 WHERE id < 4; -- warunek id < 4 spowodował, że tylko pracownicy 1, 2, 3 mogli dostać id_adres = 1
UPDATE pracownicy SET id_adres = 2 WHERE id >= 4; -- warunek id >= 4 spowodował, że reszta otrzymała adres 2
/* Wartość default do instrukcji alter wstawiliśmy faktycznie po tym zapytaniu, zatem na zajęciach do tej pory update dla rekorów o id >= 4 był konieczny*/

/* !!!!!! Uwaga szczególnie do osób, które musiały wyjść */
-- tu zrobiliśmy jedno zapytanie aby przedstawić Wam materiał z ostatniej godziny w pigułce
SELECT p.imie, p.nazwisko, ulica, p.wynagrodzenie    -- pokazaliśmy sobie, że projekcja może zawierać kolumny z obu tabel
FROM 
	pracownicy p 
JOIN                                                 -- pokazaliśmy sobie INNER JOIN
	adres a 
ON (a.id = p.id_adres)                               -- na warunku id z tabeli adres musi być równe id_adres z tabeli pracownicy
ORDER BY p.wynagrodzenie DESC  						 -- pokazaliśmy sobie również jak działa ORDER BY w porządku od największy do najmniejszy
LIMIT 5;                                             -- przedstawiliśmy również składnię LIMIT, która ogranicza ilość rekordów wynikowych

-- tu przedsawiliśmy dwa elementu składniowe
SELECT DISTINCT imie FROM pracownicy -- distinct, który oznacza, że w projekcji pokażdemy tylko unikalne imiona
WHERE imie LIKE 'j__%' AND wynagrodzenie > 1500; -- w warunku where pokazaliśmy sobie jak łączyć warunki poprzez logincze "AND" alter
-- na uwagę zasługuje fakt, że zastosowaliśmy tu operatory większy '>' oraz operator 'LIKE', który pomógł nam wybrać rekordy o imionach na literę J, 
-- które mają przynajmniej 3 litery.
--  % - oznacza wildcard - czyli mogą to być jakie kolwiek znaki w ilości 0 do wielu
-- _ - oznacza, że musi być w tym miejscu dokładnie jeden dowolny znak

/* następnie pokazaliśmy sobie zapytanie, które miało wyświelić unikalne wartości kolumn imie i ulica */
SELECT DISTINCT imie, ulica 
FROM 
	pracownicy 
JOIN 
	adres a 
ON (a.id = id_adres) -- była to modyfikacja poprzedniego zapytania więc warunek złączenia i jego elementy mamy omówione wyżej
WHERE imie LIKE '%_a' AND nazwisko LIKE 'K__%'; -- pokazaliśmy sobie inne kombinacje użycia operatora like
-- chcieliśmy pokazać, że można tak samo określać wymagania co do początkowych znaków jak i końcowych
-- w tym przypadku bedą to imiona kończące sie na lieterę a oraz przynajmniej 3 literowe nazwiska na literę K

SELECT imie, nazwisko, wynagrodzenie 
FROM pracownicy 
WHERE wynagrodzenie BETWEEN 1500 AND 4500  -- pokazaliśmy sobie tu operator between oraz jego zachowanie. Bawiliśmy się wartościami aby określić 
--  czy to zbiór otwarty czy zamknięty
ORDER BY 3 DESC, 1, 2 DESC; -- tu pokazalśmy sobie, że desc działa tylko na kolumnę przy, której jest umieszczony
-- powyższa składnia pokazuje też, że zamiast nazw kolumnmożna podać ich pozycje w projekcji (to  miejsce pomiędzy select a from
-- innymi słowy tu posortowaliśmy po wynagrodzeniu od największego, następnie po imieniu od A do Z i pózniej po nazwisku od Z do A

/* kolejny przykład zapytania tym razem aby pokazać operatory logiczne OR i NOT */
SELECT imie, nazwisko FROM pracownicy
WHERE imie = 'janina' OR NOT nazwisko LIKE 'k%'; -- chcieliśmy zatem pobrać takie rekordy, których imie to janina lub nazwsiko nie zaczyna się od k

SELECT imie FROM pracownicy
WHERE NOT nazwisko LIKE 'k%'; -- tu wyświetlamy po prostu imiona pracowników, których nazwisko nie zaczyna się na k

/* dla ułatwienia wyświetlamy też wszystkie unikalne imiona pracowników */
SELECT DISTINCT imie FROM pracownicy;

/* Pod koniec zajęć powiedziliśmy sobie jeszcze o funkcjach agregacyjnych */ 
SELECT imie, nazwisko, 
COUNT(DISTINCT wynagrodzenie) AS `Ilość różnych wynagrodzeń`, -- tu element składni AS mówi nam, że nadajemy alias wynikowi funkcji COUNT
-- COUNT DISTINCT wynagrodzenie oznacza ilość unikalnych wartości  wynagrodzeń dla danego imienia i nazwiska (bo po tym robiliśmy group by)
COUNT(*) AS `Ilość`,  -- tu wyświetlamy ilość wszystkich rekordów  dla danego imienia i nazwiska oraz prezentujemy otrzymaną wartość jako "Ilość"
max(wynagrodzenie), -- analogicznie maksymalne wynagrodzenie dla danego imienia i nazwiska
min(wynagrodzenie), -- minimalne wynagrodzenie dla danego imienia i nazwiska
avg(wynagrodzenie)  -- średnie wynagrodzenie dla danego imienia i nazwiska
FROM pracownicy 
GROUP BY 1, 2 -- tu pokazujemy, że grupujemy po pierwszej i drugiej kolumnie projekcji - tu imie, nazwisko
ORDER BY 1, 2; -- sortujemy również po imieniu i nazwisku


/* kolejny - prostszy przykład na zrozumienie grupowania */
SELECT imie, nazwisko -- w projekcji mamy tylko imie, i nazwisko
FROM pracownicy 
GROUP BY 1, 2;  -- zatem 1 w group by oznacza imie, ponieważ to one jest pierwsze w projekcji
-- oczywiście analogicznie 2 oznaca nazwisko ponieważ ten atrybut jest drugi w projekcji

/* W kolejnym zapytaniu pokazaliśmy sobie funkcję GROUP_CONCAT() - czyli w przypadku GROUP_CONCAT(' ', nazwisko) - będzie to imiona poprzedzone spacją 
rodzielone przecinkami */
SELECT imie, GROUP_CONCAT(' ', nazwisko) FROM pracownicy GROUP BY 1;

-- dla celów ćwiczenia złączeń tabel chcieliśmy pozbawić 2 pracowników adresów
UPDATE pracownicy SET id_adres = null WHERE id < 3; -- zrobiliśmy to najprościej jak się da czyli aktualizacją 
-- klucza obcego na NULL gdzie id jest mniejsze  od 3. Takich rekordów jest naturalnie maksymalnie 2

-- wyświetliliśmy sobie, którzy to pracownicy
SELECT * FROM pracownicy WHERE id_adres IS NULL;

-- dodaliśmy również jeden adres
INSERT INTO adres VALUES (DEFAULT, 'Wrocław', 'Ostrowskiego', '120');

-- pokazaliśmy sobie, że RIHT JOIN pokarze wszystkie adresy i dowiązanych do nich pracowników. 
-- Adres ostrowskiego oczywiście dał nam w wyniku null w imieniu i nazwisku
SELECT imie, nazwisko, ulica FROM 
	pracownicy p 
RIGHT JOIN
	adres a 
ON (a.id = p.id_adres)
ORDER BY p.id;

-- LEFT JOIN pokazał nam wszystkich pracowników 
-- pierwsi 2 pracownicy mieli pustą ulicę w wyniku
SELECT imie, nazwisko, ulica FROM 
	pracownicy p 
LEFT JOIN
	adres a 
ON (a.id = p.id_adres)
ORDER BY p.id;

/* na sam koniec pokazaliśmy sobie cross join - czyli iloczyn kartezjański */
SELECT imie, nazwisko, ulica FROM 
	pracownicy p 
CROSS JOIN
	adres a 
ORDER BY p.id;
-- są to wszystkie kombinacje rekordów z tabeli pracownicy z wszystkimi adresami
-- można to zapisać też tak jak poniżej:
SELECT imie, nazwisko, ulica FROM 
	pracownicy p, adres a 
ORDER BY p.id;
-- Dzięki za uwagę na zajęciach i dzięki jeśli przeczytaliście moje komentarze, mam nadzieję, że będą pomocne w nauce