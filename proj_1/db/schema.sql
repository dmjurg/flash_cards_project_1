DROP TABLE IF EXISTS cards;

CREATE TABLE cards (
  id         SERIAL PRIMARY KEY,
  country    TEXT NOT NULL UNIQUE,
  capital    TEXT NOT NULL
);
