/*unošenje redaka u tablice*/

insert into mjesto (pbr, naziv) values (10000, 'Zagreb');
insert into mjesto values (21000, 'Split');
insert into mjesto values (43232, 'Berek');
insert into mjesto values (43000, 'Bjelovar');
insert into mjesto values (43273, 'Bulinac');
insert into mjesto values (43500, 'Daruvar');
insert into mjesto values (43506, 'Dežanovac');


insert into rangsuca (id, naziv) values (1, 'Nacionalni');
insert into rangsuca values (2, 'Gradski');
insert into rangsuca values (3, 'Županijski');


insert into ulogasuca (id, naziv) values (1, 'Prvi sudac');
insert into ulogasuca values (2, 'Drugi sudac');
insert into ulogasuca values (3, 'Zapisničar');
insert into ulogasuca values (4, 'Linijski sudac');
insert into ulogasuca values (5, 'Delegat');


insert into klub (id, naziv) values (1, 'Liverpool');
insert into klub values (2, 'Manchester United');
insert into klub values (3, 'Manchester City');
insert into klub values (4, 'Arsenal');


insert into vrstaekipe (id, uzrast, spol) values (1, 'Juniori', 'Muški');
insert into vrstaekipe values (2, 'Prvi seniori', 'Muški');
insert into vrstaekipe values (3, 'Drugi seniori', 'Muški');
insert into vrstaekipe values (4, 'Kadeti', 'Muški');
insert into vrstaekipe values (5, 'Juniori', 'Ženski');
insert into vrstaekipe values (6, 'Prvi seniori', 'Ženski');
insert into vrstaekipe values (7, 'Drugi seniori', 'Ženski');
insert into vrstaekipe values (8, 'Kadeti', 'Ženski');


insert into ekipa (id, naziv, id_vrsta, id_klub) values (1, 'Liverpool U17', 1, 1);
insert into ekipa values (2, 'Manchester United U17', 1, 2);
insert into ekipa values (3, 'Manchester City U17', 1, 3);
insert into ekipa values (4, 'Arsenal U17', 1, 4);
insert into ekipa values (5, 'Liverpool U21', 2, 1);
insert into ekipa values (6, 'Manchester United U21', 2, 2);
insert into ekipa values (7, 'Manchester City U21', 2, 3);
insert into ekipa values (8, 'Arsenal U21', 2, 4);
insert into ekipa values (9, 'Liverpool U17-F', 5, 1);
insert into ekipa values (10, 'Manchester United U17-F', 5, 2);
insert into ekipa values (11, 'Manchester City U17-F', 5, 3);
insert into ekipa values (12, 'Arsenal U17-F', 5, 4);


insert into natjecanje (id, naziv, datum_pocetka, datum_zavrsetka, sezona, id_vrsta) 
    values (1, 'Premier League', (TO_DATE('2003/08/21', 'yyyy/mm/dd')), (TO_DATE('2004/05/13', 'yyyy/mm/dd')), ' 2003/2004', 1);
insert into natjecanje values (2, 'Championship', (TO_DATE('2003/08/21', 'yyyy/mm/dd')), (TO_DATE('2004/05/13', 'yyyy/mm/dd')), ' 2003/2004', 2);
insert into natjecanje values (3, 'La Liga', (TO_DATE('2003/08/21', 'yyyy/mm/dd')), (TO_DATE('2004/05/13', 'yyyy/mm/dd')), ' 2003/2004', 3);
insert into natjecanje values (4, 'Ligue 1', (TO_DATE('2003/08/21', 'yyyy/mm/dd')), (TO_DATE('2004/05/13', 'yyyy/mm/dd')), ' 2003/2004', 4);
insert into natjecanje values (5, 'Serie A', (TO_DATE('2003/08/21', 'yyyy/mm/dd')), (TO_DATE('2004/05/13', 'yyyy/mm/dd')), ' 2003/2004', 5);
insert into natjecanje values (6, 'Eredivise', (TO_DATE('2003/08/21', 'yyyy/mm/dd')), (TO_DATE('2004/05/13', 'yyyy/mm/dd')), ' 2003/2004', 6);
insert into natjecanje values (7, 'Bundesliga', (TO_DATE('2003/08/21', 'yyyy/mm/dd')), (TO_DATE('2004/05/13', 'yyyy/mm/dd')), ' 2003/2004', 7);
insert into natjecanje values (8, 'MLS', (TO_DATE('2003/08/21', 'yyyy/mm/dd')), (TO_DATE('2004/05/13', 'yyyy/mm/dd')), ' 2003/2004', 8);
insert into natjecanje values (9, 'Premier League', (TO_DATE('2004/08/24', 'yyyy/mm/dd')), (TO_DATE('2005/05/11', 'yyyy/mm/dd')), ' 2004/2005', 1);
insert into natjecanje values (10, 'Championship', (TO_DATE('2004/08/24', 'yyyy/mm/dd')), (TO_DATE('2005/05/11', 'yyyy/mm/dd')), ' 2004/2005', 2);
insert into natjecanje values (11, 'La Liga', (TO_DATE('2004/08/24', 'yyyy/mm/dd')), (TO_DATE('2005/05/11', 'yyyy/mm/dd')), ' 2004/2005', 3);
insert into natjecanje values (12, 'Ligue 1', (TO_DATE('2004/08/24', 'yyyy/mm/dd')), (TO_DATE('2005/05/11', 'yyyy/mm/dd')), ' 2004/2005', 4);
insert into natjecanje values (13, 'Serie A', (TO_DATE('2004/08/24', 'yyyy/mm/dd')), (TO_DATE('2005/05/11', 'yyyy/mm/dd')), ' 2004/2005', 5);
insert into natjecanje values (14, 'Eredivise', (TO_DATE('2004/08/24', 'yyyy/mm/dd')), (TO_DATE('2005/05/11', 'yyyy/mm/dd')), ' 2004/2005', 6);
insert into natjecanje values (15, 'Bundesliga', (TO_DATE('2004/08/24', 'yyyy/mm/dd')), (TO_DATE('2005/05/11', 'yyyy/mm/dd')), ' 2004/2005', 7);
insert into natjecanje values (16, 'MLS', (TO_DATE('2004/08/24', 'yyyy/mm/dd')), (TO_DATE('2005/05/11', 'yyyy/mm/dd')), ' 2004/2005', 8);


