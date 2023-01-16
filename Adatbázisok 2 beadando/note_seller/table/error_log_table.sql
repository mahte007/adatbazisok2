CREATE TABLE error_log(
  id              NUMBER,
  error_ideje     DATE DEFAULT SYSDATE,
  error_uzenet    VARCHAR2(2000 CHAR),
  error_ertek     VARCHAR2(2000 CHAR),
  api             VARCHAR2(100 CHAR)
);
