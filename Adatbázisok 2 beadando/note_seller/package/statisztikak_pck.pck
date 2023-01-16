CREATE OR REPLACE PACKAGE statisztikak IS
  PROCEDURE atlagos_arbesorolas(p_min_price OUT NUMBER
                               ,p_max_price OUT NUMBER
                               ,p_avg_price OUT NUMBER);

  PROCEDURE jegyzet_statisztika;
END statisztikak;
/
CREATE OR REPLACE PACKAGE BODY statisztikak IS
  PROCEDURE atlagos_arbesorolas(p_min_price OUT NUMBER
                               ,p_max_price OUT NUMBER
                               ,p_avg_price OUT NUMBER) IS
  
  BEGIN
    SELECT MIN(j.ar)
          ,MAX(j.ar)
          ,AVG(j.ar)
      INTO p_min_price
          ,p_max_price
          ,p_avg_price
      FROM jegyzetek j;
  END atlagos_arbesorolas;

  PROCEDURE jegyzet_statisztika IS
    v_jegyzet_tipus ty_jegyzet_statisztika_l;
    v_max NUMBER := 0;
    v_feltolto VARCHAR(250);
  BEGIN
  
    SELECT ty_jegyzet_statisztika(tantargy_nev            => j.tantargy,
                                  feltolto_neve           => f.vezeteknev || ' ' ||
                                                             f.keresztnev,
                                  eladott_jegyzetek_szama => j.vevok_szama,
                                  bevetel                 => SUM(v.ar))
      BULK COLLECT
      INTO v_jegyzet_tipus
      FROM jegyzetek j
      JOIN felhasznalo f
        ON f.id = j.feltolto_id
      JOIN vasarlasok v
        ON j.id = v.jegyzet_id
     GROUP BY j.tantargy
             ,f.vezeteknev || ' ' || f.keresztnev
             ,j.vevok_szama
             ,v.ar;
  
    FOR i IN 1 .. v_jegyzet_tipus.count
    LOOP
      IF v_max < v_jegyzet_tipus(i).bevetel
      THEN
        v_max := v_jegyzet_tipus(i).bevetel;
        v_feltolto := v_jegyzet_tipus(i).feltolto_neve;
      END IF;
     
      dbms_output.put_line(v_jegyzet_tipus(i).tantargy_nev || ' ' || v_jegyzet_tipus(i)
                           .feltolto_neve || ' ' || v_jegyzet_tipus(i)
                           .eladott_jegyzetek_szama || ' ' || v_jegyzet_tipus(i).bevetel);
      
    END LOOP;
      dbms_output.put_line('');
      dbms_output.put_line('A legnagyobb bevétellel rendelkezõ: ' || v_feltolto || ' Bevétel: ' || v_max || ' Ft');
  
  END jegyzet_statisztika;
END statisztikak;
/
