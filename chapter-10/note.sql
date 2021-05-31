-- DISTINCT 
-- 把所有的 unique 的数据全部打出来
SELECT
  COUNT(DISTINCT department)
FROM
  products;

-- distinct 只能是一个
SELECT
  DISTINCT department,
  name
FROM
  products;

-- quiz 
SELECT
  COUNT(DISTINCT manufacturer)
FROM
  phones;