/*Funkcija koja provjerava može li ekipa igrati na nekom natjecanju. Da bi
ekipa mogla igrati na nekom natjecanju, natjecanje mora biti određeno za taj 
uzrast i spol ekipe.

Vraća 0 ako nisu kompatibilni, 1 inaće.*/
CREATE OR REPLACE FUNCTION ekipaKompatibilnaNatjecanje(new_ekipa_id IN NUMBER, new_natjecanje_id IN NUMBER)
    RETURN NUMBER
IS broj NUMBER := 1;
	ekipa_vrsta NUMBER;
	natjecanje_vrsta NUMBER;

BEGIN
	SELECT ekipa.id_vrsta INTO ekipa_vrsta
    FROM ekipa
    WHERE ekipa.id = new_ekipa_id;
    
    SELECT natjecanje.id_vrsta INTO natjecanje_vrsta
    FROM natjecanje
    WHERE natjecanje.id = new_natjecanje_id;
    
    IF ekipa_vrsta <> natjecanje_vrsta THEN
    broj := 0;
    END IF;
    
    RETURN broj;
END ekipaKompatibilnaNatjecanje;

/

/*Okidač koji će prije unošenja novog retka u tablicu UTAKMICA provjeriti 
može li domaća i gostujuća ekipa sudjelovati na natjecanju. Ako ne mogu,
izazvati će se iznimka.*/

CREATE OR REPLACE TRIGGER ekipa_natjecanje_trigger
BEFORE INSERT
	ON utakmica
	FOR EACH ROW
    
DECLARE 
    ekipa_ne_moze_igrati_na_natjecanju_ex EXCEPTION;

BEGIN
    IF ((ekipaKompatibilnaNatjecanje(:NEW.id_domacini, :NEW.id_natjecanje) = 0)
        OR (ekipaKompatibilnaNatjecanje(:NEW.id_gosti, :NEW.id_natjecanje) = 0)) THEN
    RAISE ekipa_ne_moze_igrati_na_natjecanju_ex;
    END IF;
    
EXCEPTION
    WHEN ekipa_ne_moze_igrati_na_natjecanju_ex THEN
    raise_application_error (-20003,'Ekipa ne moze igrati na zadanom natjecanju, jer natjecanje nije predviđeno za taj spol i uzrast.');
END;

-- Provjera rada okidača:
-- insert into utakmica (id, datum, id_natjecanje, id_domacini, id_gosti) values (1, (TO_DATE('2003/08/21', 'yyyy/mm/dd')), 1, 2, 11);