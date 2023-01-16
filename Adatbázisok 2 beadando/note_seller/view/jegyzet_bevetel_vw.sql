CREATE OR REPLACE VIEW jegyzet_bevetel_vw AS
SELECT j.tantargy
      ,f.vezeteknev || ' ' || f.keresztnev AS felhasznalo_neve
      ,j.tanar_neve
      ,e.egyetem_neve
      ,j.feltoltes_datuma
      ,sum(v.ar) AS osszes_bevetel
  FROM jegyzetek j
  JOIN felhasznalo f
    ON f.id = j.feltolto_id
  JOIN egyetemek e
    ON e.id = j.egyetem_id
  JOIN vasarlasok v
    ON j.id = v.jegyzet_id
  GROUP BY j.tantargy, f.vezeteknev || ' ' || f.keresztnev, j.tanar_neve, e.egyetem_neve, j.feltoltes_datuma
  ORDER BY j.tantargy;

SELECT * FROM jegyzet_bevetel_vw;
