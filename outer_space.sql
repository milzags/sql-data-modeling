-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

-- CREATE TABLE planets
-- (
--   id SERIAL PRIMARY KEY,
--   name TEXT NOT NULL,
--   orbital_period_in_years FLOAT NOT NULL,
--   orbits_around TEXT NOT NULL,
--   galaxy TEXT NOT NULL,
--   moons TEXT[]
-- );

-- INSERT INTO planets
--   (name, orbital_period_in_years, orbits_around, galaxy, moons)
-- VALUES
--   ('Earth', 1.00, 'The Sun', 'Milky Way', '{"The Moon"}'),
--   ('Mars', 1.88, 'The Sun', 'Milky Way', '{"Phobos", "Deimos"}'),
--   ('Venus', 0.62, 'The Sun', 'Milky Way', '{}'),
--   ('Neptune', 164.8, 'The Sun', 'Milky Way', '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
--   ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way', '{}'),
--   ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way', '{}');

-- SUGGESTIONS FOR IMPROVEMENTS TO THIS SCHEMA:
-- in the planets table, create has_moons as a boolean

-- create a separate table for moons with moon_id, planet_orbiting_id. You could then join the two tables on moons.planet_orbiting_id = planets.id. Suggested revised schema shown below. 


CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around TEXT NOT NULL,
  galaxy TEXT NOT NULL,
  has_moons BOOLEAN
);

CREATE TABLE moons 
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  name_of_planet_orbiting TEXT
);

INSERT INTO planets
  (name, orbital_period_in_years, orbits_around, galaxy, has_moons)
VALUES
  ('Earth', 1.00, 'The Sun', 'Milky Way', true),
  ('Mars', 1.88, 'The Sun', 'Milky Way', true),
  ('Venus', 0.62, 'The Sun', 'Milky Way', false),
  ('Neptune', 164.8, 'The Sun', 'Milky Way', true),
  ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way', false),
  ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way', false);

INSERT INTO moons
  (name, name_of_planet_orbiting)
VALUES
  ('The Moon','Earth'),
  ('Phobos','Mars'),
  ('Demios','Mars'),
  ('Naiad','Neptune'),
  ('Thalassa','Neptune'),
  ('Despina','Neptune'),
  ('Galatea','Neptune'),
  ('Larissa','Neptune'),
  ('S/2004 N1','Neptune'),
  ('Proteus','Neptune'),
  ('Triton','Neptune'),
  ('Nereid','Neptune'),
  ('Halimede','Neptune'),
  ('Sao','Neptune'),
  ('Laomedeia','Neptune'),
  ('Psamathe','Neptune'),
  ('Neso','Neptune');


