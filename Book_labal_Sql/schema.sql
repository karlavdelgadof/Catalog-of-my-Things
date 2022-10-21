CREATE TABLE label (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    title VARCHAR(150),
    color VARCHAR(100)
)

CREATE TABLE books (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    genre_id INT,
    author_id INT,
    source_id INT,
    label_id INT,
    publish_date DATE NOT NULL,
    archived BOOLEAN,
    publisher VARCHAR(100),
    cover_state VARCHAR(150),
    FOREIGN KEY (author_id) REFERENCES author(id),
    FOREIGN KEY (genre_id) REFERENCES genre(id),
    FOREIGN KEY (label_id) REFERENCES label(id),
    FOREIGN KEY (source_id) REFERENCES source(id)
)
