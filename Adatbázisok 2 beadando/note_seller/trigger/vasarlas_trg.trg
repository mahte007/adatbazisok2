create or replace trigger vasarlas_trg
  before insert
  on vasarlasok 
  for each row
begin
  IF :new.id IS NULL
  THEN
    :new.id := vasarlasok_seq.nextval;
  END IF;
end vasarlas_trg;
/
