DROP TABLE IF EXISTS cards, decks;

CREATE TABLE cards(
  id                  SERIAL PRIMARY KEY,
  country             TEXT NOT NULL UNIQUE,
  capital             TEXT NOT NULL UNIQUE,
  correctly_answered  BOOLEAN NOT NULL,
  deck_id             INTEGER NOT NULL
);

CREATE TABLE decks(
  id          SERIAL PRIMARY KEY,
  category    TEXT NOT NULL UNIQUE
);
