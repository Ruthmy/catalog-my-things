/* CREATE DATABASE */

CREATE DATABASE catalog_app;

-- Enter into the database
\c catalog_app;

-- Create the tables --

-- Create genre table
CREATE TABLE Genre(
  id      INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name    varchar(50),
);

/* Create Authors table */
CREATE TABLE Author(
  id      INT GENERATED ALWAYS AS IDENTITY,
  first_name    varchar(50),
  last_name     varchar(50),
  items         varchar(50)[],
  PRIMARY KEY(id)
);

-- Create items table (parent table)
CREATE TABLE Item(
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  genre_id INT REFERENCES Genre(id),
  author_id INT REFERENCES Author(id),
  label_id INT REFERENCES Label(id),
  publish_date  DATE,
  archived BOOLEAN,
);

/* Create Games table (child table of item) */
CREATE TABLE Games(
  id      INT GENERATED ALWAYS AS IDENTITY,
  genre   varchar(50),
  author  varchar(50),
  label   varchar(50),
  publish_date  date,
  archived  bool,
  multiplayer bool,
  last_played_at  date,
  author_id   INT REFERENCES Author(id),
  genre_id INT REFERENCES Genre(id),
  label_id INT REFERENCES Label(id),
  PRIMARY KEY(id)
);

-- Create music album table (child table of item)
CREATE TABLE MusicAlbum(
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  item_id INT REFERENCES Item(id),
  on_spotify BOOLEAN
);
