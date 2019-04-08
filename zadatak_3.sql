SELECT DISTINCT sudac.id, sudac.ime
    , sudac.prezime, rangsuca.naziv AS rang
    , LISTAGG((natjecanje.naziv || ' - ' || vrstaekipe.uzrast), ', ') AS natjecanje
FROM sudac JOIN rangsuca
    ON sudac.id_rang = rangsuca.id
    JOIN lista
    ON sudac.id = lista.id_sudac
    JOIN natjecanje
    ON lista.id_natjecanje = natjecanje.id
    JOIN vrstaekipe
    ON vrstaekipe.id = natjecanje.id_vrsta
    JOIN mjesto
    ON sudac.pbr_stanovanja = mjesto.pbr
WHERE mjesto.naziv = 'Zagreb' AND
    natjecanje.sezona = '2003/2004'
GROUP BY sudac.id, sudac.ime, sudac.prezime, rangsuca.naziv
ORDER BY sudac.id