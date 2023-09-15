-- create table labels
CREATE TABLE labels(
  id INT, 
  title VARCHAR(255), 
  color VARCHAR(255), 
  PRIMARY KEY(id)
);


--  create table books
CREATE TABLE books(
    id INT, 
    name VARCHAR(255), 
    published_date DATE, 
    publisher VARCHAR(255), 
    cover_state VARCHAR(255), 
    archived BOOLEAN, 
    author_id INT REFERENCES authors(id), 
    label_id INT REFERENCES labels(id), 
    genre_id INT REFERENCES genres(id), 
    PRIMARY KEY(id)
);