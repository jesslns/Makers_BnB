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

INSERT INTO users (username, email, pass_hash) VALUES ('Wario', 'wario@hobbit.com', 'hashash');
INSERT INTO users (username, email, pass_hash) VALUES ('A_Klingon', 'klingy@ming.com', 'doublehash');
INSERT INTO users (username, email, pass_hash) VALUES ('Karl Marx', 'karl@marx.com', 'proletariat');

INSERT INTO spaces (space_name, description, price, owner_id) VALUES ('Wario Bestest Western Lodge Space', 'The best place in the world to stay in. Close to a mountain and peasant village.', 95, 1);
INSERT INTO spaces (space_name, description, price, owner_id) VALUES ('Brownstone Studio in Brooklyn, New York City', 'This is a comfortable studio apartment with exposed brick that has a true city feeling. This studio has a newly renovate bathroom and kitchen with stain steel appliances. The space fits four and is centrally located on a Historic quiet street. This unit is loaded with cable and wifi. Just blocks away from public transportation A and G train lines. And minutes away from the bus route B25 B26 and the B44. Come and explore the charm of Bed-Stuy.', 145, 2);
INSERT INTO spaces (space_name, description, price, owner_id) VALUES ('Lovely three bedroom flat in London', 'Cosy and relaxing home in vibrant Tooting, south London. Great transport links to central London (35mins) and beyond. Easy access for Wimbledon and Queens Club tennis. Tooting has many buzzy bars and restaurants featuring food from around the world.', 100, 3);
