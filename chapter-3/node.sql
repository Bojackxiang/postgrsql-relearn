-- ANCHOR create a table with id 
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  -- NOTE： serial 是 psql 专门有的东西，会自己上身
  username VARCHAR(50)
);

INSERT INTO
  users (username)
VALUES
  ('monahan93'),
  ('pferrer'),
  ('si93onis'),
  ('99stroman');

SELECT
  *
FROM
  users;

-- ANCHOR create photo table and reference the user id 
CREATE TABLE photos(
  id SERIAL PRIMARY KEY,
  url VARCHAR(200),
  user_id INTEGER REFERENCES users(id)
);

INSERT INTO
  photos (url, user_id)
VALUES
  ('http://one.jpg', 4);

-- ANCHOR insert more images into the tables
INSERT INTO
  photos (url, user_id)
VALUES
  ('http://two.jpg', 1),
  ('http://25.jpg', 1),
  ('http://36.jpg', 1),
  ('http://754.jpg', 2),
  ('http://35.jpg', 3),
  ('http://256.jpg', 4);

-- ANCHOR select target photos;  should have 2 rows back;
select
  *
FROM
  photos
WHERE
  user_id = 4;

-- ANCHOR first runnin join on for two tables. 
SELECT
  *
FROM
  photos
  JOIN users ON users.id = photos.user_id;

-- ANCHOR create a atable and set its delete options to CASCADE 
CREATE TABLE photos(
  id SERIAL PRIMARY KEY,
  url VARCHAR(200),
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE
);

INSERT INTO
  photos (url, user_id)
VALUES
  ('http://two.jpg', 1),
  ('http://25.jpg', 1),
  ('http://36.jpg', 1),
  ('http://754.jpg', 2),
  ('http://35.jpg', 3),
  ('http://256.jpg', 4);

-- ANCHOR NOW DELETE 
DELETE FROM users WHERE id = 1;
-- 在 cascade 的情况下，删除了 main table 里面的 某一个数据之后，子数据也会直接被删除

-- ANCHOR create a atable and set its delete options to set null 
CREATE TABLE photos(
  id SERIAL PRIMARY KEY,
  url VARCHAR(200),
  user_id INTEGER REFERENCES users(id) ON DELETE SET NULL
);