-- TARGETS
-- use the join 
-- use the aggregation 
-- username 是属于 user table 的
-- 所以这边实际上是选择了两张表的内容
SELECT
  contents,
  username ， photo_id
FROM
  comments
  JOIN users ON users.id = comments.user_id;

-- 全部选择
SELECT
  contents,
  username,
  user_id,
  users.id as id,
  photo_id
FROM
  comments
  JOIN users ON users.id = comments.user_id;

-- comment + photo id 
-- 会把所有的 comments 里面的元素过滤一遍，然后和 photos 连接
SELECT
  contents,
  url
FROM
  comments
  JOIN photos ON photos.id = comments.photo_id -- quiz 
SELECT
  title,
  name
FROM
  books
  JOIN authors on authors.id = books.author_id;

-- 使用 as 来自定义表名
SELECT
  contents,
  url
FROM
  COMMENTS AS c
  JOIN photos ON photos.id = c.photo_id

-- 现在每个 photo 里面又有一个 userid 与之对应
-- 现在，有一个 photo 里面的userid是在users里面没有对应的
-- 但是我们需要把所有的 photo都展现出来
INSERT INTO photos(url)
VALUES('http://helloworld');
SELECT * FROM photos;
-- 先添加一个 user 是null的数据
-- 目前，我们需要展示所有的 photo url， 不管有没有 user 与之对应
SELECT url, name 
FROM photos 
JOIN users ON users.id = photos.user_id;

-- 现在重新运行
SELECT url, username  
FROM photos 
JOIN users ON users.id = photos.user_id;
-- 最后那么user 没有展现出来
-- 但逻辑上是先把所有的photo都走一遍

-- left JOIN: 因为目标是把所有的photos（第一张表）的东西全部拿出来，
-- 所以left join 更符合， -> 现在 所有的photos 都出来
SELECT url, username  
FROM photos 
LEFT JOIN users ON users.id = photos.user_id;

-- right JOIN: 现在要现实所有的 user 
INSERT INTO users(username) VALUES ('Niko');
-- 添加一个新的user，没有信息与之对应。
SELECT url, username  
FROM photos 
RIGHT JOIN users ON users.id = photos.user_id;
-- 这样，尽管最先遍历的是 photos，但是，最后，inner完事了之后，会把所有的没有对应的users全部加进去

-- quiz 
select title, name 
from books 
left join authors on authors.id = books.author_id;

-- use join and the where together 
select 
  url, contents
from 
  comments
join 
  photos on photos.id = comments.photo_id
where 
  comments.user_id = photos.user_id

-- 三张表的链接
select 
  url, contents, username
from 
  comments
left join  
  photos on photos.id = comments.photo_id
left join 
  users on users.id = comments.user_id and users.id = photos.user_id;

-- quiz: 3 tables 
select title, name, rating 
from 
  books 
join 
  authors on books.author_id = authors.id 
join 
  reviews on reviews.book_id = books.id and reviews.reviewer_id = authors.id 
