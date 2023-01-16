create or replace trigger felhasznalo_trg
  before insert
  on felhasznalo 
  for each row
begin
  IF :new.id IS NULL
  THEN
    :new.id := felhasznalo_seq.nextval;
  END IF;
end felhasznalo_trg;
/
