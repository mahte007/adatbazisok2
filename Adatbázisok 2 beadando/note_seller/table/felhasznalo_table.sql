CREATE TABLE felhasznalo(
       id NUMBER PRIMARY KEY,
       vezeteknev VARCHAR2(250 CHAR) NOT NULL,
       keresztnev VARCHAR2(250 CHAR) NOT NULL,
       email VARCHAR2(250 CHAR) NOT NULL,
       telefon VARCHAR2(250 CHAR) NOT NULL,
       orszag_kod VARCHAR2(40 CHAR),
       varos VARCHAR2(250 CHAR),
       lakhely VARCHAR2(250 CHAR),
       egyetem_id NUMBER
)
TABLESPACE users;
