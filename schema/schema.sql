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

CREATE TABLE author (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    first_name VARCHAR(150),
    last_name VARCHAR(150)
)

CREATE TABLE game (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    genre_id INT,
    author_id INT,
    source_id INT,
    label_id INT,
    publish_date DATE NOT NULL,
    archived BOOLEAN,
    multiplayer BOOLEAN,
    last_played_at DATE NOT NULL,
    FOREIGN KEY (author_id) REFERENCES author(id),
    FOREIGN KEY (genre_id) REFERENCES genre(id),
    FOREIGN KEY (label_id) REFERENCES label(id),
    FOREIGN KEY (source_id) REFERENCES source(id)
)