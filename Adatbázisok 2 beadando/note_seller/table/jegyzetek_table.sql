CREATE TABLE jegyzetek(
       id NUMBER PRIMARY KEY,
       szak VARCHAR2(250 CHAR) NOT NULL,
       tantargy VARCHAR2(250 CHAR) NOT NULL,
       tanar_neve VARCHAR2(250 CHAR),
       felev NUMBER,
       feltolto_id NUMBER,
       feltoltes_datuma DATE,
       ar NUMBER,
       jegyzet_nyelve VARCHAR2(50 CHAR),
       vevok_szama NUMBER DEFAULT 0,
       egyetem_id NUMBER
)
TABLESPACE users;
