DROP TABLE spaces;

CREATE TABLE spaces (
  id SERIAL PRIMARY KEY,
  space_name TEXT,
  description TEXT,
  price DECIMAL(10, 2)
);


CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username TEXT UNIQUE,
  email TEXT UNIQUE,
  pass_hash TEXT
);
