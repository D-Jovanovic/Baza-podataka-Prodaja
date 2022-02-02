INSERT INTO `prodaja`.`drzava` (`drzava`) VALUES ('Srbija');
INSERT INTO `prodaja`.`drzava` (`drzava`) VALUES ('Hrvatska');
INSERT INTO `prodaja`.`drzava` (`drzava`) VALUES ('Bosna');

INSERT INTO `prodaja`.`grad` (`grad`, `Drzava_idDrzava`) VALUES ('Beograd', '1');
INSERT INTO `prodaja`.`grad` (`grad`, `Drzava_idDrzava`) VALUES ('Novi Sad', '1');
INSERT INTO `prodaja`.`grad` (`grad`, `Drzava_idDrzava`) VALUES ('Subotica', '1');
INSERT INTO `prodaja`.`grad` (`grad`, `Drzava_idDrzava`) VALUES ('Nis', '1');
INSERT INTO `prodaja`.`grad` (`grad`, `Drzava_idDrzava`) VALUES ('Zagreb', '2');
INSERT INTO `prodaja`.`grad` (`grad`, `Drzava_idDrzava`) VALUES ('Sarajveo', '3');

INSERT INTO `prodaja`.`adresa` (`ulica_i_broj`, `Grad_idGrad`) VALUES ('Brace Krkljusa 21', '2');
INSERT INTO `prodaja`.`adresa` (`ulica_i_broj`, `fiksni_telefon`, `Grad_idGrad`) VALUES ('Save Kovacevica 62', '69741', '1');
INSERT INTO `prodaja`.`adresa` (`ulica_i_broj`, `Grad_idGrad`) VALUES ('Janka Cmelika', '3');
INSERT INTO `prodaja`.`adresa` (`ulica_i_broj`, `Grad_idGrad`) VALUES ('Zagrebska', '4');
INSERT INTO `prodaja`.`adresa` (`ulica_i_broj`, `fiksni_telefon`, `Grad_idGrad`) VALUES ('Kis', '5544125', '5');

INSERT INTO `prodaja`.`zaposleni` (`ime`, `prezime`, `funkcija`, `datum_rodjenja`, `datum_zaposlenja`, `mobilni_telefon`, `email`, `korisnicko_ime`, `lozinka`, `napomena`, `Adresa_idAdresa`) VALUES ('Janko', 'Jankovic', 'menadzer', '1990-01-01', '2019-01-01', '06718114', 'janko@gmail.com', 'janko', 'janko', 'novi', '2');
INSERT INTO `prodaja`.`zaposleni` (`ime`, `prezime`, `funkcija`, `datum_rodjenja`, `datum_zaposlenja`, `mobilni_telefon`, `email`, `korisnicko_ime`, `lozinka`, `napomena`, `Adresa_idAdresa`) VALUES ('Petar', 'Peric', 'radnik', '1990-01-01', '2019-01-01', '06718114', 'peric@gmail.com', 'peric', 'peric', 'novi', '3');
INSERT INTO `prodaja`.`zaposleni` (`ime`, `prezime`, `funkcija`, `datum_rodjenja`, `datum_zaposlenja`, `mobilni_telefon`, `email`, `korisnicko_ime`, `lozinka`, `napomena`, `Adresa_idAdresa`) VALUES ('Marko', 'Markovic', 'magacioner', '1990-01-01', '2019-01-01', '06718114', 'markovic@gmail.com', 'markovic', 'markovic', 'novi', '4');

INSERT INTO `prodaja`.`distributer` (`kompanija`, `kontakt_ime`, `kontakt_funkcija`, `telefon`, `email`, `pib`, `ziroracun`, `Adresa_idAdresa`) VALUES ('Hemofarm', 'Jovan Jovanovic', 'prodaja', '06433571', 'jovan@gmail.com', '56547', '1515151', '1');
INSERT INTO `prodaja`.`distributer` (`kompanija`, `kontakt_ime`, `kontakt_funkcija`, `telefon`, `email`, `web`, `pib`, `ziroracun`, `Adresa_idAdresa`) VALUES ('Dis', 'Marko Radic', 'direktor', '666478', 'markodir@gmail.com', 'dis.rs', '77788', '66144', '3');

