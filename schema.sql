CREATE TABLE books
(
  ID           INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  PUBLISHER    VARCHAR,
  COVER_STATE  VARCHAR,
  PUBLISH_DATE DATE,
  ARCHIVED     BOOLEAN
);

create table genres(
    id   int generated always as identity,
    name varchar(255),
    primary key(id)
);

create table authors(
    id         int generated always as identity,
    first_name varchar(255),
    last_name  varchar(255),
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
