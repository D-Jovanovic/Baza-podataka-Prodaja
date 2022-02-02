-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema prodaja
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema prodaja
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `prodaja` DEFAULT CHARACTER SET utf8 ;
USE `prodaja` ;

-- -----------------------------------------------------
-- Table `prodaja`.`Drzava`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prodaja`.`Drzava` (
  `idDrzava` INT NOT NULL AUTO_INCREMENT,
  `drzava` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDrzava`),
  UNIQUE INDEX `idDrzava_UNIQUE` (`idDrzava` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `prodaja`.`Grad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prodaja`.`Grad` (
  `idGrad` INT NOT NULL AUTO_INCREMENT,
  `grad` VARCHAR(45) NOT NULL,
  `Drzava_idDrzava` INT NOT NULL,
  PRIMARY KEY (`idGrad`),
  UNIQUE INDEX `idGrad_UNIQUE` (`idGrad` ASC) VISIBLE,
  INDEX `fk_Grad_Drzava_idx` (`Drzava_idDrzava` ASC) VISIBLE,
  CONSTRAINT `fk_Grad_Drzava`
    FOREIGN KEY (`Drzava_idDrzava`)
    REFERENCES `prodaja`.`Drzava` (`idDrzava`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `prodaja`.`Adresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prodaja`.`Adresa` (
  `idAdresa` INT NOT NULL AUTO_INCREMENT,
  `ulica_i_broj` VARCHAR(45) NOT NULL,
  `fiksni_telefon` VARCHAR(45) NULL,
  `Grad_idGrad` INT NOT NULL,
  PRIMARY KEY (`idAdresa`),
  UNIQUE INDEX `idAdresa_UNIQUE` (`idAdresa` ASC) VISIBLE,
  INDEX `fk_Adresa_Grad1_idx` (`Grad_idGrad` ASC) VISIBLE,
  CONSTRAINT `fk_Adresa_Grad1`
    FOREIGN KEY (`Grad_idGrad`)
    REFERENCES `prodaja`.`Grad` (`idGrad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `prodaja`.`Zaposleni`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prodaja`.`Zaposleni` (
  `idZaposleni` INT NOT NULL AUTO_INCREMENT,
  `ime` VARCHAR(45) NOT NULL,
  `prezime` VARCHAR(45) NOT NULL,
  `funkcija` VARCHAR(45) NOT NULL,
  `datum_rodjenja` DATE NOT NULL,
  `datum_zaposlenja` DATE NOT NULL,
  `mobilni_telefon` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `korisnicko_ime` VARCHAR(45) NOT NULL,
  `lozinka` VARCHAR(45) NOT NULL,
  `napomena` VARCHAR(45) NULL,
  `Adresa_idAdresa` INT NOT NULL,
  PRIMARY KEY (`idZaposleni`),
  UNIQUE INDEX `idZaposleni_UNIQUE` (`idZaposleni` ASC) VISIBLE,
  INDEX `fk_Zaposleni_Adresa1_idx` (`Adresa_idAdresa` ASC) VISIBLE,
  CONSTRAINT `fk_Zaposleni_Adresa1`
    FOREIGN KEY (`Adresa_idAdresa`)
    REFERENCES `prodaja`.`Adresa` (`idAdresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `prodaja`.`Kategorija`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prodaja`.`Kategorija` (
  `idKategorija` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(45) NOT NULL,
  `opis` VARCHAR(45) NOT NULL,
  `slika` VARCHAR(45) NULL,
  PRIMARY KEY (`idKategorija`),
  UNIQUE INDEX `idKategorija_UNIQUE` (`idKategorija` ASC) VISIBLE,
  UNIQUE INDEX `naziv_UNIQUE` (`naziv` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `prodaja`.`Distributer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prodaja`.`Distributer` (
  `idDistributer` INT NOT NULL AUTO_INCREMENT,
  `kompanija` VARCHAR(45) NOT NULL,
  `kontakt_ime` VARCHAR(45) NOT NULL,
  `kontakt_funkcija` VARCHAR(45) NOT NULL,
  `telefon` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `web` VARCHAR(45) NULL,
  `pib` VARCHAR(45) NOT NULL,
  `ziroracun` VARCHAR(45) NOT NULL,
  `Adresa_idAdresa` INT NOT NULL,
  PRIMARY KEY (`idDistributer`),
  UNIQUE INDEX `idDistributer_UNIQUE` (`idDistributer` ASC) VISIBLE,
  INDEX `fk_Distributer_Adresa1_idx` (`Adresa_idAdresa` ASC) VISIBLE,
  CONSTRAINT `fk_Distributer_Adresa1`
    FOREIGN KEY (`Adresa_idAdresa`)
    REFERENCES `prodaja`.`Adresa` (`idAdresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `prodaja`.`Proizvod`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prodaja`.`Proizvod` (
  `idProizvod` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(45) NOT NULL,
  `na_stanju` TINYINT NOT NULL,
  `stanje` VARCHAR(45) NOT NULL,
  `cena` FLOAT NOT NULL,
  `popust` VARCHAR(45) NULL,
  `Kategorija_idKategorija` INT NOT NULL,
  `Distributer_idDistributer` INT NOT NULL,
  PRIMARY KEY (`idProizvod`),
  UNIQUE INDEX `idProizvod_UNIQUE` (`idProizvod` ASC) VISIBLE,
  INDEX `fk_Proizvod_Kategorija1_idx` (`Kategorija_idKategorija` ASC) VISIBLE,
  INDEX `fk_Proizvod_Distributer1_idx` (`Distributer_idDistributer` ASC) VISIBLE,
  CONSTRAINT `fk_Proizvod_Kategorija1`
    FOREIGN KEY (`Kategorija_idKategorija`)
    REFERENCES `prodaja`.`Kategorija` (`idKategorija`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Proizvod_Distributer1`
    FOREIGN KEY (`Distributer_idDistributer`)
    REFERENCES `prodaja`.`Distributer` (`idDistributer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `prodaja`.`NarudzbaDetalji`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prodaja`.`NarudzbaDetalji` (
  `idNarudzbaDetalji` INT NOT NULL AUTO_INCREMENT,
  `jedinicna_cena` VARCHAR(45) NOT NULL,
  `kolicina` VARCHAR(45) NOT NULL,
  `popust` VARCHAR(45) NULL,
  `Proizvod_idProizvod` INT NOT NULL,
  PRIMARY KEY (`idNarudzbaDetalji`),
  UNIQUE INDEX `idNarudzbaDetalji_UNIQUE` (`idNarudzbaDetalji` ASC) VISIBLE,
  INDEX `fk_Narudzba Detalji_Proizvod1_idx` (`Proizvod_idProizvod` ASC) VISIBLE,
  CONSTRAINT `fk_Narudzba Detalji_Proizvod1`
    FOREIGN KEY (`Proizvod_idProizvod`)
    REFERENCES `prodaja`.`Proizvod` (`idProizvod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `prodaja`.`Kupac`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prodaja`.`Kupac` (
  `idKupac` INT NOT NULL AUTO_INCREMENT,
  `kontakt_ime` VARCHAR(45) NOT NULL,
  `kontakt_funkcija` VARCHAR(45) NOT NULL,
  `pravno_lice` TINYINT NOT NULL,
  `kompanija` VARCHAR(45) NULL,
  `pib` VARCHAR(45) NULL,
  `ziroracun` VARCHAR(45) NULL,
  `telefon` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `Adresa_idAdresa` INT NOT NULL,
  PRIMARY KEY (`idKupac`),
  UNIQUE INDEX `idKupac_UNIQUE` (`idKupac` ASC) VISIBLE,
  INDEX `fk_Kupac_Adresa1_idx` (`Adresa_idAdresa` ASC) VISIBLE,
  CONSTRAINT `fk_Kupac_Adresa1`
    FOREIGN KEY (`Adresa_idAdresa`)
    REFERENCES `prodaja`.`Adresa` (`idAdresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `prodaja`.`KurirskeSluzbe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prodaja`.`KurirskeSluzbe` (
  `idKurirskeSluzbe` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(45) NOT NULL,
  `telefon` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `web` VARCHAR(45) NULL,
  PRIMARY KEY (`idKurirskeSluzbe`),
  UNIQUE INDEX `idKurirskeSluzbe_UNIQUE` (`idKurirskeSluzbe` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `prodaja`.`Narudzbena`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prodaja`.`Narudzbena` (
  `idNarudzbena` INT NOT NULL AUTO_INCREMENT,
  `Narudzba Detalji_idNarudzbaDetalji` INT NOT NULL,
  `Zaposleni_idZaposleni` INT NOT NULL,
  `Kupac_idKupac` INT NOT NULL,
  `datum_narucivanja` DATE NOT NULL,
  `datum_dostave` DATE NOT NULL,
  `Kurirske Sluzbe_idKurirskeSluzbe` INT NOT NULL,
  `drugi_primaoc` VARCHAR(45) NULL,
  `druga_adresa` VARCHAR(45) NULL,
  `drugi_telefon` VARCHAR(45) NULL,
  PRIMARY KEY (`idNarudzbena`),
  UNIQUE INDEX `idNarudzbena_UNIQUE` (`idNarudzbena` ASC) VISIBLE,
  INDEX `fk_Narudzbena_Narudzba Detalji1_idx` (`Narudzba Detalji_idNarudzbaDetalji` ASC) VISIBLE,
  INDEX `fk_Narudzbena_Zaposleni1_idx` (`Zaposleni_idZaposleni` ASC) VISIBLE,
  INDEX `fk_Narudzbena_Kupac1_idx` (`Kupac_idKupac` ASC) VISIBLE,
  INDEX `fk_Narudzbena_Kurirske Sluzbe1_idx` (`Kurirske Sluzbe_idKurirskeSluzbe` ASC) VISIBLE,
  CONSTRAINT `fk_Narudzbena_Narudzba Detalji1`
    FOREIGN KEY (`Narudzba Detalji_idNarudzbaDetalji`)
    REFERENCES `prodaja`.`NarudzbaDetalji` (`idNarudzbaDetalji`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Narudzbena_Zaposleni1`
    FOREIGN KEY (`Zaposleni_idZaposleni`)
    REFERENCES `prodaja`.`Zaposleni` (`idZaposleni`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Narudzbena_Kupac1`
    FOREIGN KEY (`Kupac_idKupac`)
    REFERENCES `prodaja`.`Kupac` (`idKupac`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Narudzbena_Kurirske Sluzbe1`
    FOREIGN KEY (`Kurirske Sluzbe_idKurirskeSluzbe`)
    REFERENCES `prodaja`.`KurirskeSluzbe` (`idKurirskeSluzbe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `prodaja` ;

-- -----------------------------------------------------
-- Placeholder table for view `prodaja`.`pogled_zaposleni`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prodaja`.`pogled_zaposleni` (`ID` INT, `Naziv` INT, `Adresa` INT, `Funkcija` INT, `Starsot` INT, `Zaposlen` INT, `Telefon` INT, `Email` INT, `Napomena` INT);

-- -----------------------------------------------------
-- Placeholder table for view `prodaja`.`pogled_proizvod`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prodaja`.`pogled_proizvod` (`ID` INT, `Naziv` INT, `Dostupnost` INT, `Cena` INT, `Popust` INT, `Kategorija` INT, `Distributer` INT);

-- -----------------------------------------------------
-- View `prodaja`.`pogled_zaposleni`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `prodaja`.`pogled_zaposleni`;
USE `prodaja`;
CREATE  OR REPLACE VIEW pogled_zaposleni AS
SELECT 
        prodaja.zaposleni.idZaposleni AS ID,
        CONCAT(prodaja.zaposleni.ime,
                _utf8mb3 ' ',
                prodaja.zaposleni.prezime) AS Naziv,
		CONCAT(prodaja.adresa.ulica_i_broj,
				_utf8mb3 ' , ',
                prodaja.grad.grad,
                _utf8mb3 ' , ',
                prodaja.drzava.drzava) AS Adresa,
		prodaja.zaposleni.funkcija AS Funkcija,
        prodaja.zaposleni.datum_rodjenja AS Starsot,
        prodaja.zaposleni.datum_zaposlenja AS Zaposlen,
        prodaja.zaposleni.mobilni_telefon AS Telefon,
        prodaja.zaposleni.email AS Email,
        prodaja.zaposleni.napomena AS Napomena
        
FROM
	(((prodaja.zaposleni
		JOIN adresa ON ((zaposleni.Adresa_idAdresa = adresa.idAdresa)))
        JOIN grad ON ((adresa.idAdresa = grad.idGrad)))
        JOIN drzava ON ((grad.Drzava_idDrzava = drzava.idDrzava)));

-- -----------------------------------------------------
-- View `prodaja`.`pogled_proizvod`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `prodaja`.`pogled_proizvod`;
USE `prodaja`;
CREATE  OR REPLACE VIEW pogled_proizvod AS
SELECT 
        prodaja.proizvod.idProizvod AS ID,
		prodaja.proizvod.naziv AS Naziv,
        prodaja.proizvod.na_stanju AS Dostupnost,
        prodaja.proizvod.cena AS Cena,
        prodaja.proizvod.popust AS Popust,
        prodaja.kategorija.naziv AS Kategorija,
        prodaja.distributer.kompanija AS Distributer
        
FROM
	((prodaja.proizvod
		JOIN kategorija ON ((proizvod.Kategorija_idKategorija = kategorija.idKategorija)))
        JOIN distributer ON ((proizvod.Distributer_idDistributer = distributer.idDistributer)));

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
