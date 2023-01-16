ALTER TABLE felhasznalo ADD CONSTRAINT fk_egyetem_id
    FOREIGN KEY(egyetem_id) REFERENCES egyetemek(id);
    
ALTER TABLE jegyzetek ADD CONSTRAINT fk_egyetem_id
    FOREIGN KEY(egyetem_id) REFERENCES egyetemek(id);
    
ALTER TABLE jegyzetek ADD CONSTRAINT fk_felhasznalo_id
    FOREIGN KEY(feltolto_id) REFERENCES felhasznalo(id);
    
ALTER TABLE vasarlasok ADD CONSTRAINT fk_felhasznalo_id
    FOREIGN KEY(felhasznalo_id) REFERENCES felhasznalo(id);
    
ALTER TABLE vasarlasok ADD CONSTRAINT fk_jegyzet_id
    FOREIGN KEY(jegyzet_id) REFERENCES jegyzetek(id);
