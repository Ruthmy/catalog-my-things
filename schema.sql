/* CREATE DATABASE */

/* Create Games table */
CREATE TABLE games(
  id      INT GENERATED ALWAYS AS IDENTITY,
  genre   varchar(50),
  author  varchar(50),
  label   varchar(50),
  publish_date  date,
  archived  bool,
  multiplayer bool,
  last_played_at  date,
  PRIMARY KEY(id)
);
