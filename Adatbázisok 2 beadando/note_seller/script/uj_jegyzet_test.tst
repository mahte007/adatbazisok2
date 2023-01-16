PL/SQL Developer Test script 3.0
13
begin
  -- Call the procedure
  jegyzet_pck.uj_jegyzet(p_jegyzet_id => :p_jegyzet_id,
                         p_szak => :p_szak,
                         p_tantargy => :p_tantargy,
                         p_tanar_neve => :p_tanar_neve,
                         p_felev => :p_felev,
                         p_feltolto_id => :p_feltolto_id,
                         p_ar => :p_ar,
                         p_jegyzet_nyelve => :p_jegyzet_nyelve,
                         p_vevok_szama => :p_vevok_szama,
                         p_egyetem_id => :p_egyetem_id);
end;
10
p_jegyzet_id
0
4
p_szak
1
Mérnökinformatikus
5
p_tantargy
1
Mûszaki matematika 1
5
p_tanar_neve
1
Horváth Adrienn
5
p_felev
1
2
4
p_feltolto_id
1
4
4
p_ar
0
4
p_jegyzet_nyelve
1
magyar
5
p_vevok_szama
0
4
p_egyetem_id
1
1
4
0
