-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema artwork
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema artwork
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `artwork` ;
USE `artwork` ;

-- -----------------------------------------------------
-- Table `artwork`.`country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `artwork`.`country` (
  `country_id` INT NOT NULL AUTO_INCREMENT,
  `country_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`country_id`),
  UNIQUE INDEX `country_name_UNIQUE` (`country_name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `artwork`.`artist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `artwork`.`artist` (
  `artist_id` INT NOT NULL AUTO_INCREMENT,
  `artist_fname` VARCHAR(45) NOT NULL,
  `artist_lname` VARCHAR(45) NOT NULL,
  `artist_mname` VARCHAR(45) NULL,
  `dob` DATE NOT NULL,
  `dod` DATE NULL,
  `local` ENUM('y', 'n') NOT NULL,
  `country_country_id` INT NOT NULL,
  PRIMARY KEY (`artist_id`),
  INDEX `fk_artist_country1_idx` (`country_country_id` ASC) VISIBLE,
  CONSTRAINT `fk_artist_country1`
    FOREIGN KEY (`country_country_id`)
    REFERENCES `artwork`.`country` (`country_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `artwork`.`period`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `artwork`.`period` (
  `period_id` INT NOT NULL AUTO_INCREMENT,
  `peridod` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`period_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `artwork`.`art_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `artwork`.`art_type` (
  `art_type_id` INT NOT NULL AUTO_INCREMENT,
  `art_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`art_type_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `artwork`.`wing`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `artwork`.`wing` (
  `wing_id` INT NOT NULL AUTO_INCREMENT,
  `wing_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`wing_id`),
  UNIQUE INDEX `wing_name_UNIQUE` (`wing_name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `artwork`.`artwork`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `artwork`.`artwork` (
  `artwork_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `year` INT NOT NULL,
  `file` VARCHAR(45) NOT NULL,
  `artist_artist_id` INT NOT NULL,
  `period_period_id` INT NOT NULL,
  `art_type_art_type_id` INT NOT NULL,
  `wing_wing_id` INT NOT NULL,
  PRIMARY KEY (`artwork_id`),
  INDEX `fk_artwork_artist_idx` (`artist_artist_id` ASC) VISIBLE,
  INDEX `fk_artwork_period1_idx` (`period_period_id` ASC) VISIBLE,
  INDEX `fk_artwork_art_type1_idx` (`art_type_art_type_id` ASC) VISIBLE,
  UNIQUE INDEX `file_UNIQUE` (`file` ASC) VISIBLE,
  INDEX `fk_artwork_wing1_idx` (`wing_wing_id` ASC) VISIBLE,
  CONSTRAINT `fk_artwork_artist`
    FOREIGN KEY (`artist_artist_id`)
    REFERENCES `artwork`.`artist` (`artist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_artwork_period1`
    FOREIGN KEY (`period_period_id`)
    REFERENCES `artwork`.`period` (`period_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_artwork_art_type1`
    FOREIGN KEY (`art_type_art_type_id`)
    REFERENCES `artwork`.`art_type` (`art_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_artwork_wing1`
    FOREIGN KEY (`wing_wing_id`)
    REFERENCES `artwork`.`wing` (`wing_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `artwork`.`keyword`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `artwork`.`keyword` (
  `keyword_id` INT NOT NULL AUTO_INCREMENT,
  `keyword` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`keyword_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `artwork`.`artwork_has_keyword`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `artwork`.`artwork_has_keyword` (
  `artwork_artwork_id` INT NOT NULL,
  `keyword_keyword_id` INT NOT NULL,
  PRIMARY KEY (`artwork_artwork_id`, `keyword_keyword_id`),
  INDEX `fk_artwork_has_keyword_keyword1_idx` (`keyword_keyword_id` ASC) VISIBLE,
  INDEX `fk_artwork_has_keyword_artwork1_idx` (`artwork_artwork_id` ASC) VISIBLE,
  CONSTRAINT `fk_artwork_has_keyword_artwork1`
    FOREIGN KEY (`artwork_artwork_id`)
    REFERENCES `artwork`.`artwork` (`artwork_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_artwork_has_keyword_keyword1`
    FOREIGN KEY (`keyword_keyword_id`)
    REFERENCES `artwork`.`keyword` (`keyword_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



INSERT INTO country
VALUES 
(DEFAULT, 'Germany'),
(DEFAULT, 'Italy'),
(DEFAULT, 'Spain'),
(DEFAULT, 'France'),
(DEFAULT, 'Greece'),
(DEFAULT, 'United States');

INSERT INTO keyword
VALUES
(DEFAULT, 'flowers'),
(DEFAULT, 'blue'),
(DEFAULT, 'landscape'),
(DEFAULT, 'people'),
(DEFAULT, 'girl'),
(DEFAULT, 'boat');

INSERT INTO wing
VALUES
(DEFAULT, 'Aincent Greece'),
(DEFAULT, 'Renaissance'),
(DEFAULT, 'Aincent Rome'),
(DEFAULT, 'France'),
(DEFAULT, 'World War 2'),
(DEFAULT, 'Spanish History');

INSERT INTO period
VALUES
(DEFAULT, 'Impressionism'),
(DEFAULT, 'Post-Impressionism'),
(DEFAULT, 'Baroque'),
(DEFAULT, 'Dutch Golden Age'),
(DEFAULT, 'High Renaissance'),
(DEFAULT, 'Renaissance');

INSERT INTO art_type
VALUES
(DEFAULT, 'Oil'),
(DEFAULT, 'Tempra'),
(DEFAULT, 'Watercolor'),
(DEFAULT, 'Sculpture'),
(DEFAULT, 'Abstract'),
(DEFAULT, 'Drawing');


INSERT INTO artist(artist_fname, artist_lname, artist_mname, dob, dod, local, country_country_id)
VALUES
('Leonardo', 'da Vinci', NULL, '1452-04-15', '1519-05-02', 'n', 2),
('Pablo', 'Picasso', NULL, '1881-10-25', '1973-04-08', 'n', 3),
('Claude', 'Monet', NULL, '1840-11-14', '1926-12-05', 'n', 4),
('Vincent', 'van Gogh', NULL, '1853-03-30', '1890-07-29', 'n', 5),
('Salvador', 'Dali', NULL, '1904-05-11', '1989-01-23', 'n', 3),
('Michelangelo', 'Buonarroti', NULL, '1475-03-06', '1564-02-18', 'n', 2);


INSERT INTO artwork(title, year, file, artist_artist_id, period_period_id, art_type_art_type_id, wing_wing_id)
VALUES
('Mona Lisa', 1503, 'mona_lisa.jpg', 1, 5, 1, 2),
('Guernica', 1937, 'guernica.jpg', 2, 1, 1, 6),
('Water Lilies', 1916, 'water_lilies.jpg', 3, 1, 3, 4),
('Starry Night', 1889, 'starry_night.jpg', 4, 2, 3, 4),
('The Persistence of Memory', 1931, 'persistence_of_memory.jpg', 5, 2, 1, 6),
('David', 1504, 'david.jpg', 6, 5, 4, 3);

INSERT INTO artwork_has_keyword(artwork_artwork_id, keyword_keyword_id)
VALUES
(1, 4), 
(1, 5), 
(2, 5), 
(2, 4), 
(3, 1), 
(3, 2), 
(4, 2), 
(4, 3), 
(5, 2), 
(5, 3), 
(6, 3), 
(6, 4);


-- Fix the typo in the period table ('peridod' column has 'Impressionism' associated with Guernica, 
-- but Guernica is actually Surrealism)
UPDATE artwork
SET period_period_id = 2
WHERE artwork_id = 2;

-- Update Water Lilies year (the famous series spans many years, 1906 is more commonly cited)
UPDATE artwork
SET year = 1906
WHERE title = 'Water Lilies';

-- Mark Leonardo da Vinci as a local artist
UPDATE artist
SET local = 'y'
WHERE artist_fname = 'Leonardo' AND artist_lname = 'da Vinci';

-- Delete a keyword association from an artwork (remove 'blue' tag from Starry Night)
DELETE FROM artwork_has_keyword
WHERE artwork_artwork_id = 4 AND keyword_keyword_id = 2;

-- Delete a keyword that is no longer needed
DELETE FROM keyword
WHERE keyword = 'boat';

-- Delete an artist (note: you would need to remove their artworks first due to foreign key constraints)
DELETE FROM artwork
WHERE artist_artist_id = 5;

DELETE FROM artist
WHERE artist_fname = 'Salvador' AND artist_lname = 'Dali';


USE artwork;


-- useful for museum curators planning special exhibits focused on specific art periods, helping them quickly see which artworks from a given period are in which wing.
SELECT aw.title, p.peridod, w.wing_name
FROM artwork aw
JOIN period p
ON aw.period_period_id = p.period_id
JOIN wing w
ON aw.wing_wing_id = w.wing_id;


-- This would be useful if the museum wanted to spotlight the artists who were born centuries ago
-- but the same last two digits. In this case it would be for 2004 because I didnt have any artists who were born in '25
SELECT a.artist_fname, a.artist_lname, c.country_name, TIMESTAMPDIFF(YEAR, dob, "2004-12-31") AS years_since_birth
FROM artist a
JOIN country c
ON a.country_country_id = c.country_id
WHERE RIGHT(YEAR(a.dob), 2) = 04;




-- This will give the number of artworks in each period which can be helpful for any number of tasks relating to museum management.
SELECT p.peridod, COUNT(a.artwork_id) AS number_of_artworks
FROM artwork a
JOIN period p
ON a.period_period_id = p.period_id
GROUP BY p.peridod;
