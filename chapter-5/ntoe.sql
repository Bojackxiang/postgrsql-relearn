-- group 就是把所有 unique 的数据全部取出来
select
  user_id
from
  comments
group by
  user_id;

-- 所以你前面是 select xxx 后面 group by 旧钥匙 xxx
-- 下面这个就会把所有的 unitqu 的content 全部取出来
select
  contents
from
  comments
group by
  contents;

-- 一个简单的 example 来展示基本的 count 数据
SELECT
  count(id) -- sum min max avg 
FROM
  comments;

--
-- group by 最主要的就是能够把所有的是某一个 id 下面的东西全部那处理啊组成一个 group
-- 这个情况下， database 还会创建一个 temp table 来存储这个东西， 也就是好多个小表
--
-- 在 greoup by 的基础上，对每个小表进行 max id的操作
SELECT
  user_id,
  MAX(id)
FROM
  comments
GROUP BY
  user_id;

-- 下面就能选择出，每一个 user id 里面有多少个 comments 
-- 一个用户创建了多少个 comments
SELECT
  user_id,
  COUNT(id)
FROM
  comments
GROUP BY
  user_id;

-- 下面这个 更 make sense
SELECT
  user_id,
  COUNT(id) as num_comments_created
FROM
  comments
GROUP BY
  user_id;

-- 数据库里面，我们刚添加了一个 user id 是null的数据
-- 注意，⚠️，当我们使用 couint 的时候，null 是不会算在内的
SELECT
  count(user_id)
FROM
  photos;

-- 这个 count(*)能够选择所有的数据
SELECT
  user_id,
  COUNT(*)
FROM
  comments
GROUP BY
  user_id;

-- group by 之后，原来的id就会变得无效，在select 她就会报错
SELECT
  COUNT(id),
  photo_id
FROM
  comments
GROUP BY
  photo_id;

-- 上面的 id 可一天换成 * 
-- group by 不能group by 表格原生的id
SELECT
  photo_id,
  COUNT(*)
FROM
  comments
GROUP BY
  photo_id;

-- HAVE: group by 中的 where
-- ⚠️： 这边的 count(*) 也会是成为一个 col 的名称
SELECT photo_id, COUNT(*)
FROM comments
WHERE photo_id > 3
GROUP BY photo_id
HAVING COUNT(*) > 2; 


-- quiz 
-- ⚠️⚠️⚠️： 这个太重要了！ group by 之后，对group by 里面的小的表格里面的数据进行处理的时候就这么使用
SELECT manufacturer, SUM(price*units_sold) as revenue
FROM phones
GROUP BY manufacturer
HAVING SUM(units_sold*price) > 2000000; -- 这边调换顺序也没关系，会重新计算一遍


