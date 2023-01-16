CREATE OR REPLACE PACKAGE vasarlas_pck IS
  PROCEDURE jegyzet_vasarlas(p_vasarlas_id    IN NUMBER
                            ,p_jegyzet_id     IN NUMBER
                            ,p_felhasznalo_id IN NUMBER);
END vasarlas_pck;
/
CREATE OR REPLACE PACKAGE BODY vasarlas_pck IS
  PROCEDURE jegyzet_vasarlas(p_vasarlas_id    IN NUMBER
                            ,p_jegyzet_id     IN NUMBER
                            ,p_felhasznalo_id IN NUMBER) IS
    v_jegyzet_id NUMBER;
    v_jegyzet_ar NUMBER;
  BEGIN
    SELECT k.id
      INTO v_jegyzet_id
      FROM jegyzetek k
     WHERE k.id = p_jegyzet_id;
  
    SELECT j.ar
      INTO v_jegyzet_ar
      FROM jegyzetek j
     WHERE j.id = p_jegyzet_id;
  
    INSERT INTO vasarlasok
      (id
      ,datum
      ,jegyzet_id
      ,felhasznalo_id
      ,ar)
    VALUES
      (p_vasarlas_id
      ,SYSDATE
      ,p_jegyzet_id
      ,p_felhasznalo_id
      ,v_jegyzet_ar);
    COMMIT;
  
    UPDATE jegyzetek k
       SET k.vevok_szama = k.vevok_szama + 1
     WHERE k.id = v_jegyzet_id;
    COMMIT;
  END jegyzet_vasarlas;
END vasarlas_pck;
/
