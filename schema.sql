CREATE TABLE authors
(
  id         INTEGER GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR,
  last_name  VARCHAR,

  PRIMARY KEY (id)
);

create table genres(
    id   int generated always as identity,
    name varchar(255),
    primary key(id)
);

create table sources(
    id   int generated always as identity,
    name varchar(255),
    primary key(id)
);

create table labels(
    id    int generated always as identity,
    title varchar(255),
    color varchar(255),
    primary key(id)
);

CREATE TABLE books
(
  ID           INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  PUBLISHER    VARCHAR,
  COVER_STATE  VARCHAR,
  PUBLISH_DATE DATE,
  ARCHIVED     BOOLEAN
);

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

create table music_albums(
    id           int generated always as identity,
    genre_id     int,
    author_id    int,
    source_id    int,
    label_id     int,
    publish_date date,
    on_spotify   boolean,
    archived     boolean,
    primary key(id),
    foreign key(genre_id) references genres(id),
    foreign key(author_id) references authors(id),
    foreign key(source_id) references sources(id),
    foreign key(label_id) references labels(id)
);
