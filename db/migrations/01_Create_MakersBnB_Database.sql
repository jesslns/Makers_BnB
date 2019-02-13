DROP TABLE spaces;
DROP TABLE users;


CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username TEXT UNIQUE,
  email TEXT UNIQUE,
  pass_hash TEXT
);

CREATE TABLE spaces (
  id SERIAL PRIMARY KEY,
  space_name TEXT,
  description TEXT,
  price DECIMAL(10, 2),
  owner_id INTEGER,
  FOREIGN KEY (owner_id) REFERENCES users (id)
);
