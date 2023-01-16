CREATE OR REPLACE PACKAGE pkg_exception IS

  wrong_email_exception EXCEPTION;
  gc_wrong_email_code CONSTANT NUMBER := -20000;
  PRAGMA EXCEPTION_INIT(wrong_email_exception, -20000);

  id_not_found_exception EXCEPTION;
  gc_id_not_found_code CONSTANT NUMBER := -20001;
  PRAGMA EXCEPTION_INIT(id_not_found_exception, -20001);

  dup_id_exception EXCEPTION;
  gc_duplicated_id_code CONSTANT NUMBER := -20002;
  PRAGMA EXCEPTION_INIT(dup_id_exception, -20002);

  university_not_found_exception EXCEPTION;
  gc_university_not_found_code CONSTANT NUMBER := -20003;
  PRAGMA EXCEPTION_INIT(university_not_found_exception, -20003);
  

END pkg_exception;
/
