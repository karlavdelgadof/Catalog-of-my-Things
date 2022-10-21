/* Create new music_albums table */
CREATE TABLE music_album (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  genre_id INT FOREIGN KEY REFERENCES genres(id),
  author_id INT FOREIGN KEY REFERENCES authors(id),
  source_id INT FOREIGN KEY REFERENCES sources(id),
  label_id INT FOREIGN KEY REFERENCES labels(id),
  publish_date DATE NOT NULL,
  archived BOOLEAN,
  on_spotify BOOLEAN,
) 

/* Create new genre table */
CREATE TABLE genre (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(150)
) 