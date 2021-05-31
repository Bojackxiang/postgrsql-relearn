-- 选择最高的玩具价格
SELECT
  name,
  price
FROM
  prodicts
WHERE
  price > (
    SELECT
      MAX(price)
    FROM
      product
    WHERE
      department = 'Toys'
  );

-- quiz 
-- 把每个 phone 的 price 和 最高价格的phone 之间的价格做比较，宾切打出来ratio
SELECT
  name,
  price,
  price /(
    SELECT
      MAX(price)
    FROM
      phones
  ) as price_ratio
FROM
  phones;

-- sub query 一定要有 alias
SELECT
  name,
  price_weight_ratio
FROM
  (
    SELECT
      name,
      price / weight as price_weight_ratio
    FROM
      prodicts
  ) AS new_select -- !这边一定要给 subquery 一个 alias 的名字, 否则会报错的
where
  price_weight_ratio > 5;

-- quiz
SELECT
  MAX(asverage_price) AS max_average_price
FROM
  (
    SELECT
      manufacturer,
      AVG(price) AS asverage_price
    FROM
      phones
    GROUP BY
      manufacturer
  );

-- 如果中间要添加一个where 的话，subquery 就要使用 AS 来给一个暂时的名字
-- join + subquery 的组合
SELECT
  first_name
FROM
  users
  JOIN (
    SELECT
      user_id
    FROM
      ORDERS
    WHERE
      product_id = 3
  ) as q ON q.order_id = users.id;

-- sub query + where 的结合
SELECT
  id
FROM
  orders
WHERE
  product_id IN (
    SELECT
      id
    FROM
      products
    WHERE
      price / weight > 50;

);

-- sub query + where 
SELECT
  name,
  price
FROM
  products
WHERE
  price > (
    SELECT
      AVG(price)
    FROM
      product
  );

-- QUIZ 
SELECT
  name,
  price
FROM
  phones
WHERE
  price > (
    SELECT
      price
    FROM
      phones
    WHERE
      name = 'S5620 Monte'
  );

-- NOTE: where 可以选择 是 在一个范围里面找，或者是对某一个值进行判断
-- ALL 的使用: 比所有的 row 都要高， 也就是 大于 max
SELECT
  NAME,
  department,
  price
FROM
  products
WHERE
  price > ALL (
    SELECT
      price
    FROM
      products
    WHERE
      department = 'Industrial'
  );

-- SOME: 至少比 (1,2,3) 中的某一个要大，就行
SELECT
  NAME,
  department,
  price
FROM
  products
WHERE
  price > SOME (
    SELECT
      price
    FROM
      products
    WHERE
      department = 'Industrial'
  );

-- NOTE FROM 后面的 subquery 要加 alias
-- QUIZ 
SELECT
  name
FROM
  phones
WHERE
  price > ALL (
    SELECT
      price
    FROM
      phones
    WHERE
      manufacturer = 'Samsung'
  );

-- 对于表自身的操作
-- 选择 每个 department 中 价格最贵的产品
-- 这边比较重要
SELECT
  name,
  department,
  price
FROM
  prodicts AS p1
WHERE
  p1.price = (
    SELECT
      MAX(price) AS p2
    FROM
      products
    WHERE
      p1.department = p2.pdepartment
  );

-- 在 select 中 添加一个 subquery，来选择
-- 查看每一个 product 有多少个 order
-- 这边可以看做是 join 了 products 和 orders 两张表格
-- 然后再 GROUP BY 一下 
-- 对每一个 row 进行处理，每一个 row 都去 orders 里面找和当前 row id (product is) 相同的order
SELECT
  p1.name,
  (
    SELECT
      COUNT(*)
    FROM
      orders AS o1
    WHERE
      o1.product_id = p1.id
  )
FROM
  products AS p1;

-- 直接 select： 能够直接 select single value ： ANS： YES
SELECT (
  SELECT price, name FROM products
);
-- 在这里，无论你添加什么，都是会报错的，没有 from，你只能选择一个 value 

SELECT (
  SELECT AVG(price) FROM products
) / (
  SELECT MAX(price) FROM products
);