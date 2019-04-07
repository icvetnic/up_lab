/*Funkcija koja provjerava može li sudac suditi određenu utakmicu.
Može suditi na utakmici jedino ako utakmica pripada natjecanju na
čijoj listi se dotični sudac nalazi.*/
CREATE OR REPLACE FUNCTION isSudacOnLista(new_sudac_id IN NUMBER, new_utakmica_id IN NUMBER)
    RETURN NUMBER
IS broj NUMBER;
    
CURSOR sudbroj IS
    SELECT COUNT(lista.id_sudac)
        FROM natjecanje
            JOIN utakmica
            ON natjecanje.id = utakmica.id_natjecanje
            JOIN lista
            ON natjecanje.id = lista.id_natjecanje
            WHERE utakmica.id = new_utakmica_id
                AND lista.id_sudac = new_sudac_id;

BEGIN
    OPEN sudbroj;
    FETCH sudbroj INTO broj;
    CLOSE sudbroj;
    
    RETURN broj;
END isSudacOnLista;

-- ovaj slash treba tu biti kako bi se funkcija i okidać mogli kreirati iz iste skripte
/

/*Okidač koji će prije unošenja novog retka za suđenje provjeriti 
postoji li u listi sudac za određeno natjecanje.*/

CREATE OR REPLACE TRIGGER sudenje_trigger
BEFORE INSERT
	ON sudenje
	FOR EACH ROW
    
DECLARE 
    sudac_nije_na_listi_ex EXCEPTION;

BEGIN
    IF (isSudacOnLista(:NEW.id_sudac, :NEW.id_utakmica) = 0) THEN
    RAISE sudac_nije_na_listi_ex;
    END IF;
    
EXCEPTION
    WHEN sudac_nije_na_listi_ex THEN
    raise_application_error (-20001,'Sudac mora biti na listi za pripadajuće natjecanje.');
END;

/*Osim okidača, probali smo koristiti funkciju u constraint-u, ali nije radilo.*/
-- ALTER TABLE sudenje ADD CONSTRAINT CHK_isSudacOnLista CHECK (isSudacOnLista(id_sudac, id_utakmica) <> 0);

-- Provjera da li okidač ispravno radi:
	-- dodamo utakmicu koja pripada natjecanju za kojeg niti jedan sudac nije na listi za suđenje
-- insert into utakmica (id, datum, id_natjecanje, id_domacini, id_gosti) values (20, (TO_DATE('2003/08/30', 'yyyy/mm/dd')), 16, 11, 12);
	-- probamo dodati suđenje za tu utakmicu - trebala bi iskočiti iznimka
-- insert into sudenje (id_utakmica, id_sudac, id_uloga, ocjena) values (20, 1, 1, 40);