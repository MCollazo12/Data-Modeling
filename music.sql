-- from the terminal run:
-- psql < music.sql
DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music 

CREATE TABLE artists (
  artist_id SERIAL PRIMARY KEY,
  artist_name TEXT NOT NULL
);

CREATE TABLE producers (
  producer_id SERIAL PRIMARY KEY,
  producer_name TEXT NOT NULL
);

CREATE TABLE albums (
  album_id SERIAL PRIMARY KEY,
  album_name TEXT NOT NULL
);

CREATE TABLE songs (
  song_id SERIAL PRIMARY KEY,
  title TEXT UNIQUE NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE UNIQUE NOT NULL,
  album_id INTEGER UNIQUE REFERENCES albums(album_id),
  FOREIGN KEY (album_id) REFERENCES albums(album_id)
);

CREATE TABLE song_artists (
  song_id INTEGER REFERENCES songs(song_id),
  artist_id INTEGER REFERENCES artists(artist_id),
  PRIMARY KEY (song_id, artist_id)
);

CREATE TABLE song_producers (
  song_id INTEGER REFERENCES songs(song_id),
  producer_id INTEGER REFERENCES producers(producer_id),
  PRIMARY KEY (song_id, producer_id)
);

INSERT INTO
  artists (artist_name)
VALUES
  ('Hanson'),
  ('Queen'),
  ('Mariah Carey'),
  ('Boyz II Men'),
  ('Lady Gaga'),
  ('Bradley Cooper'),
  ('Nickelback'),
  ('Jay Z'),
  ('Alicia Keys'),
  ('Katy Perry'),
  ('Juicy J'),
  ('Maroon 5'),
  ('Christina Aguilera'),
  ('Avril Lavigne'),
  ('Destiny''s Child');

INSERT INTO
  albums (album_name)
VALUES
  ('Middle of Nowhere'),
  ('A Night at the Opera'),
  ('Daydream'),
  ('A Star Is Born'),
  ('Silver Side Up'),
  ('The Blueprint 3'),
  ('Prism'),
  ('Hands All Over'),
  ('Let Go'),
  ('The Writing''s on the Wall');

INSERT INTO
  producers (producer_name)
VALUES
  ('Dust Brothers'),
  ('Stephen Lironi'),
  ('Roy Thomas Baker'),
  ('Walter Afanasieff'),
  ('Benjamin Rice'),
  ('Rick Parashar'),
  ('Al Shux'),
  ('Max Martin'),
  ('Cirkut'),
  ('Shellback'),
  ('Benny Blanco'),
  ('The Matrix'),
  ('Darkchild');

INSERT INTO
  songs (
    title,
    duration_in_seconds,
    release_date,
    album_id
  )
VALUES
  ('MMMBop', 238, '1997-04-15', 1),
  ('Bohemian Rhapsody', 355, '1975-10-31', 2),
  ('One Sweet Day', 282, '1995-11-14', 3),
  ('Shallow', 216, '2018-09-27', 4),
  ('How You Remind Me', 223, '2001-08-21', 5),
  ('New York State of Mind', 276, '2009-10-20', 6),
  ('Dark Horse', 215, '2013-12-17', 7),
  ('Moves Like Jagger', 201, '2011-06-21', 8),
  ('Complicated', 244, '2002-05-14', 9),
  ('Say My Name', 240, '1999-11-07', 10);

INSERT INTO
  song_artists (song_id, artist_id)
VALUES
  (1, 1), -- 'MMMBop' by Hanson
  (2, 2), -- 'Bohemian Rhapsody' by Queen
  (3, 3), -- 'One Sweet Day' by Mariah Carey
  (3, 4), -- 'One Sweet Day' by Boyz II Men
  (4, 5), -- 'Shallow' by Lady Gaga
  (4, 6), -- 'Shallow' by Bradley Cooper
  (5, 7), -- 'How You Remind Me' by Nickelback
  (6, 8), -- 'New York State of Mind' by Jay Z
  (6, 9), -- 'New York State of Mind' by Alicia Keys
  (7, 10), -- 'Dark Horse' by Katy Perry
  (7, 11), -- 'Dark Horse' by Juicy J
  (8, 12), -- 'Moves Like Jagger' by Maroon 5
  (8, 13), -- 'Moves Like Jagger' by Christina Aguilera
  (9, 14), -- 'Complicated' by Avril Lavigne
  (10, 15); -- 'Say My Name' by Destiny's Child

INSERT INTO
  song_producers (song_id, producer_id)
VALUES
  (1, 1), -- 'MMMBop' by Dust Brothers
  (1, 2), -- 'MMMBop' by Stephen Lironi
  (2, 3), -- 'Bohemian Rhapsody' by Roy Thomas Baker
  (3, 4), -- 'One Sweet Day' by Walter Afanasieff
  (4, 5), -- 'Shallow' by Benjamin Rice
  (5, 6), -- 'How You Remind Me' by Rick Parashar
  (6, 7), -- 'New York State of Mind' by Al Shux
  (7, 8), -- 'Dark Horse' by Max Martin
  (7, 9), -- 'Dark Horse' by Cirkut
  (8, 10), -- 'Moves Like Jagger' by Shellback
  (8, 11), -- 'Moves Like Jagger' by Benny Blanco
  (9, 12), -- 'Complicated' by The Matrix
  (10, 13); -- 'Say My Name' by Darkchild