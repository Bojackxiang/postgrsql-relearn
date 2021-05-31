-- POSTGRES 自带的 function
-- GREATEST
-- 输入的是一个好多 row
SELECT
  GREATEST(20, 30, 40);

-- 使用场景，比如打车，起步价就是20块了，你中间再少也得由20块
-- greatest 实际上选的是最小的值
-- 最少也的有 30
SELECT
  name,
  weight,
  GREATEST(30, 2 * product_weight)
FROM
  products;

-- 选的是醉倒的那个数字
SELECT
  name,
  weight,
  GREATEST(30, 2 * product_weight)
FROM
  products;

-- case 关键词
SELECT
  name,
  price CASE
    WHEN price > 600 THEM 'high'
    WHEN price > 300 THEM 'mid' ESLE 'cheap'
  END
FROM
  products;