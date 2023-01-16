--Jegyzetek
INSERT INTO jegyzetek (id, szak, tantargy, tanar_neve, felev, feltolto_id, feltoltes_datuma, ar, jegyzet_nyelve, vevok_szama, egyetem_id)
values (1, 'Mérnökinformatikus', 'Adatbázisok 2', 'Kovács József', 5, 4, to_date('10-01-2020', 'dd-mm-yyyy'), 500, 'Magyar', 3, 1);
INSERT INTO jegyzetek (id, szak, tantargy, tanar_neve, felev, feltolto_id, feltoltes_datuma, ar, jegyzet_nyelve, vevok_szama, egyetem_id)
values (2, 'Mérnökinformatikus', 'Analízis 1', 'Szép Katalin', 1, 10, to_date('15-03-2022', 'dd-mm-yyyy'), 1000, 'Magyar', 1, 1);
INSERT INTO jegyzetek (id, szak, tantargy, tanar_neve, felev, feltolto_id, feltoltes_datuma, ar, jegyzet_nyelve, vevok_szama, egyetem_id)
values (3, 'Építészmérnök', 'Épület szerkezetek stúdió 3', 'Kiss Zsolt', 3, 2, to_date('10-06-2018', 'dd-mm-yyyy'), 800, 'Magyar', 2, 3);
INSERT INTO jegyzetek (id, szak, tantargy, tanar_neve, felev, feltolto_id, feltoltes_datuma, ar, jegyzet_nyelve, vevok_szama, egyetem_id)
values (4, 'Villamosmérnök', 'Elektronika', 'Nagy Roland', 2, 3, to_date('15-09-2020', 'dd-mm-yyyy'), 500, 'Magyar', 0, 2);
COMMIT;
