PL/SQL Developer Test script 3.0
7
begin
  -- Call the procedure
  egyetem_pck.uj_egyetem(p_egyetem_id => :p_egyetem_id,
                         p_egyetem_neve => :p_egyetem_neve,
                         p_orszag_kod => :p_orszag_kod,
                         p_varos => :p_varos);
end;
4
p_egyetem_id
0
4
p_egyetem_neve
1
Pannon Egyetem
5
p_orszag_kod
1
HU
5
p_varos
1
Zalaegerszeg
5
0
