CREATE TABLE IF NOT EXISTS contacts(
    id integer PRIMARY KEY,
    name text
);

CREATE TABLE IF NOT EXISTS email(
    address text,
    contact_id integer REFERENCES contacts(id)
);

CREATE TABLE IF NOT EXISTS phones(
    number text,
    contact_id integer REFERENCES contacts(id)
);

/* Почему не принимается с Foreign Key...?*/

INSERT INTO contacts (id, name) VALUES (0, 'Artemii');

SELECT * FROM contacts;
