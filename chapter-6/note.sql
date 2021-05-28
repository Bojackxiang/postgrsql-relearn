
-- QUIZ 1 
SELECT piad, COUNT(*)
FROM paid
GROUP BY piad;

-- QUIZ 2
SELECT first_name, last_name, orders.paid as paid 
FROM users 
JOIN orders ON orders.user_id = users.id;