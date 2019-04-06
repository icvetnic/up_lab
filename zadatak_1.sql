/*Želimo dobiti popis sudaca koji sude određeno natjecanje i za svakoga
napisati koliko je utakmica u tom natjecanju odsudio te koja mu je prosječna
ocjena. Želimo moći unijeti oznaku natjecanja koje me zanima.
*/

SELECT sudac.id, sudac.ime, sudac.prezime 
    , COUNT(sudenje.id_utakmica) AS brojUtakmica
    , AVG(sudenje.ocjena) AS prosOcjena
FROM sudac JOIN sudenje
    ON sudac.id = sudenje.id_sudac
    JOIN utakmica
    ON sudenje.id_utakmica = utakmica.id
WHERE utakmica.id_natjecanje = 1 AND sudenje.ocjena IS NOT NULL
GROUP BY sudac.id, sudac.ime, sudac.prezime;