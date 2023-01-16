CREATE OR REPLACE VIEW vasarlasok_vw AS
SELECT f.vezeteknev || ' ' || f.keresztnev AS felhasznalo_neve
      ,f.email
      ,e.egyetem_neve
      ,count(v.felhasznalo_id) AS vasarlasok_szama
      ,sum(v.ar) AS osszes_elkoltott_penz
  FROM felhasznalo f
  JOIN egyetemek e
    ON e.id = f.egyetem_id
  JOIN vasarlasok v
    ON f.id = v.felhasznalo_id
  GROUP BY f.vezeteknev || ' ' || f.keresztnev, f.email, e.egyetem_neve, v.felhasznalo_id
  ORDER BY f.vezeteknev || ' ' || f.keresztnev;

SELECT * FROM vasarlasok_vw;

         
