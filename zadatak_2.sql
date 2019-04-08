/*Želimo da sustav onemogući da nekog suca delegiram na više od 10 utakmica
nekog natjecanja u jednoj sezoni*/

/*Funkcija vraća broj koliko je utakmica neki sudac odsudio u nekom natjecanju.*/
CREATE OR REPLACE FUNCTION sudacJudgeNUtakmica(new_sudac_id IN NUMBER, new_utakmica_id IN NUMBER)
    RETURN NUMBER
IS broj NUMBER;
    
CURSOR sudbroj IS
    SELECT COUNT(sudenje.id_sudac)
        FROM sudenje JOIN utakmica
            ON sudenje.id_utakmica = utakmica.id
            JOIN natjecanje
            ON utakmica.id_natjecanje = natjecanje.id
            WHERE natjecanje.id = (SELECT utakmica.id_natjecanje
									FROM utakmica
									WHERE utakmica.id = new_utakmica_id)
                AND sudenje.id_sudac = new_sudac_id;

BEGIN
    OPEN sudbroj;
    FETCH sudbroj INTO broj;
    CLOSE sudbroj;
    
    RETURN broj;
END sudacJudgeNUtakmica;

/

/*Okidač koji će prije unošenja novog retka za suđenje provjeriti 
je li sudac na određenom natjecanju već odsudio 10 utakmica.*/

CREATE OR REPLACE TRIGGER sudac_deset_trigger
BEFORE INSERT
	ON sudenje
	FOR EACH ROW
    
DECLARE 
    sudac_odsudio_deset_ex EXCEPTION;

BEGIN
    IF (sudacJudgeNUtakmica(:NEW.id_sudac, :NEW.id_utakmica) >= 10) THEN
    RAISE sudac_odsudio_deset_ex;
    END IF;
    
EXCEPTION
    WHEN sudac_odsudio_deset_ex THEN
    raise_application_error (-20001,'Sudac je odsudio već 10 utakmica u zadanom natjecanju.');
END;


-- Provjera da li okidač ispravno radi:
	-- provjeru vršimo za sljedeće natjecanje koje se već nalazi u bazi:
-- insert into natjecanje values (9, 'Premier League', (TO_DATE('2004/08/24', 'yyyy/mm/dd')), (TO_DATE('2005/05/11', 'yyyy/mm/dd')), '2004/2005', 1);

	-- moramo najprije unijeti 11 utakmica kako bi mogli unijeti 11 suđenja:
/*
insert into utakmica (id, datum, id_natjecanje, id_domacini, id_gosti) values (30, (TO_DATE('2004/09/21', 'yyyy/mm/dd')), 9, 1, 2);
insert into utakmica (id, datum, id_natjecanje, id_domacini, id_gosti) values (31, (TO_DATE('2004/09/22', 'yyyy/mm/dd')), 9, 3, 2);
insert into utakmica (id, datum, id_natjecanje, id_domacini, id_gosti) values (32, (TO_DATE('2004/09/23', 'yyyy/mm/dd')), 9, 4, 2);
insert into utakmica (id, datum, id_natjecanje, id_domacini, id_gosti) values (33, (TO_DATE('2004/09/24', 'yyyy/mm/dd')), 9, 1, 2);
insert into utakmica (id, datum, id_natjecanje, id_domacini, id_gosti) values (34, (TO_DATE('2004/09/25', 'yyyy/mm/dd')), 9, 1, 3);
insert into utakmica (id, datum, id_natjecanje, id_domacini, id_gosti) values (35, (TO_DATE('2004/09/26', 'yyyy/mm/dd')), 9, 1, 4);
insert into utakmica (id, datum, id_natjecanje, id_domacini, id_gosti) values (36, (TO_DATE('2004/09/27', 'yyyy/mm/dd')), 9, 3, 2);
insert into utakmica (id, datum, id_natjecanje, id_domacini, id_gosti) values (37, (TO_DATE('2004/09/28', 'yyyy/mm/dd')), 9, 4, 2);
insert into utakmica (id, datum, id_natjecanje, id_domacini, id_gosti) values (38, (TO_DATE('2004/09/29', 'yyyy/mm/dd')), 9, 1, 2);
insert into utakmica (id, datum, id_natjecanje, id_domacini, id_gosti) values (39, (TO_DATE('2004/09/30', 'yyyy/mm/dd')), 9, 1, 3);
insert into utakmica (id, datum, id_natjecanje, id_domacini, id_gosti) values (40, (TO_DATE('2004/10/01', 'yyyy/mm/dd')), 9, 1, 4);
*/

	-- sudac mora biti na listi za to natjecanje:
-- insert into lista (id_sudac, id_natjecanje) values (1, 9);

	-- unosimo 11 redaka za suđenje, na 11 unosu bi se trebala dogoditi iznimka:
/*
insert into sudenje (id_utakmica, id_sudac, id_uloga, ocjena) values (30, 1, 1, 34);
insert into sudenje (id_utakmica, id_sudac, id_uloga, ocjena) values (31, 1, 1, 25);
insert into sudenje (id_utakmica, id_sudac, id_uloga, ocjena) values (32, 1, 1, 67);
insert into sudenje (id_utakmica, id_sudac, id_uloga, ocjena) values (33, 1, 1, 67);
insert into sudenje (id_utakmica, id_sudac, id_uloga, ocjena) values (34, 1, 1, 43);
insert into sudenje (id_utakmica, id_sudac, id_uloga, ocjena) values (35, 1, 1, 56);
insert into sudenje (id_utakmica, id_sudac, id_uloga, ocjena) values (36, 1, 1, 65);
insert into sudenje (id_utakmica, id_sudac, id_uloga, ocjena) values (37, 1, 1, 90);
insert into sudenje (id_utakmica, id_sudac, id_uloga, ocjena) values (38, 1, 1, 21);
insert into sudenje (id_utakmica, id_sudac, id_uloga, ocjena) values (39, 1, 1, 56);
insert into sudenje (id_utakmica, id_sudac, id_uloga, ocjena) values (40, 1, 1, 78);

*/