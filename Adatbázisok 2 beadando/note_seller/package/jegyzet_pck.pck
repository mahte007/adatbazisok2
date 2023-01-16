CREATE OR REPLACE PACKAGE jegyzet_pck IS
  PROCEDURE uj_jegyzet(p_jegyzet_id     IN NUMBER
                      ,p_szak           IN VARCHAR2
                      ,p_tantargy       IN VARCHAR2
                      ,p_tanar_neve     IN VARCHAR2
                      ,p_felev          IN NUMBER
                      ,p_feltolto_id    IN NUMBER
                      ,p_ar             IN NUMBER
                      ,p_jegyzet_nyelve IN VARCHAR2
                      ,p_egyetem_id     IN NUMBER);

  PROCEDURE jegyzet_torlese(p_jegyzet_id IN NUMBER);
END jegyzet_pck;
/
CREATE OR REPLACE PACKAGE BODY jegyzet_pck IS

  gc_package_name CONSTANT VARCHAR2(30) := 'jegyzet_pck';

  PROCEDURE uj_jegyzet(p_jegyzet_id     IN NUMBER
                      ,p_szak           IN VARCHAR2
                      ,p_tantargy       IN VARCHAR2
                      ,p_tanar_neve     IN VARCHAR2
                      ,p_felev          IN NUMBER
                      ,p_feltolto_id    IN NUMBER
                      ,p_ar             IN NUMBER
                      ,p_jegyzet_nyelve IN VARCHAR2
                      ,p_egyetem_id     IN NUMBER) IS
  
    university_not_found_exception EXCEPTION;
    v_count NUMBER;
    c_proc_name CONSTANT VARCHAR2(30) := 'uj_jegyzet';
  
  BEGIN
  
    SELECT COUNT(*)
      INTO v_count
      FROM egyetemek
     WHERE egyetemek.id = p_egyetem_id;
  
    IF v_count = 0
    THEN
      RAISE university_not_found_exception;
    END IF;
  
    INSERT INTO jegyzetek
      (id
      ,szak
      ,tantargy
      ,tanar_neve
      ,felev
      ,feltolto_id
      ,feltoltes_datuma
      ,ar
      ,jegyzet_nyelve
      ,egyetem_id)
    VALUES
      (p_jegyzet_id
      ,p_szak
      ,p_tantargy
      ,p_tanar_neve
      ,p_felev
      ,p_feltolto_id
      ,trunc(SYSDATE)
      ,nvl(p_ar, 500)
      ,p_jegyzet_nyelve
      ,p_egyetem_id);
    COMMIT;
  
  EXCEPTION
    WHEN dup_val_on_index THEN
      raise_application_error(pkg_exception.gc_duplicated_id_code,
                              'A megadott ID-val már található jegyzet: ' ||
                              p_jegyzet_id);
    
    WHEN university_not_found_exception THEN
      raise_application_error(pkg_exception.gc_university_not_found_code,
                              'A megadott egyetem ID nem található:  ' ||
                              p_egyetem_id);
    WHEN OTHERS THEN
      pkg_error_log.log_error(p_err_uzenet => SQLERRM || chr(10) || chr(10) ||
                                              dbms_utility.format_error_backtrace,
                              p_err_ertek  => 'p_jegyzet_id = ' ||
                                              p_jegyzet_id || chr(10) ||
                                              'p_feltolto_id = ' ||
                                              p_feltolto_id,
                              p_api        => gc_package_name || '.' ||
                                              c_proc_name);
    
      RAISE;
    
  END uj_jegyzet;

  PROCEDURE jegyzet_torlese(p_jegyzet_id IN NUMBER) IS
  
    v_jegyzet_id NUMBER;
    c_proc_name CONSTANT VARCHAR2(30) := 'jegyzet_torlese';
  
  BEGIN
  
    SELECT k.id
      INTO v_jegyzet_id
      FROM jegyzetek k
     WHERE k.id = p_jegyzet_id;
  
    DELETE FROM jegyzetek WHERE id = p_jegyzet_id;
    COMMIT;
  
  EXCEPTION
    WHEN no_data_found THEN
      raise_application_error(pkg_exception.gc_id_not_found_code,
                              'Nem található jegyzet a kapott ID-val: ' ||
                              p_jegyzet_id);
    WHEN OTHERS THEN
      pkg_error_log.log_error(p_err_uzenet => SQLERRM || chr(10) || chr(10) ||
                                              dbms_utility.format_error_backtrace,
                              p_err_ertek  => 'p_jegyzet_id = ' ||
                                              p_jegyzet_id,
                              p_api        => gc_package_name || '.' ||
                                              c_proc_name);
      RAISE;
  END jegyzet_torlese;

END jegyzet_pck;
/
