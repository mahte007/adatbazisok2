CREATE OR REPLACE TYPE ty_jegyzet_statisztika AS OBJECT
(
  tantargy_nev            VARCHAR2(250),
  feltolto_neve           VARCHAR(250),
  eladott_jegyzetek_szama NUMBER,
  bevetel                 NUMBER,

  CONSTRUCTOR FUNCTION ty_jegyzet_statisztika RETURN SELF AS RESULT
)
/
CREATE OR REPLACE TYPE BODY ty_jegyzet_statisztika IS

  CONSTRUCTOR FUNCTION ty_jegyzet_statisztika RETURN SELF AS RESULT IS
  BEGIN
    RETURN;
  END;

END;
/
