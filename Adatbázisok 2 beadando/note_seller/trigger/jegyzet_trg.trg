create or replace trigger jegyzet_trg
  before insert
  on jegyzetek 
  for each row
begin
  IF :new.id IS NULL
  THEN
    :new.id := jegyzetek_seq.nextval;
  END IF;
  
  IF :new.tanar_neve IS NULL
  THEN
    :new.tanar_neve := 'ISMERETLEN';
  END IF
  ;
end jegyzet_trg;
/
