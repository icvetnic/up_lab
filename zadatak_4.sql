SELECT sudac.ime, sudac.prezime, sudac.datum_rodenja
    ,mjesto.naziv, sudac.adresa, sudac.telefon
FROM mjesto RIGHT JOIN sudac
    ON sudac.pbr_rodjenja = mjesto.pbr
    LEFT JOIN rangsuca
    ON sudac.id_rang = rangsuca.id
    WHERE rangsuca.id = 1;