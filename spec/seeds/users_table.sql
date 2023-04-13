DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name text,
  username text,
  email text,
  password text
);

TRUNCATE TABLE users RESTART IDENTITY;

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO users (name, username, email, password) 
  VALUES ('Jamie Lannister', '@jlannister', 'jlannyman@gmail.com', 'ILoveCersei');
INSERT INTO users (name, username, email, password)
  VALUES ('Michael Scott', '@michaelscott', 'dundermifflin@dundermifflin.com', 'Dundermifflin');
INSERT INTO users (name, username, email, password) 
  VALUES ('Kobe Bryant', '@blackmamba', 'betterthanjordan@gmail.com', 'IBoughtJordansLowKey');
INSERT INTO users (name, username, email, password) 
  VALUES ('Elon Musk', '@elon', 'iamfuture@teslaspacex.com', 'SpaceX > NASA');