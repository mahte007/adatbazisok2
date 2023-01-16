DECLARE
  l_cnt NUMBER;
BEGIN
  SELECT COUNT(*) INTO l_cnt FROM dba_users t WHERE t.username='NOTE_SALER';
  IF l_cnt=1 THEN 
    EXECUTE IMMEDIATE 'DROP USER note_saler CASCADE';
  END IF;
END;
/
CREATE USER note_saler
  IDENTIFIED BY 12345678
  DEFAULT TABLESPACE USERS
  QUOTA UNLIMITED ON users
;

GRANT CREATE SESSION TO note_saler;
GRANT CREATE TABLE TO note_saler;
GRANT CREATE VIEW TO note_saler;
GRANT CREATE SEQUENCE TO note_saler;
GRANT CREATE PROCEDURE TO note_saler;
GRANT CREATE TYPE TO note_saler;
GRANT EXECUTE ON dbms_lock TO note_saler;
GRANT CREATE TRIGGER TO note_saler;
GRANT EXECUTE ON dbms_scheduler TO note_saler;
GRANT CREATE JOB TO note_saler;
grant DEBUG CONNECT SESSION to note_saler;