INSERT INTO `prodaja`.`kupac` (`kontakt_ime`, `kontakt_funkcija`, `pravno_lice`, `telefon`, `email`, `Adresa_idAdresa`) VALUES ('Rade Radic', 'vlasnik', '0', '0649974', 'rad2@gmail.com', '3');
INSERT INTO `prodaja`.`kupac` (`kontakt_ime`, `kontakt_funkcija`, `pravno_lice`, `kompanija`, `pib`, `ziroracun`, `telefon`, `email`, `Adresa_idAdresa`) VALUES ('Pera Peric', 'finasije', '1', 'Tehnomanija', '55797', '1515754', '069715677', 'tehnomanija@gmail.com', '4');

INSERT INTO `prodaja`.`kategorija` (`naziv`, `opis`) VALUES ('Automobili', 'prodaja automobila');
INSERT INTO `prodaja`.`kategorija` (`naziv`, `opis`) VALUES ('Racunari', 'prodaja racunara');
INSERT INTO `prodaja`.`kategorija` (`naziv`, `opis`) VALUES ('Bela tehnika', 'prodaja bele tehnike');
INSERT INTO `prodaja`.`kategorija` (`naziv`, `opis`) VALUES ('Knjige', 'prodaja knjiga');

INSERT INTO `prodaja`.`proizvod` (`naziv`, `na_stanju`, `stanje`, `cena`, `popust`, `Kategorija_idKategorija`, `Distributer_idDistributer`) VALUES ('Golf 7 ', '1', '2', '20000', '10%', '1', '1');
INSERT INTO `prodaja`.`proizvod` (`naziv`, `na_stanju`, `stanje`, `cena`, `Kategorija_idKategorija`, `Distributer_idDistributer`) VALUES ('Hp monitor', '1', '20', '100', '2', '2');
INSERT INTO `prodaja`.`proizvod` (`naziv`, `na_stanju`, `stanje`, `cena`, `popust`, `Kategorija_idKategorija`, `Distributer_idDistributer`) VALUES ('Gorenje masina', '0', '0', '50124', '1%', '3', '2');

INSERT INTO `prodaja`.`narudzbadetalji` (`jedinicna_cena`, `kolicina`, `Proizvod_idProizvod`) VALUES ('20000', '1', '1');
INSERT INTO `prodaja`.`narudzbadetalji` (`jedinicna_cena`, `kolicina`, `popust`, `Proizvod_idProizvod`) VALUES ('5000', '5', '10%', '2');

INSERT INTO `prodaja`.`kurirskesluzbe` (`naziv`, `telefon`, `email`, `web`) VALUES ('Bex', '06458', 'bex@gmail.com', 'bex.rs');
INSERT INTO `prodaja`.`kurirskesluzbe` (`naziv`, `telefon`, `email`, `web`) VALUES ('Aks', '664215', 'aks@gmail.com', 'aks.rs');

INSERT INTO `prodaja`.`narudzbena` (`Narudzba Detalji_idNarudzbaDetalji`, `Zaposleni_idZaposleni`, `Kupac_idKupac`, `datum_narucivanja`, `datum_dostave`, `Kurirske Sluzbe_idKurirskeSluzbe`) VALUES ('1', '1', '1', '2020-02-02', '2020-03-03', '1');
INSERT INTO `prodaja`.`narudzbena` (`Narudzba Detalji_idNarudzbaDetalji`, `Zaposleni_idZaposleni`, `Kupac_idKupac`, `datum_narucivanja`, `datum_dostave`, `Kurirske Sluzbe_idKurirskeSluzbe`, `drugi_primaoc`) VALUES ('2', '1', '2', '2020-02-02', '2020-02-03', '2', '');



