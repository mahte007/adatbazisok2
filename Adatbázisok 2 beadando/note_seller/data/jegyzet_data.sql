--Jegyzetek
INSERT INTO jegyzetek (id, szak, tantargy, tanar_neve, felev, feltolto_id, feltoltes_datuma, ar, jegyzet_nyelve, vevok_szama, egyetem_id)
values (1, 'M�rn�kinformatikus', 'Adatb�zisok 2', 'Kov�cs J�zsef', 5, 4, to_date('10-01-2020', 'dd-mm-yyyy'), 500, 'Magyar', 3, 1);
INSERT INTO jegyzetek (id, szak, tantargy, tanar_neve, felev, feltolto_id, feltoltes_datuma, ar, jegyzet_nyelve, vevok_szama, egyetem_id)
values (2, 'M�rn�kinformatikus', 'Anal�zis 1', 'Sz�p Katalin', 1, 10, to_date('15-03-2022', 'dd-mm-yyyy'), 1000, 'Magyar', 1, 1);
INSERT INTO jegyzetek (id, szak, tantargy, tanar_neve, felev, feltolto_id, feltoltes_datuma, ar, jegyzet_nyelve, vevok_szama, egyetem_id)
values (3, '�p�t�szm�rn�k', '�p�let szerkezetek st�di� 3', 'Kiss Zsolt', 3, 2, to_date('10-06-2018', 'dd-mm-yyyy'), 800, 'Magyar', 2, 3);
INSERT INTO jegyzetek (id, szak, tantargy, tanar_neve, felev, feltolto_id, feltoltes_datuma, ar, jegyzet_nyelve, vevok_szama, egyetem_id)
values (4, 'Villamosm�rn�k', 'Elektronika', 'Nagy Roland', 2, 3, to_date('15-09-2020', 'dd-mm-yyyy'), 500, 'Magyar', 0, 2);
COMMIT;
