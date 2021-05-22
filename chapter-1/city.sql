drop table cities;

create table cities(
  name varchar(100),
  city_code integer,
  country varchar(100),
  population integer
);

-- insert single data;
INSERT INTO
  cities (name, city_code, country, population)
VALUES
  ('Arizona', 23, 'US', 2000000);

-- insert mutiple slice of data; 
INSERT INTO
  cities (name, city_code, country, population)
VALUES
  ('Arizona', 23, 'US', 2000000),
  ('San diago', 1, 'US', 2000000);

-- select 
SELECT
  *
FROM
  cities;

SELECT
  name,
  city_code
FROM
  cities;

-- select + 计算 
SELECT
  name,
  population / city_code
FROM
  cities;

-- select + 计算 + 重命名
SELECT
  name,
  population / city_code AS density
FROM
  cities;

-- string operator 
SELECT
  name || '-' || name AS city_country
FROM
  cities;

SELECT
  CONCAT(name ， '-' ， city_name) AS city_country
FROM
  cities;

SELECT
  LOWER(country) as country_name,
  UPPER(name)
FROM
  cities;

SELECT
  CONCAT(country || '--' || UPPER(name)) as country_name,
  UPPER(name)
FROM
  cities;

SELECT
  CONCAT(country || '--' || UPPER(name)) as country_name,
  UPPER(name),
  LENGTH(NAME) AS name_length
FROM
  cities;