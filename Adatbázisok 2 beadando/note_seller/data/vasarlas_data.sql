--Vasarlasok
INSERT INTO vasarlasok (id, datum, jegyzet_id, felhasznalo_id, ar)
values (1, to_date('10-06-2020', 'dd-mm-yyyy'), 1, 4, 500);
INSERT INTO vasarlasok (id, datum, jegyzet_id, felhasznalo_id, ar)
values (2, to_date('30-10-2020', 'dd-mm-yyyy'), 1, 10, 500);
INSERT INTO vasarlasok (id, datum, jegyzet_id, felhasznalo_id, ar)
values (3, to_date('20-11-2020', 'dd-mm-yyyy'), 1, 2, 500);
INSERT INTO vasarlasok (id, datum, jegyzet_id, felhasznalo_id, ar)
values (4, to_date('01-12-2022', 'dd-mm-yyyy'), 2, 10, 1000);
INSERT INTO vasarlasok (id, datum, jegyzet_id, felhasznalo_id, ar)
values (5, to_date('05-05-2019', 'dd-mm-yyyy'), 3, 4, 800);
INSERT INTO vasarlasok (id, datum, jegyzet_id, felhasznalo_id, ar)
values (6, to_date('11-10-2019', 'dd-mm-yyyy'), 3, 2, 800);
COMMIT;
