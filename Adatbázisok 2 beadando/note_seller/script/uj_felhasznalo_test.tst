PL/SQL Developer Test script 3.0
12
begin
  -- Call the procedure
  felhasznalo_pck.uj_felhasznalo(p_felhasznalo_id => :p_felhasznalo_id,
                                 p_vezeteknev => :p_vezeteknev,
                                 p_keresztnev => :p_keresztnev,
                                 p_email => :p_email,
                                 p_telefon => :p_telefon,
                                 p_orszagkod => :p_orszagkod,
                                 p_varos => :p_varos,
                                 p_lakhely => :p_lakhely,
                                 p_egyetem_id => :p_egyetem_id);
end;
9
p_felhasznalo_id
1
5
4
p_vezeteknev
0
5
p_keresztnev
1
Béla
5
p_email
1
bela@gmail.com
5
p_telefon
1
06702135123
5
p_orszagkod
1
HU
5
p_varos
1
Kecskemét
5
p_lakhely
1
Hosszú utca 21.
5
p_egyetem_id
1
1
4
0
