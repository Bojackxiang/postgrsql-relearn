-- order products by price
-- SMALL -> LARGE
SELECT
  *
FROM
  products
ORDER BY
  -- 这边默认的添加了 ASC, 从小到大
  price;

-- order products by price
-- LARGE -> SMALL
SELECT
  *
FROM
  products
ORDER BY
  price DESC;

-- sort by string -> 按照字母表来排序 DESC ASC 还是能够继续使用的
-- 通过两个 条件来继续sort
SELECT
  *
FROM
  products
ORDER BY
  price,
  weight DESC;

-- 这种情况下，如果 price相同，则会按照 weijie 俩排序
--  排序的方法仍然有效
-- 关键词 offset 
-- 跳过 前 40 个数据，然后显示 从 41 - 最后的数据 
select
  *
FROM
  users OFFSET 40;

-- LIMIT 就显示前10个数字
SELECT
  *
FROM
  users
LIMIT
  10;

-- 最便宜的 5 个东西
SELECT
  *
FROM
  products
ORDER BY
  price DESC
LIMIT
  5 OFFSET 1 ； -- offset 智慧移动窗口，最后还是展示 5 个 数据
  -- limit + offse 基本上大多数都是使用在 pagination 的时候来展示数据
  -- 跳过 page number，每一页展现20个数据
SELECT
  *
FROM
  users OFFSET pageNum
LIMIT
  20;

--quiz
SELECT
  name
FROM
  phones
ORDER BY
  price DESC -- 由高到低
LIMIT
  2 -- 我只需要拿“前两个” row
  OFFSET 1;

-- 跳过第一个 row