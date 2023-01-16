CREATE OR REPLACE PACKAGE felhasznalo_pck IS

  PROCEDURE uj_felhasznalo(p_felhasznalo_id IN NUMBER
                          ,p_vezeteknev     IN VARCHAR2
                          ,p_keresztnev     IN VARCHAR2
                          ,p_email          IN VARCHAR2
                          ,p_telefon        IN VARCHAR2
                          ,p_orszagkod      IN VARCHAR2
                          ,p_varos          IN VARCHAR2
                          ,p_lakhely        IN VARCHAR2
                          ,p_egyetem_id     IN NUMBER);

  PROCEDURE felhasznalo_torlese(p_felhasznalo_id IN NUMBER);

END felhasznalo_pck;
/
CREATE OR REPLACE PACKAGE BODY felhasznalo_pck IS

  gc_package_name CONSTANT VARCHAR2(30) := 'felhasznalo_pck';

  PROCEDURE uj_felhasznalo(p_felhasznalo_id IN NUMBER
                          ,p_vezeteknev     IN VARCHAR2
                          ,p_keresztnev     IN VARCHAR2
                          ,p_email          IN VARCHAR2
                          ,p_telefon        IN VARCHAR2
                          ,p_orszagkod      IN VARCHAR2
                          ,p_varos          IN VARCHAR2
                          ,p_lakhely        IN VARCHAR2
                          ,p_egyetem_id     IN NUMBER) IS
  
    university_not_found_exception EXCEPTION;
    wrong_email_exception          EXCEPTION;
    v_count NUMBER;
    c_proc_name CONSTANT VARCHAR2(30) := 'uj_felhasznalo';
  
  BEGIN
    SELECT COUNT(*)
      INTO v_count
      FROM egyetemek
     WHERE egyetemek.id = p_egyetem_id;
  
    IF v_count = 0
    THEN
      RAISE university_not_found_exception;
    END IF;
  
    IF NOT
        regexp_like(p_email,
                    '^[A-Za-z]+[A-Za-z0-9.]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$')
    THEN
      RAISE wrong_email_exception;
    END IF;
  
    INSERT INTO felhasznalo
      (id
      ,vezeteknev
      ,keresztnev
      ,email
      ,telefon
      ,orszag_kod
      ,varos
      ,lakhely
      ,egyetem_id)
    VALUES
      (p_felhasznalo_id
      ,p_vezeteknev
      ,p_keresztnev
      ,p_email
      ,p_telefon
      ,p_orszagkod
      ,p_varos
      ,p_lakhely
      ,p_egyetem_id);
    COMMIT;
  EXCEPTION
    WHEN dup_val_on_index THEN
      raise_application_error(pkg_exception.gc_duplicated_id_code,
                              'A megadott ID-val már található felhasználó: ' ||
                              p_felhasznalo_id);
    
    WHEN university_not_found_exception THEN
      raise_application_error(pkg_exception.gc_university_not_found_code,
                              'A megadott egyetem ID nem található:  ' ||
                              p_egyetem_id);
    
    WHEN wrong_email_exception THEN
      raise_application_error(pkg_exception.gc_wrong_email_code,
                              'Hibás e-mail cím formátum:  ' || p_email);
    WHEN OTHERS THEN
      pkg_error_log.log_error(p_err_uzenet => SQLERRM || chr(10) || chr(10) ||
                                              dbms_utility.format_error_backtrace,
                              p_err_ertek  => 'p_felhaszanlo_id = ' ||
                                              p_felhasznalo_id || chr(10) ||
                                              'p_vezeteknev = ' || p_vezeteknev ||
                                              chr(10) || 'p_keresztnev = ' ||
                                              p_keresztnev,
                              p_api        => gc_package_name || '.' ||
                                              c_proc_name);
    
      RAISE;
  END uj_felhasznalo;

  PROCEDURE felhasznalo_torlese(p_felhasznalo_id IN NUMBER) IS
  
    v_felhasznalo_id NUMBER;
    c_proc_name CONSTANT VARCHAR2(30) := 'felhasznalo_torlese';
  
  BEGIN
    SELECT f.id
      INTO v_felhasznalo_id
      FROM felhasznalo f
     WHERE f.id = p_felhasznalo_id;
    DELETE FROM felhasznalo WHERE id = p_felhasznalo_id;
    COMMIT;
  
  EXCEPTION
    WHEN no_data_found THEN
      raise_application_error(pkg_exception.gc_id_not_found_code,
                              'Nem található felhasználó a kapott ID-val: ' ||
                              p_felhasznalo_id);
    WHEN OTHERS THEN
      pkg_error_log.log_error(p_err_uzenet => SQLERRM || chr(10) || chr(10) ||
                                              dbms_utility.format_error_backtrace,
                              p_err_ertek  => 'p_felhaszanlo_id = ' ||
                                              p_felhasznalo_id,
                              p_api        => gc_package_name || '.' ||
                                              c_proc_name);
      RAISE;
  END felhasznalo_torlese;

END felhasznalo_pck;
/
