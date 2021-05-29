-- 先选择最贵的 四个铲平
SEELCT name
FROM
  products
ORDER BY
  price DESC
LIMIT
  4;

-- 根据计算属性 (邮费) 来进行sort  
SELECT
  *
FROM
  products
ORDER BY
  price / weight DESC;

-- union 的基本概念和用法：union 两个 subset of one same table;
(
  SEELCT name
  FROM
    products
  ORDER BY
    price DESC
  LIMIT
    4
)
UNION
(
  SELECT
    *
  FROM
    products
  ORDER BY
    price / weight DESC
) -- 按照上面的方法，union 会去啊少 数据，因为已经就饿喝了，所以使用 union all 可以解决
(
  SEELCT *
  FROM
    products
  ORDER BY
    price DESC
  LIMIT
    4
)
UNION
ALL (
  SELECT
    *
  FROM
    products
  ORDER BY
    price / weight DESC
) -- union VS. union all
-- union： remove duplicated data 
-- union all: keep duplicated data 
-- ! union 两个 rows的时候，select 的东西一定要相同，
-- ! 要不然就会报错的
-- intersection 
-- 下面的这个是一个例子： 找出所有的 间隔最高，而且邮费最高的 4个数据
(
  SELECT
    *
  FROM
    products
  order by
    price DESC
  LIMIT
    4
) INTERSECTION ALL(
  SELECT
    *
  FROM
    products
  order by
    price / weight DESC
  LIMIT
    4
) -- EXCEPT 
-- (A) except (B): 如果 A 中的 row 出现在 B 里面，那么 A 就要 挪除该数据
-- quiz 
-- 下面这个quiz 很有意思 -> 结合了 union，grouo by 
SELECT
  manufacturer
FROM
  phones
WHERE
  price < 170
UNION
SELECT
  *
FROM
  phones
GROUP BY
  manufacturer
HAVING COUNT(*) > 2;