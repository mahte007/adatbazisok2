CREATE TABLE egyetemek(
       id NUMBER PRIMARY KEY,
       egyetem_neve VARCHAR2(250 CHAR),
       orszag_kod VARCHAR2(40 CHAR),
       varos VARCHAR2(250 CHAR)
)
TABLESPACE users;
