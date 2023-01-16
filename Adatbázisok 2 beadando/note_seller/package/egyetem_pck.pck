CREATE OR REPLACE PACKAGE egyetem_pck IS
  PROCEDURE uj_egyetem(p_egyetem_id   IN NUMBER
                      ,p_egyetem_neve IN VARCHAR2
                      ,p_orszag_kod   IN VARCHAR2
                      ,p_varos        IN VARCHAR2);

  PROCEDURE egyetem_torlese(p_egyetem_id IN NUMBER);

END egyetem_pck;
/
CREATE OR REPLACE PACKAGE BODY egyetem_pck IS

  gc_package_name CONSTANT VARCHAR2(30) := 'egyetem_pck';

  PROCEDURE uj_egyetem(p_egyetem_id   IN NUMBER
                      ,p_egyetem_neve IN VARCHAR2
                      ,p_orszag_kod   IN VARCHAR2
                      ,p_varos        IN VARCHAR2) IS
  
    c_proc_name CONSTANT VARCHAR2(30) := 'uj_egyetem';
  
  BEGIN
    INSERT INTO egyetemek
      (id
      ,egyetem_neve
      ,orszag_kod
      ,varos)
    VALUES
      (p_egyetem_id
      ,p_egyetem_neve
      ,p_orszag_kod
      ,p_varos);
    COMMIT;
  
  EXCEPTION
    WHEN dup_val_on_index THEN
      raise_application_error(pkg_exception.gc_duplicated_id_code,
                              'A megadott ID-val már található egyetem: ' ||
                              p_egyetem_id);
    WHEN OTHERS THEN
      pkg_error_log.log_error(p_err_uzenet => SQLERRM || chr(10) || chr(10) ||
                                              dbms_utility.format_error_backtrace,
                              p_err_ertek  => 'p_egyetem_id = ' ||
                                              p_egyetem_id || chr(10) ||
                                              'p_egyetem_neve = ' ||
                                              p_egyetem_neve,
                              p_api        => gc_package_name || '.' ||
                                              c_proc_name);
      RAISE;
  END uj_egyetem;

  PROCEDURE egyetem_torlese(p_egyetem_id IN NUMBER) IS
  
    v_egyetem_id NUMBER;
    c_proc_name CONSTANT VARCHAR2(30) := 'egyetem_torlese';
  
  BEGIN
    SELECT k.id
      INTO v_egyetem_id
      FROM egyetemek k
     WHERE k.id = p_egyetem_id;
  
    DELETE FROM egyetemek WHERE id = p_egyetem_id;
    COMMIT;
  
  EXCEPTION
    WHEN no_data_found THEN
      raise_application_error(pkg_exception.gc_id_not_found_code,
                              'Nem található egyetem a kapott ID-val: ' ||
                              p_egyetem_id);
    WHEN OTHERS THEN
      pkg_error_log.log_error(p_err_uzenet => SQLERRM || chr(10) || chr(10) ||
                                              dbms_utility.format_error_backtrace,
                              p_err_ertek  => 'p_egyetem_id = ' ||
                                              p_egyetem_id,
                              p_api        => gc_package_name || '.' ||
                                              c_proc_name);
      RAISE;
  END egyetem_torlese;
END egyetem_pck;
/