insert into utakmica (id, datum, id_natjecanje, id_domacini, id_gosti) values (1, (TO_DATE('2003/08/21', 'yyyy/mm/dd')), 1, 1, 2);
insert into utakmica values (2, (TO_DATE('2003/08/22', 'yyyy/mm/dd')), 1, 3, 4);
insert into utakmica values (3, (TO_DATE('2003/08/28', 'yyyy/mm/dd')), 1, 2, 4);
insert into utakmica values (4, (TO_DATE('2003/08/28', 'yyyy/mm/dd')), 1, 3, 1);
insert into utakmica values (5, (TO_DATE('2003/09/03', 'yyyy/mm/dd')), 1, 1, 4);
insert into utakmica values (6, (TO_DATE('2003/09/04', 'yyyy/mm/dd')), 1, 2, 3);
insert into utakmica values (7, (TO_DATE('2003/09/24', 'yyyy/mm/dd')), 1, 4, 3);
insert into utakmica values (8, (TO_DATE('2003/09/24', 'yyyy/mm/dd')), 1, 2, 1);
insert into utakmica values (9, (TO_DATE('2003/08/21', 'yyyy/mm/dd')), 5, 9, 10);
insert into utakmica values (10, (TO_DATE('2003/08/22', 'yyyy/mm/dd')), 5, 11, 12);


insert into sudac (id, ime, prezime, datum_rodenja, telefon, adresa, id_rang, pbr_stanovanja, pbr_rodjenja) 
    values (1, 'Mike', 'Dean', (TO_DATE('1989/03/21', 'yyyy/mm/dd')), '092 803 94 56', 'Halinčeva 4.', 1, 10000, 10000);
insert into sudac values (2, 'Martin', 'Atkinson', (TO_DATE('1973/12/11', 'yyyy/mm/dd')), '092 842 91 76', 'Sučeva 56', 2, 10000, 43500);
insert into sudac values (3, 'Michael', 'Oliver', (TO_DATE('1981/09/13', 'yyyy/mm/dd')), '099 532 71 12', '12 Lepinja', 3, 21000, 43000);
insert into sudac values (4, 'Anthony', 'Taylor',  (TO_DATE('1986/03/01', 'yyyy/mm/dd')), '095 278 39 56', 'Čevapinja 67', 1, 43000, 43000);
insert into sudac values (5, 'Craig', 'Pawson', (TO_DATE('1984/04/01', 'yyyy/mm/dd')), '091 558 26 74', '89 Olives', 2, 10000, 10000);
insert into sudac values (6, 'Lee', 'Mason', (TO_DATE('1983/07/30', 'yyyy/mm/dd')), '091 584 98 48', '88 Olives', 3, 10000, 10000);


insert into lista (id_sudac, id_natjecanje) values (1, 1);
insert into lista values (2, 1);
insert into lista values (3, 1);
insert into lista values (4, 1);
insert into lista values (5, 1);
insert into lista values (6, 1);
insert into lista values (1, 2);
insert into lista values (3, 2);
insert into lista values (4, 2);
insert into lista values (5, 2);
insert into lista values (6, 2);
insert into lista values (1, 3);
insert into lista values (1, 4);
insert into lista values (1, 5);
insert into lista values (1, 6);
insert into lista values (1, 7);
insert into lista values (1, 8);
insert into lista values (2, 3);
insert into lista values (2, 4);
insert into lista values (2, 5);
insert into lista values (2, 7);
insert into lista values (3, 5);
insert into lista values (3, 6);
insert into lista values (3, 7);
insert into lista values (3, 8);
insert into lista values (4, 3);
insert into lista values (4, 5);
insert into lista values (4, 6);
insert into lista values (4, 7);
insert into lista values (4, 8);
insert into lista values (5, 3);
insert into lista values (5, 4);
insert into lista values (5, 5);
insert into lista values (5, 6);
insert into lista values (5, 7);
insert into lista values (5, 8);
insert into lista values (6, 3);
insert into lista values (6, 4);
insert into lista values (6, 5);
insert into lista values (6, 6);
insert into lista values (6, 7);
insert into lista values (6, 8);


insert into sudenje (id_utakmica, id_sudac, id_uloga, ocjena) values (1, 1, 1, 0);
insert into sudenje values (1, 2, 2, 81);
insert into sudenje values (1,  3, 3, 92);
insert into sudenje values (1, 3, 3, 92);
insert into sudenje values (1, 4, 4, 53);
insert into sudenje (id_utakmica, id_sudac, id_uloga) values (1, 5, 5);