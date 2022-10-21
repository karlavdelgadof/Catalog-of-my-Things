/* Create new movie table */
CREATE TABLE movie (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  genre_id INT FOREIGN KEY REFERENCES genres(id),
  author_id INT FOREIGN KEY REFERENCES authors(id),
  source_id INT FOREIGN KEY REFERENCES sources(id),
  label_id INT FOREIGN KEY REFERENCES labels(id),
  publish_date DATE NOT NULL,
  archived BOOLEAN,
  silent BOOLEAN,
) 

/* Create new source table */
CREATE TABLE source (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(150)
) 