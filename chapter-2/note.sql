-- use where to do the filter 
SELECT
  *
FROM
  cities
WHERE
  city_code < 5;

-- use where and between 
SELECT
  name,
  city_code
FROM
  cities
WHERE
  city_code BETWEEN 1
  AND 5;

-- use in to select : case sasentive 
SELECT
  name,
  city_code
FROM
  cities
WHERE
  name IN ('arizona', 'Sydney') -- use not in
SELECT
  name,
  city_code
FROM
  cities
WHERE
  name NOT IN ('arizona', 'Sydney') -- use mutiple search query in the select 
SELECT
  name,
  city_code
FROM
  cities
WHERE
  name IN ('arizona', 'Sydney')
  AND city_code = 5;

-- use mutiple search query in the select 
SELECT
  name,
  city_code
FROM
  cities
WHERE
  name IN ('arizona', 'Sydney')
  OR city_code = 5;

-- where and calcualtation  in the select 
SELECT
  name,
  city_code
FROM
  cities
WHERE
  city_code > city_code / 2;

-- using update to update a column number 
UPDATE
  cities
SET
  population = 1
WHERE
  city_code = 23;

-- ANCHOR DELETE FROM 
-- DELETE ONE ROLW FORM THE TABLE
DELETE FROM
  cities
WHERE
  population = 1;

-- ANCHOR INSERT INTO 
INSERT INTO
  cities(name, city_code, population)
VALUES
  ('Shanghai', 2, 3);