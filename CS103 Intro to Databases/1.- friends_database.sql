CREATE TABLE friends(
  id INTEGER PRIMARY KEY,
  name TEXT UNIQUE,
  birthday DATE NOT NULL
);

INSERT INTO friends (id, name, birthday)
VALUES (1, 'Ororo Munroe', '1940-05-30');
INSERT INTO friends (id, name, birthday)
VALUES (2, 'Juan', '2007-10-29');
INSERT INTO friends (id, name, birthday)
VALUES (3, 'Marie', '1999-02-06');

UPDATE friends SET name = 'Storm' WHERE id = 1;
ALTER TABLE friends ADD COLUMN email TEXT;
UPDATE friends SET email = 'storm@codecademy.com' WHERE id = 1;
UPDATE friends SET email = 'juan@codecademy.com' WHERE id = 2;
UPDATE friends SET email = 'marie@codecademy.com' WHERE id = 3;
DELETE FROM friends WHERE name = 'Storm';

SELECT * FROM friends;      