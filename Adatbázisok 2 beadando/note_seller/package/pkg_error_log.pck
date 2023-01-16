CREATE OR REPLACE PACKAGE pkg_error_log IS

  PROCEDURE log_error(p_err_uzenet VARCHAR2
                     ,p_err_ertek   VARCHAR2
                     ,p_api         VARCHAR2);

END pkg_error_log;
/
CREATE OR REPLACE PACKAGE BODY pkg_error_log IS

  PROCEDURE log_error(p_err_uzenet VARCHAR2
                     ,p_err_ertek   VARCHAR2
                     ,p_api         VARCHAR2) IS
    PRAGMA AUTONOMOUS_TRANSACTION;
  BEGIN
    INSERT INTO error_log
      (id
      ,error_uzenet
      ,error_ertek
      ,api)
    VALUES
      (error_log_seq.nextval
      ,p_err_uzenet
      ,p_err_ertek
      ,p_api);
  
    COMMIT;
  END log_error;

END pkg_error_log;
/
