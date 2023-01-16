ALTER TABLE felhasznalo
      ADD CONSTRAINT ck_email
      CHECK (REGEXP_LIKE (email, '^[A-Za-z]+[A-Za-z0-9.]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$'));
      
      
