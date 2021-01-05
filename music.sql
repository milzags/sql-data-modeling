-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

-- CREATE TABLE songs
-- (
--   id SERIAL PRIMARY KEY,
--   title TEXT NOT NULL,
--   duration_in_seconds INTEGER NOT NULL,
--   release_date DATE NOT NULL,
--   artists TEXT[] NOT NULL,
--   album TEXT NOT NULL,
--   producers TEXT[] NOT NULL
-- );

-- INSERT INTO songs
--   (title, duration_in_seconds, release_date, artists, album, producers)
-- VALUES
--   ('MMMBop', 238, '04-15-1997', '{"Hanson"}', 'Middle of Nowhere', '{"Dust Brothers", "Stephen Lironi"}'),
--   ('Bohemian Rhapsody', 355, '10-31-1975', '{"Queen"}', 'A Night at the Opera', '{"Roy Thomas Baker"}'),
--   ('One Sweet Day', 282, '11-14-1995', '{"Mariah Cary", "Boyz II Men"}', 'Daydream', '{"Walter Afanasieff"}'),
--   ('Shallow', 216, '09-27-2018', '{"Lady Gaga", "Bradley Cooper"}', 'A Star Is Born', '{"Benjamin Rice"}'),
--   ('How You Remind Me', 223, '08-21-2001', '{"Nickelback"}', 'Silver Side Up', '{"Rick Parashar"}'),
--   ('New York State of Mind', 276, '10-20-2009', '{"Jay Z", "Alicia Keys"}', 'The Blueprint 3', '{"Al Shux"}'),
--   ('Dark Horse', 215, '12-17-2013', '{"Katy Perry", "Juicy J"}', 'Prism', '{"Max Martin", "Cirkut"}'),
--   ('Moves Like Jagger', 201, '06-21-2011', '{"Maroon 5", "Christina Aguilera"}', 'Hands All Over', '{"Shellback", "Benny Blanco"}'),
--   ('Complicated', 244, '05-14-2002', '{"Avril Lavigne"}', 'Let Go', '{"The Matrix"}'),
--   ('Say My Name', 240, '11-07-1999', '{"Destiny''s Child"}', 'The Writing''s on the Wall', '{"Darkchild"}');

-- similar to the outer space example, the Artists and producers can be split into their own tables. 
-- each song can have many artists involved or producers involved. 
-- each artist can work with many producers
-- each producer can work with many artists

CREATE TABLE "songs" (
    "id" SERIAL   NOT NULL,
    "title" TEXT   NOT NULL,
    "duration" INTEGER   NOT NULL,
    "release_date" DATE   NOT NULL,
    "artist_id" INT   NOT NULL,
    "album" TEXT   NOT NULL,
    "producers_id" INT   NOT NULL,
    CONSTRAINT "pk_songs" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "artists" (
    "id" SERIAL   NOT NULL,
    "name" TEXT   NOT NULL,
    "works_with_producer" INTEGER   NOT NULL,
    CONSTRAINT "pk_artists" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "producers" (
    "id" SERIAL   NOT NULL,
    "name" TEXT   NOT NULL,
    "works_with_artist" INTEGER   NOT NULL,
    CONSTRAINT "pk_producers" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "songs" ADD CONSTRAINT "fk_songs_artist_id" FOREIGN KEY("artist_id")
REFERENCES "artists" ("id");

ALTER TABLE "songs" ADD CONSTRAINT "fk_songs_producers_id" FOREIGN KEY("producers_id")
REFERENCES "producers" ("id");

ALTER TABLE "artists" ADD CONSTRAINT "fk_artists_id_works_with_producer" FOREIGN KEY("id", "works_with_producer")
REFERENCES "producers" ("works_with_artist", "id");