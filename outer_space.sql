-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE galaxies
(
  galaxy_id SERIAL PRIMARY KEY,
  galaxy_name TEXT NOT NULL
);

CREATE TABLE planets
(
  planet_id SERIAL PRIMARY KEY,
  planet_name TEXT NOT NULL,
  orbital_period_years FLOAT NOT NULL,
  orbits_around TEXT NOT NULL,
  galaxy_id INT,
  FOREIGN KEY (galaxy_id) REFERENCES galaxies(galaxy_id)
);

CREATE TABLE moons
(
  moon_id SERIAL PRIMARY KEY,
  moon_name TEXT NOT NULL,
  planet_id INT,
  FOREIGN KEY (planet_id) REFERENCES planets(planet_id)
);

INSERT INTO galaxies (galaxy_name)
VALUES
  ('Milky Way');

INSERT INTO planets (planet_name, orbital_period_years, orbits_around, galaxy_id)
VALUES
  ('Earth', 1.00, 'The Sun', 1), -- 1 is the ID of Milky Way
  ('Mars', 1.88, 'The Sun', 1),
  ('Venus', 0.62, 'The Sun', 1),
  ('Neptune', 164.8, 'The Sun', 1),
  ('Proxima Centauri b', 0.03, 'Proxima Centauri', 1),
  ('Gliese 876 b', 0.23, 'Gliese 876', 1);

INSERT INTO moons (moon_name, planet_id)
VALUES
  ('The Moon', 1),
  ('Phobos', 2),
  ('Deimos', 2),
  ('Naiad', 4),
  ('Thalassa', 4),
  ('Despina', 4),
  ('Galatea', 4),
  ('Larissa', 4),
  ('S/2004 N 1', 4),
  ('Proteus', 4),
  ('Triton', 4),
  ('Nereid', 4),
  ('Halimede', 4),
  ('Sao', 4),
  ('Laomedeia', 4),
  ('Psamathe', 4),
  ('Neso', 4);

