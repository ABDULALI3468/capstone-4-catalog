CREATE TABLE games (
  id INTEGER GENERATED ALWAYS AS IDENTITY,
  multiplayer BOOLEAN,
  archived BOOLEAN,
  last_played_at DATE,
  publish_date DATE,
  genre_id INTEGER,
  author_id INTEGER,
  source_id INTEGER,
  label_id INTEGER,
  PRIMARY KEY(id),
  FOREIGN KEY (genre_id) REFERENCES genres(id),
  FOREIGN KEY (author_id) REFERENCES authors(id),
  FOREIGN KEY (source_id) REFERENCES sources(id),
  FOREIGN KEY (label_id) REFERENCES labels(id)
);

CREATE TABLE authors (
  id INTEGER GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR,
  last_name VARCHAR,

  PRIMARY KEY(id)
);
