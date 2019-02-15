TRUNCATE users, spaces, bookings RESTART IDENTITY;

DROP TABLE spaces;
DROP TABLE users;
DROP TABLE bookings;

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

CREATE TABLE bookings (
  id SERIAL PRIMARY KEY,
  space_id INTEGER,
  FOREIGN KEY (space_id) REFERENCES spaces (id),
  user_id INTEGER,
  FOREIGN KEY (user_id) REFERENCES users (id),
  booking_date DATE NOT NULL
);
