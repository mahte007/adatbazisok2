create or replace trigger egyetem_trg
  before insert
  on egyetemek 
  for each row
begin
  IF :new.id IS NULL
  THEN
    :new.id := egytemek_seq.nextval;
  END IF;
end egyetem_trg;
/
